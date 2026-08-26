variable "project_id" {
    type        = string
    description = "Project id of my at home GCP project"
    default = "project-1f03d34e-6e19-45e0-a6a"
}

variable "google_region" {
    type        = string
    description = "The google region where my bucket sits"
    default     = "us-east-1"
}

#Think of this doc like your variables but stored in a different file. Pretty useful!!

