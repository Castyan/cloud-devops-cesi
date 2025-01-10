# Cloud & DevOps Example

Ce projet est créé dans le cadre d'une initiation aux pratiques Cloud et DevOps. Pour cet exemple, je m'appuie sur Google Cloud Platform (GCP) pour déployer une application sur Google Compute Engine (GCE) en utilisant Packer, Terraform, Ansible et Cloud Build pour la CI/CD.

## Table des matières
1. [Architecture](#architecture)
2. [Prérequis](#prérequis)
3. [Utilisation](#utilisation)

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
Créez un projet `cloud-devops-maitre` 
Attribuer les droits de votre administrateur sur le projet
Récuperez l'ID du projet 
Dans un environnement Ubuntu de préférence :
Téléchargez le code GitHub git clone `https://github.com/Castyan/cloud-devops-cesi.git`
Allez dans le repertoir `cd cloud-devops-cesi/`
Lancez la commande `chmod +x init.sh`
Lancez la commande `./init.sh`
Collez l'ID du projet maitre créé précédemment

Le code se charge d'installer les dépendances, de créer les projets, de créer les comptes, d'attribuer la facturation a ces comptes, d'activer les API, de créer les pipelines etc ...


