#!/bin/bash


# Authentification avec Google Cloud
gcloud auth login
gcloud auth application-default login


# Demande à l'utilisateur de saisir l'ID de l'organisation
read -p "Entrez l'ID de votre organisation (ORG_ID): " ORG_ID

# Ajout de l'utilisateur à l'organisation
read -p "Entrez l'email de votre compte : " EMAIL
gcloud organizations add-iam-policy-binding $ORG_ID \
    --member="user:$EMAIL" \
    --role="roles/resourcemanager.organizationAdmin"

# Demande à l'utilisateur de saisir l'ID du projet à créer
read -p "Entrez l'ID des projet à créer (YOUR_PROJECT_ID): " PROJECT_ID

# Demande à l'utilisateur de saisir le nom du projet
read -p "Entrez le nom des projet (Your Project Name): " PROJECT_NAME

# Mettre dans des variables ORG_ID PROJECT_ID et PROJECT_NAME
export ORG_ID=$ORG_ID
export PROJECT_ID=$PROJECT_ID
export PROJECT_NAME=$PROJECT_NAME

# Execution avec terraform de "automatic-deployment-project.tf"
terraform init
terraform apply -auto-approve