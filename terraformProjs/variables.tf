variable "project_id" {
  type        = string
  description = "Project id of my at home GCP project"
}
variable "google_region" {
  type        = string
  description = "The google region where my bucket sits"
} 
variable "github_repository" {
  type        = string
  description = "my github rep in `owner/repo` format"
}

variable "container_image" {
  type = string
  default = "us-east1-docker.pkg.dev/project-1f03d34e-6e19-45e0-a6a/app-repo/app:latest"
}





