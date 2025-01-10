# Cloud & DevOps Example

Ce projet est créé dans le cadre d'une initiation aux pratiques Cloud et DevOps. Pour cet exemple, je m'appuie sur Google Cloud Platform (GCP) pour déployer une application sur Google Compute Engine (GCE) en utilisant Packer, Terraform, Ansible et Cloud Build pour la CI/CD.

## Table des matières
1. [Architecture](#architecture)
2. [Prérequis](#prérequis)
3. [Utilisation](#utilisation)
4. [Description](#description)

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

Pour exécuter le script, téléchargez le code GitHub et lancez la commande `./init.sh` dans un environnement Ubuntu de préférence.
Le code se charge d'installer les dépendances, de créer les projets, de créer les comptes, d'attribuer la facturation a ces comptes

## Description : 
Ce script permet de créer les projets GCP, d'activer les API nécessaires, de créer les comptes de service et de générer les clés pour les projets Ops et Prod.
Il permet également de créer les buckets pour le stockage des fichiers Terraform.
Il est nécessaire de s'authentifier avec un compte administrateur GCP pour exécuter ce script.
Les variables ORG_ID, PROJECT_ID_OPS, PROJECT_NAME_OPS, PROJECT_ID_PROD, PROJECT_NAME_PROD et BILLING_ACCOUNT_ID sont récupérées depuis le fichier variables.tf.
Si ces variables ne sont pas renseignées, elles seront attribuées par défaut.
Le script demande à l'utilisateur de renseigner l'ID du projet mâitre.
Le script est exécuté dans le répertoire racine du projet Terraform.
Le script est exécuté avec la commande bash init.sh.
Le script est exécuté dans le Cloud Shell de Google Cloud Platform.
Le script est exécuté avec un compte administrateur GCP.


