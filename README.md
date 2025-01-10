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

Pour exécuter le script, téléchargez le code GitHub et lancez la commande `chmod +x init.sh` puis`./init.sh` dans un environnement Ubuntu de préférence.
Le code se charge d'installer les dépendances, de créer les projets, de créer les comptes, d'attribuer la facturation a ces comptes, d'activer les API, de créer les pipelines etc ...


