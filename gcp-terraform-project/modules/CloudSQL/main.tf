#Documentation for resource gotten from https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database
resource "google_sql_database_instance" "cloud_sql" {
  name             = var.db_instance_name
  database_version = var.db_version
  region           = var.region

  settings {
    # Second-generation instance tiers are based on the machine
    # db-f1-micro is my chosen machine tier as it is a lightweight option
    tier = "db-f1-micro"
  }
  deletion_protection = true
}

resource "google_sql_database" "database" { #For creation of a database (var.db_name) in the created instance
  name     = var.db_name
  instance = google_sql_database_instance.cloud_sql.name
}

resource "google_sql_user" "user" { #Created a SQL user with name var.db_user and password var.database_password for the SQL instance
  name = var.db_user
  instance = google_sql_database_instance.cloud_sql.name
  password = var.database_password
  
}
