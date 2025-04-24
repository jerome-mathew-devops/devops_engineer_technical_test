terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.30.0"
    }
  }
} #https://registry.terraform.io/providers/hashicorp/google/6.30.0/docs Link to terraform registry for GCP Documentation
  #This documentation was used as a source reference for this Infrastruture as Code

provider "google" {
  project = var.project
  region = var.region
  credentials = var.credentials

} #Custom values were saved in a varaible.tf file to ease reuseability and scalability by other teams