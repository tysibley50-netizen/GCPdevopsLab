#!/usr/bin/env bash
set -euo pipefail

# ── One-time manual bootstrap ────────────────────────────────────────────
# Run this locally, authenticated as YOURSELF (gcloud auth login), not as
# the CI service account. This creates the WIF pool, provider, and CI/CD
# service account that GitHub Actions authenticates as — Terraform can't
# safely create these itself, since the CI identity can't be responsible
# for creating (or granting permissions to) itself.
# ──────────────────────────────────────────────────────────────────────

PROJECT_ID="project-1f03d34e-6e19-45e0-a6a"   # <-- fill in your real project ID
GITHUB_REPO="tysibley50-Netizen/GCPdevopsLab" # <-- e.g. "jsmith/GCPdevopsLab"
POOL_ID="github-actions-pool"
PROVIDER_ID="github-actions-provider"
SA_ID="github-actions-cicd-sa"

PROJECT_NUMBER=$(gcloud projects describe "$PROJECT_ID" --format="value(projectNumber)")

echo "== Enabling required APIs =="
gcloud services enable \
  iamcredentials.googleapis.com \
  sts.googleapis.com \
  iam.googleapis.com \
  --project="$PROJECT_ID"

echo "== Creating Workload Identity Pool =="
gcloud iam workload-identity-pools create "$POOL_ID" \
  --project="$PROJECT_ID" \
  --location="global" \
  --display-name="Github Actions Pool" \
  --description="Identity pool for Github Actions CI/CD pipeline"

echo "== Creating Workload Identity Provider (GitHub OIDC) =="
gcloud iam workload-identity-pools providers create-oidc "$PROVIDER_ID" \
  --project="$PROJECT_ID" \
  --location="global" \
  --workload-identity-pool="$POOL_ID" \
  --display-name="GitHub Actions Provider" \
  --attribute-mapping="google.subject=assertion.sub,attribute.actor=assertion.actor,attribute.repository=assertion.repository,attribute.owner=assertion.owner" \
  --attribute-condition="assertion.repository == '${GITHUB_REPO}'" \
  --issuer-uri="https://token.actions.githubusercontent.com"

echo "== Creating CI/CD service account =="
gcloud iam service-accounts create "$SA_ID" \
  --project="$PROJECT_ID" \
  --display-name="Github Actions CI/CD Service Account"

SA_EMAIL="${SA_ID}@${PROJECT_ID}.iam.gserviceaccount.com"

echo "== Allowing GitHub Actions (via WIF) to impersonate the SA =="
gcloud iam service-accounts add-iam-policy-binding "$SA_EMAIL" \
  --project="$PROJECT_ID" \
  --role="roles/iam.workloadIdentityUser" \
  --member="principalSet://iam.googleapis.com/projects/${PROJECT_NUMBER}/locations/global/workloadIdentityPools/${POOL_ID}/attribute.repository/${GITHUB_REPO}"

echo "== Granting infrastructure-provisioning roles to the CI/CD SA =="
ROLES=(
  "roles/run.admin"
  "roles/secretmanager.admin"
  "roles/compute.networkAdmin"
  "roles/iam.serviceAccountUser"
  "roles/iam.serviceAccountAdmin"      # NEW: needed to create cloud_run_sa in iam.tf
  "roles/storage.objectAdmin"          # for GCS state file
  "roles/monitoring.alertPolicyEditor"
  "roles/artifactregistry.admin"
)
for role in "${ROLES[@]}"; do
  gcloud projects add-iam-policy-binding "$PROJECT_ID" \
    --member="serviceAccount:${SA_EMAIL}" \
    --role="$role" \
    --condition=None
done

echo
echo "== DONE. Set these as GitHub Actions repository variables: =="
echo "GCP_SA_EMAIL       = ${SA_EMAIL}"
echo "GCP_WIF_PROVIDER   = projects/${PROJECT_NUMBER}/locations/global/workloadIdentityPools/${POOL_ID}/providers/${PROVIDER_ID}"
