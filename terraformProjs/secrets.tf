resource "google_secret_manager_secret" "api_key" {
  secret_id = "app-api-key"

  replication {
    user_managed {
      replicas {
        location = var.google_region
      }
    }
  }
}

resource "google_secret_manager_secret_version" "api_key_initial" {
  secret      = google_secret_manager_secret.api_key.id
  secret_data = "initial-placeholder-secret-value"
}
