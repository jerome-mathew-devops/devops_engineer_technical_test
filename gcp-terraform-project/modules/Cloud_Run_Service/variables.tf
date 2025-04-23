variable "service_name" {
    description = "Variable holder for Cloud Service Name"
    type = string
    default = "php_run_service"
  
}

variable "service_region" {
    description = "Region for service"
    type = string
    default = "europe-west1"
  
}

variable "docker_image" {
    description = "Variable holder for build docker image"
    type = string
    default = "jaymath237/php-script:11"
  
}