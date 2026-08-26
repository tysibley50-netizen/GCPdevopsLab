# main.tf
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0" # Or your preferred version
    }
  }
}

provider "google" {
  project = "devOpsLab"
  region  = "us-central1" 
}
