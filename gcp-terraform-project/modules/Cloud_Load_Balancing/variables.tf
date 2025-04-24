variable "global_address_name" {
    description = "Variable holder for globa address name"
    type = string
    default = "my_global_address"
  
}

variable "backend_service_name" {
    description = "variable holder for backend service name"
    type = string
    default = "my-backend-service"
  
}

variable "region" {
    description = "Region location for the backend service"
    type = string
    default = "europe-west1"
  
}

variable "run_url" {
    description = "Varaible holder for cloud run url"
    type = string
    default = "run_url"
  
}