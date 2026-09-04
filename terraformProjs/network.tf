resource "google_compute_network" "vpc" {
  name                    = "app-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "cloudrun-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.google_region
  network       = google_compute_network.vpc.id

  # Enables private Google access so instances without public IPs can reach Google APIs
  private_ip_google_access = true
}
