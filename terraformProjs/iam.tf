resource "google_service_account" "cloud_run_sa" {
  account_id   = "cloud-run-runtime-sa"
  display_name = "Cloud Run Runtime Service Account"
}

# Grant Accessor role specifically to this secret (Least Privilege)
resource "google_secret_manager_secret_iam_member" "secret_access" {
  project   = var.project_id
  secret_id = google_secret_manager_secret.api_key.secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${google_service_account.cloud_run_sa.email}"
}
