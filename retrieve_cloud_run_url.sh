#!/usr/bin/env bash

#This script retrieves the public URL of my Cloud run service deployed via terraform
#The scripts retrieves the url based on the specified environment (Development, Staging, or Production)


set -e #This allows the script exits when any command fails
echo "Input environment: $1"


LOG_FILE="cloud_run.log"   #Enable logging to file cloud_run.log
exec > >(tee -a "$LOG_FILE") 2>&1

if ! command -v gcloud &> /dev/null; #Checks if gcloud is installed
    then
        echo "gcloud CLI is not installed. Exiting"
        exit 1
fi

if [ -z "$1" ]; #Checks for correct input
    then
        echo "Bad Input: No environment argument provided."
        echo "Usage: ./retrieve_cloud_run_url.sh [environment]"
        exit 1
fi

ENV="$1"

case "$ENV" in  #Setting config values according to environments
    development)
        PROJECT_ID="blue-window-assessment"
        SERVICE_NAME="devops-assessment"
        REGION="europe-west1"
        ;;
    staging)
        PROJECT_ID="blue-window-assessment"
        SERVICE_NAME="devops-assessment"
        REGION="europe-west1"
        ;;
    production)
        PROJECT_ID="blue-window-assessment"
        SERVICE_NAME="devops-assessment"
        REGION="europe-west1"
        ;;
    *)
        echo "Unknown environment: $ENV"
        echo "Valid options are: development, staging, production"
        exit 1
        ;; 
esac

echo "Fetching cloud run URL for service $SERVICE_NAME (env: $ENV)"

#Retrieves Run Service URL
URL=$(gcloud run services describe "$SERVICE_NAME" \
    --project="$PROJECT_ID" \
    --region="$REGION" \
    --platform=managed \
    --format="value(status.url)" 2>/dev/null)

#Checks if URL for inputed service was found
if [ -z "$URL" ]; 
    then
        echo "Failed: URL for $SERVICE_NAME could not be retrieved"
        exit 1
fi

echo "Success: Cloud run service URL: $URL"
