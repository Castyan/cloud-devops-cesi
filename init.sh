#!/bin/bash

# Authentification avec Google Cloud en tant qu'administrateur
echo "Veuillez vous authentifier avec un compte administrateur GCP."
#gcloud auth login
#gcloud auth application-default login

# Récupération des variables dans variables.tf
ORG_ID=$(grep 'ORG_ID' variables.tf | awk -F'"' '{print $4}')
PROJECT_ID_OPS=$(grep 'PROJECT_ID_OPS' variables.tf | awk -F'"' '{print $4}')
PROJECT_NAME_OPS=$(grep 'PROJECT_NAME_OPS' variables.tf | awk -F'"' '{print $4}')
PROJECT_ID_PROD=$(grep 'PROJECT_ID_PROD' variables.tf | awk -F'"' '{print $4}')
PROJECT_NAME_PROD=$(grep 'PROJECT_NAME_PROD' variables.tf | awk -F'"' '{print $4}')
BILLING_ACCOUNT_ID=$(grep 'BILLING_ACCOUNT_ID' variables.tf | awk -F'"' '{print $4}')

if [ -z "$ORG_ID" ] || [ -z "$PROJECT_ID_OPS" ] || [ -z "$PROJECT_NAME_OPS" ] || [ -z "$PROJECT_ID_PROD" ] || [ -z "$PROJECT_NAME_PROD" ] || [ -z "$BILLING_ACCOUNT_ID" ]; then
    # attribution des variables
    ORG_ID="80379980974"
    PROJECT_ID_OPS="projet-devops-ops"
    PROJECT_NAME_OPS="projet-devops-ops"
    PROJECT_ID_PROD="projet-devops-prod"
    PROJECT_NAME_PROD="projet-devops-prod"
    BILLING_ACCOUNT_ID="01C959-AE072B-E7B61E"
fi

# Vérification des variables
echo "ORG_ID: $ORG_ID"y
echo "PROJECT_ID_OPS: $PROJECT_ID_OPS"
echo "PROJECT_NAME_OPS: $PROJECT_NAME_OPS"
echo "PROJECT_ID_PROD: $PROJECT_ID_PROD"
echo "PROJECT_NAME_PROD: $PROJECT_NAME_PROD"
echo "BILLING_ACCOUNT_ID: $BILLING_ACCOUNT_ID"

# permet a l'executeur du scrip de rentrer l'id du projet mâitre
read -p "Veuillez entrer l'ID du projet mâitre: " MASTER_PROJECT_ID
gcloud config set project $MASTER_PROJECT_ID
gcloud services enable cloudresourcemanager.googleapis.com

# Création des projets GCP
gcloud projects create $PROJECT_ID_OPS --name=$PROJECT_NAME_OPS --organization=$ORG_ID
gcloud projects create $PROJECT_ID_PROD --name=$PROJECT_NAME_PROD --organization=$ORG_ID

# Sélectionner le projet Ops
gcloud config set project $PROJECT_ID_OPS
# attribution compte de facturation
echo -e "\e[34mAttribution du compte de facturation au projet Ops\e[0m"
gcloud beta billing projects link $PROJECT_ID_OPS --billing-account=$BILLING_ACCOUNT_ID
# Activer les API nécessaires pour le projet Ops
gcloud services enable cloudresourcemanager.googleapis.com compute.googleapis.com cloudbuild.googleapis.com artifactregistry.googleapis.com storage.googleapis.com monitoring.googleapis.com --project=$PROJECT_ID_OPS
# Création compte de service
gcloud iam service-accounts create terraform-sa --display-name "Terraform OPS Service Account1"
# Attribution du rôles admin
gcloud projects add-iam-policy-binding $PROJECT_ID_OPS --member=serviceAccount:terraform-sa@$PROJECT_ID_OPS.iam.gserviceaccount.com --role=roles/editor
gcloud projects add-iam-policy-binding $PROJECT_ID_PROD --member=serviceAccount:terraform-sa@$PROJECT_ID_PROD.iam.gserviceaccount.com --role=roles/storage.admin
# Création de la clé
gcloud iam service-accounts keys create cle-ops.json --iam-account=terraform-sa@$PROJECT_ID_OPS.iam.gserviceaccount.com


# Sélectionner le projet Prod
gcloud config set project $PROJECT_ID_PROD
# attribution compte de facturation
echo -e "\e[34mAttribution du compte de facturation au projet Prod\e[0m"
gcloud beta billing projects link $PROJECT_ID_PROD --billing-account=$BILLING_ACCOUNT_ID
# Activer les API nécessaires pour le projet Prod
gcloud services enable cloudresourcemanager.googleapis.com compute.googleapis.com cloudbuild.googleapis.com artifactregistry.googleapis.com storage.googleapis.com monitoring.googleapis.com --project=$PROJECT_ID_PROD
# Création compte de service
gcloud iam service-accounts create terraform-sa --display-name "Terraform PROD Service Account1"
# Attribution du rôles admin
gcloud projects add-iam-policy-binding $PROJECT_ID_PROD --member=serviceAccount:terraform-sa@$PROJECT_ID_PROD.iam.gserviceaccount.com --role=roles/editor
gcloud projects add-iam-policy-binding $PROJECT_ID_PROD --member=serviceAccount:terraform-sa@$PROJECT_ID_PROD.iam.gserviceaccount.com --role=roles/storage.admin
# Création de la clé
gcloud iam service-accounts keys create cle-prod.json --iam-account=terraform-sa@$PROJECT_ID_PROD.iam.gserviceaccount.com


# Création des buckets
gsutil mb -p $PROJECT_ID_OPS -l europe-west1 gs://$PROJECT_ID_OPS-terraform-state

