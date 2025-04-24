# GCP PHP APP DEPLOYMENT USING TERRAFORM AND GITHUB ACTIONS

This project shows a fully automated CI/CD pipeline for deploying a PHP web application to Google Cloud Platform using Terraform to provision neccessary resources which were;
- CloudSQL for (MySQL) data persistence
- Cloud Storage Bucket for storing static files
- Cloud Run Service for serveless container deployment
- Cloud Load Balancing to route traffic to the Run service.
Docker for application containarization and Github actions for CI/CD

---

## Features
- IaC using Terraform modules
- Docker for containization
- CI/CD with github actions
- Bash scripting to retrieve deployed service URL
- Secrets managed via GitHub repository secrets

---

## Prerequisites
- Google Cloud Account and A working Project
- Terraform installed
- Docker Installed and configured
- Github repository
- gcloud CLI authenticated with access



## Procedure and Instructions
### PHASE 1: Infrastruture as Code with Terraform:
- Cloned the github repository and created a directory to hold my terraform code.
- In the directory I created above, create 1 directory called modules and in that I created  4 different directories for the resources to be provisioned.
- In each resource directory I created a main.tf file to hold you configurations and a variable.tf to hold values for those configurations.I Repeated this step for the 4 created directories.
- I wrote a php script to use as an start point for your php application.
- Configured nginx to host the php application on port 8080
- Dockerized my php application and pushed to my docker repository @ jaymath237
- Input the value of your docker image to the Cloud run service module

### PHASE 2 CI/CD with Github Actions:
- Created a directory .github/workflow in your git repository
- I configured my deploy.yml file to run your pipeline on pushing, Authenticating with gcloud, building and pushing the docker image and deploying to Cloud run. #See configurations in repository

### PHASE 3 Retrieving Cloud Run URL via Bash Scripting.
- My Bash-scripts takes argument for environments development, staging and production. And the end, the bash script produces a messaging showing the URL was retrieved from Cloud Run successfully and produces a failed message if the URL was not retrieved successfully.
