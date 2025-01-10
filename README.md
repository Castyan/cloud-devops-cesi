# Cloud & DevOps Example

Ce projet est créé dans le cadre des interventions que je réalise auprès d'étudiants sur l'initiation aux pratiques Cloud et DevOps. Pour cet exemple, je m'appuie sur Google Cloud Platform (GCP) pour déployer une application sur Google Compute Engine (GCE) en utilisant Packer, Terraform, Ansible et Cloud Build pour la CI/CD.

## Table des matières
1. [Architecture](#architecture)
2. [Prérequis](#prérequis)
3. [Configuration des comptes de service et IAM](#configuration-des-comptes-de-service-et-iam)
4. [Déploiement de l'environnement Ops (CI/CD)](#déploiement-de-lenvironnement-ops-cicd)
5. [Déploiement de l'environnement de production](#déploiement-de-lenvironnement-de-production)
6. [Utilisation](#utilisation)

## Architecture

L'architecture de ce projet comprend les éléments suivants :
- **Google Compute Engine (GCE)** : Pour héberger l'application.
- **Packer** : Pour créer des images de machine.
- **Terraform** : Pour gérer l'infrastructure.
- **Ansible** : Pour la configuration des instances.
- **Cloud Build** : Pour les pipelines CI/CD.

## Prérequis

Avant de commencer, assurez-vous d'avoir les éléments suivants :
- Un compte Google Cloud Platform (GCP).
- Le SDK Google Cloud installé sur votre machine.
- Les outils suivants installés : Terraform, Packer, Ansible, Docker.

## Configuration des comptes de service et IAM

1. Accédez à "IAM & Admin" > "Comptes de service" dans la console GCP.
2. Créez un compte de service pour chaque projet avec les rôles nécessaires :
   - `roles/editor`
   - `roles/iam.serviceAccountUser`
   - `roles/resourcemanager.projectIamAdmin`
   - `roles/storage.admin`
   - `roles/compute.admin`
3. Téléchargez la clé JSON pour chaque compte de service et conservez-la en lieu sûr.

## Déploiement de l'environnement Ops (CI/CD)

### a. Déploiement via GitHub

1. Accédez au dépôt GitHub [cloud-devops-cesi](https://github.com/Castyan/cloud-devops-cesi/tree/master).
2. Configurez les secrets GitHub nécessaires pour l'authentification avec Google Cloud.
3. Modifiez le fichier `.github/workflows/deploy.yml` pour inclure les étapes de déploiement.
4. Poussez les modifications sur la branche principale pour déclencher le workflow de déploiement.

### b. Déploiement manuel

1. Clonez le dépôt GitHub localement.
   ```bash
   git clone https://github.com/Castyan/cloud-devops-cesi.git
   cd cloud-devops-cesi