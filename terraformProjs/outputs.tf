
output "cloud_run_url" {
  value       = google_cloud_run_v2_service.tiny-clickops-service-871657323406.uri
  description = "Public URL of the deployed Cloud Run service"
}
