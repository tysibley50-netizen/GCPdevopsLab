resource "google_artifact_registry_repository" "app_repo" {
  location	= var.region
  project = var.project_id
  repository_id = "app-repo"
  description	= "Docker repository for Cloud Run application images"
  format	= "DOCKER"
}

source "google_artifact_registry_repository_iam_member" "app_repo_writer" {
    project    = var.project_id
      location   = google_artifact_registry_repository.app_repo.location
        repository = google_artifact_registry_repository.app_repo.name
          role       = "roles/artifactregistry.writer"
            member     = "serviceAccount:${var.deploy_sa_email}"
          }
