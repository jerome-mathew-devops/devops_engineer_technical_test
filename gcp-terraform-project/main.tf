/*Module call for provisioning of requested services in a structured and reuseable way 
Each source points to a directory containing resource definitions for required services*/
module "CloudSQL" {    
    source = "./modules/CloudSQL"

    db_name = var.db_name
    db_user = var.db_user
    database_password = var.database_password
    db_version = var.db_version
  
}

module "cloudstoragebucket" {
    source = "./modules/Cloud_Storage_Bucket"
 
    }
  
module "Cloud_Run_Service" {
    source = "./modules/Cloud_Run_Service"

}

module "Cloud_Load_Balancing" {
    source = "./modules/Cloud_Load_Balancing"

}