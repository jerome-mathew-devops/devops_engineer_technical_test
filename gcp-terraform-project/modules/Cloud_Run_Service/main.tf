#Documentation for resources gotten from https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/cloud_run_service
resource "google_cloud_run_service" "run_service" {
  name     = var.service_name
  location = var.service_region

  template {
    spec {
      containers {
        image = var.docker_image  #Docker image pulled from Docker hub @ jaymath237/php-script
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_member" "iam_member" {
    service = google_cloud_run_service.run_service.name
    location = google_cloud_run_service.run_service.location
    role = "role/run.invoker"
    member = "allUsers"
  
}