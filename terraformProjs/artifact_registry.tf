resource "google_artifact_registry_repository" "app_repo" {
  location	= var.region
  repository_id = "app-repo"
  description	= "Docker repository for Cloud Run application images"
  format	= "DOCKER"
}
