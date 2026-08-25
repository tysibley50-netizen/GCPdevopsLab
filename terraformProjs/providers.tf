terraform {
    required_version = ">=1.5.0" # Minimum Core version of terraform
    required_providers {
        google = {
            source = "hashicorp/google" # the download path to google
            version = "~> 5.0"  # version constraint
        }
    }
    backend "gcs" {
        # this is passed dynamically via backend.tfvars 
    }
}
provider "google" {
    project = var.myprojectid
    region = var.myprojectfree region
}