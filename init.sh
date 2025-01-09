#!/bin/bash

# Authentification avec Google Cloud
gcloud auth login

# Demande à l'utilisateur de saisir l'ID de l'organisation
read -p "Entrez l'ID de votre organisation (ORG_ID): " ORG_ID

# Demande à l'utilisateur de saisir l'ID du projet à créer
read -p "Entrez l'ID du projet à créer (YOUR_PROJECT_ID): " PROJECT_ID

# Demande à l'utilisateur de saisir le nom du projet
read -p "Entrez le nom du projet (Your Project Name): " PROJECT_NAME

# Création du projet GCP
# gcloud projects create $PROJECT_ID --name="$PROJECT_NAME" --organization=$ORG_ID

# Mettre dans des variables ORG_ID PROJECT_ID et PROJECT_NAME
export ORG_ID=$ORG_ID
export PROJECT_ID=$PROJECT_ID
export PROJECT_NAME=$PROJECT_NAME

# Execution avec terraform de "automatic-deployment-project.tf"
terraform init
terraform apply -auto-approve