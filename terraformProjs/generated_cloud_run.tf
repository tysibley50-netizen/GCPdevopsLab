# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "projects/project-1f03d34e-6e19-45e0-a6a/locations/us-east1/services/tiny-clickops-service"
resource "google_cloud_run_v2_service" "tiny_clickops_service_871657323406" {
  annotations      = {}
  client           = "gcloud"
  client_version   = "584.0.0"
  custom_audiences = []
  description      = null
  ingress          = "INGRESS_TRAFFIC_ALL"
  labels           = {}
  launch_stage     = "GA"
  location         = "us-east1"
  name             = "tiny-clickops-service"
  project          = "project-1f03d34e-6e19-45e0-a6a"
  template {
    annotations           = {}
    encryption_key        = null
    execution_environment = null
    labels = {
      commit-sha         = "766b45598419775830ea2a09bc6a4a4d300062df"
      gcb-build-id       = "aabbf73d-70a0-4eca-8028-233c437fffdf"
      gcb-trigger-id     = "63999ca0-8fac-415e-b5ad-3efc29816f54"
      gcb-trigger-region = "us-east1"
      managed-by         = "gcp-cloud-build-deploy-cloud-run"
    }
    max_instance_request_concurrency = 80
    revision                         = null
    service_account                  = "871657323406-compute@developer.gserviceaccount.com"
    session_affinity                 = false
    timeout                          = "300s"
    containers {
      args        = []
      command     = []
      depends_on  = []
      image       = "us-east1-docker.pkg.dev/project-1f03d34e-6e19-45e0-a6a/cloud-run-source-deploy/tysibley50-netizen-gcpdevopslab/tiny-clickops-service:766b45598419775830ea2a09bc6a4a4d300062df"
      name        = null
      working_dir = null
      ports {
        container_port = 8080
        name           = "http1"
      }
      resources {
        cpu_idle = true
        limits = {
          cpu    = "1000m"
          memory = "512Mi"
        }
        startup_cpu_boost = false
      }
      startup_probe {
        failure_threshold     = 1
        initial_delay_seconds = 0
        period_seconds        = 240
        timeout_seconds       = 240
        tcp_socket {
          port = 8080
        }
      }
    }
    scaling {
      max_instance_count = 20
      min_instance_count = 0
    }
  }
  traffic {
    percent  = 100
    revision = null
    tag      = null
    type     = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
  }
}
