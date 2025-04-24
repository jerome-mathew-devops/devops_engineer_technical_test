#Resource documentation from https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_forwarding_rule
#This resource forwards traffic only to HTTP as a domain and ssL certificate were not acquired to route traffic to HTTPS
resource "google_compute_global_address" "global_address" {
    name = var.global_address_name
  
}

resource "google_compute_health_check" "health_check" {
    name = "health-check"

    http_health_check {
      request_path = "/"
      port = "80"
    }
  
}


resource "google_compute_region_backend_service" "region" {
    name = var.backend_service_name
    region = var.region
    protocol = "HTTP"

    backend {
      group = google_compute_global_address.global_address.name
    }

    health_checks = [google_compute_health_check.health_check.id]
  
}


resource "google_compute_region_url_map" "url_map" {
    name = "url-map"
    region = var.region
    default_service = google_compute_region_backend_service.region.id
  
}

resource "google_compute_region_target_https_proxy" "http_proxy" {
    name = "http-proxy"
    region = var.region
    url_map = google_compute_region_url_map.url_map.id
  
}

resource "google_compute_global_forwarding_rule" "forwarding_rule" {
    name = "forwarding-rule"
    target = google_compute_region_target_https_proxy.http_proxy.id
    port_range = "80"
    ip_address = google_compute_global_address.global_address.address
}