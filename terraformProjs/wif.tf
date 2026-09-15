# Enable required APIs for WIF and STS
resource "google_project_service" "wif_apis" {
 for_each = toset([
	"iamcredentials.googleapis.com",
	"sts.googleapis.com",
	"iam.googleapis.com"
])
 project		= var.project_id
 service		= each.key
 disable_on_destroy 	= false
}

 # Creating the Workload Identity Pool
resource "google_iam_workload_identity_pool" "github_pool" {
  workload_identity_pool_id = "github-actions-pool"
  display_name		   = "Github Actions Pool"
  description		   = "Identity pool for Github Actions CI/CD pipeline"
  depends_on		   = [google_project_service.wif_apis]
}
# Create the Workload Identity Provider for GitHub OIDC 
resource "google_iam_workload_identity_pool_provider" "github_provider" {
  workload_identity_pool_id = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-actions-provider"
  display_name                       = "GitHub Actions Provider"

  attribute_mapping = {
    "google.subject"  = "assertion.sub"
    "attribute.actor" = "assertion.actor"
    "attribute.repository" = "assertion.repository"
    "attribute.owner" = "assertion.owner"
  }
  # Security Boundary: Restrict Auth. to only your specific repo
  attribute_condition = "assertion.repository == '${var.github_repository}'"

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}
# 3. Dedicated service account used by GitHub actions to deploy infrastructure
resource "google_service_account" "github_actions_sa" {
  account_id  = "github-actions-cicd-sa"
  display_name = "Github Actions CI/CD Service Account"
}

# 4. Allow Github Actions (via WIF Pool) to impersonate the CI/CD Serv. account
resource "google_service_account_iam_member" "wif_impersonation" {
  service_account_id = google_service_account.github_actions_sa.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_pool.name}/attribute.repository/${var.github.repository}"
}
# 5. Grant infrastructure provisioning roles to the CI/CD Service Account
resource "google_project_iam_member" "cicd_roles" {
  for_each = toset([
    "roles/run.admin",
    "roles/secretmanager.admin",
    "roles/compute.networkAdmin",
    "roles/iam.serviceAccountUser",
    "roles/storage.objectAdmin", # for GCS state file
    "roles/monitoring.alertPolicyEditor",
    "roles/artifactregistry.admin"
  ])
  project = var.project_id
  role    = each.key
  member  = "serviceAccount:${google_service_account.
  github_actions_sa.email}"


}
#
