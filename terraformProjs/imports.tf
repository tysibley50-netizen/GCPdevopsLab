# imports.tf

import {
  # The type of resource and what you want to name it in your code
  to =  google_cloud_run_v2_service.my_cloud_run_service
  
  # The exact ID string from your GCP Console
  id = "projects/project-1f03d34e-6e19-45e0-a6a/locations/us-east/services/tiny-clickops-service.my_service"
}


