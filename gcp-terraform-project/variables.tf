variable "project" {
    description = "Project ID"
    type = string
    default = "blue-window-assessment"
 
}

variable "region" {
    description = "GCP Region"
    type = string
    default = "europe-west1" #Using europe-west1 as it offers reduced Latency for Central Africa

}

variable "credentials" {
    description = "Credentials for service account"
    type = string
    default = "new-key.json"
  
}


variable "db_instance_name" {
    description = "variable holder for MySQL database name"
    type = string
    default = "cloud_sql_instance"
  
}

variable "db_name" {
    description = "variable holder for MySQL database name"
    type = string
    default = "cloud_sql"
  
}

variable "db_version" {
    description = "variable holder for MySQL Version 8.0"
    type = string
    default = "MYSQL_8_0"
  
}

variable "db_user" {
    description = "Variable holder for database user"
    type = string
    default = "blue Window"
  
}

variable "database_password" {
    description = "Database pass stored in terraform.tfvars file to avoid hard coding sensitive data such as"
    type = string
  
}
