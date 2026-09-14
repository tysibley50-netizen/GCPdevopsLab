
output "cloud_run_url" {
  value       = google_cloud_run_v2_service.app.uri
  description = "Public URL of the deployed Cloud Run service"
}
output "workload_identity_provider" {
    value       = google_iam_workload_identity_pool_provider.github_provider.name
      description = "Provider resource name passed to google-github-actions/auth in CI/CD"
    }
output "cicd_service_account_email" {
        value       = google_service_account.github_actions_sa.email
          description = "Service Account email impersonated by GitHub Actions"
}


