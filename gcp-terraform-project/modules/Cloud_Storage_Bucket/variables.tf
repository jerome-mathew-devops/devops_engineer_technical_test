variable "bucket_name" {
    description = "Name of Storage bucket for static files"
    type = string
    default = "storage_bucket"
  
}

variable "bucket_location" {
    description = "Storage bucket location. This choice increases latency as europe-west1(Belguim) is closest to central Africa"
    type = string
    default = "europe-west1"
  
}

variable "storage_class" {
    description = "Storage class for storage bucket"
    type = string
    default = "STANDARD"
  
}

variable "object_name" {
    description = "Storage bucket object name"
    type = string
    default = "static-test"
  
}