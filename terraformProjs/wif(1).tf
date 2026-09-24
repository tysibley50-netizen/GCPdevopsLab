# The WIF pool, WIF provider, and CI/CD service account are created ONCE,
# manually, via bootstrap_wif.sh — run by a human with elevated project
# access. Terraform does NOT manage or even read the pool/provider here:
# hashicorp/google has no data source for either resource type, and we
# don't want the CI identity creating or modifying its own auth pool
# anyway. Instead we derive the provider's resource name as a plain
# string from the project number plus the fixed IDs chosen in
# bootstrap_wif.sh, and read the service account in as a real data
# source (google_service_account IS supported).

data "google_project" "current" {
  project_id = var.project_id
}

locals {
  # Must match POOL_ID and PROVIDER_ID in bootstrap_wif.sh exactly
  workload_identity_pool_id     = "github-actions-pool"
  workload_identity_provider_id = "github-actions-provider"

  workload_identity_provider_name = "projects/${data.google_project.current.number}/locations/global/workloadIdentityPools/${local.workload_identity_pool_id}/providers/${local.workload_identity_provider_id}"
}

data "google_service_account" "github_actions_sa" {
  account_id = "github-actions-cicd-sa"
}
