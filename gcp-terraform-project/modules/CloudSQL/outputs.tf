output "database_instance_name" {
    description = "Name of SQL instance"
    value = google_sql_database_instance.cloud_sql.name
  
} #The output.tf displays the defined value after provisioning