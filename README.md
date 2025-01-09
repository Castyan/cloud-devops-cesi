# Architecture GCP - Mise en place

## **1. Préparer les environnements**

### a. Création des projets GCP
- **`cloud-devops-example-ops`** : Pour les outils CI/CD et la gestion des états Terraform.
- **`cloud-devops-example-prod`** : Pour l'environnement de production.

Via le fichier "automatic-deployment-project.yaml"

### b. Configuration des identifiants et API
- Activer les API GCP nécessaires :
  - Compute Engine
  - Cloud Build
  - Artifact Registry
  - Cloud Storage
  - Cloud Monitoring
- Configurer les comptes de service et attribuer les rôles requis (IAM).

---

## **2. Déploiement des éléments de l'environnement Ops (CI/CD)**

### a. Artifact Registry
- Créer un dépôt Artifact Registry pour stocker les artefacts (images Docker, binaires, etc.).

### b. Cloud Storage
- Configurer un bucket pour stocker les états Terraform (backend).

### c. Packer
- Créer un template Packer pour construire les images Compute Engine.
- Configurer un script qui inclut :
  - Installation des dépendances nécessaires à l'application.
  - Configuration initiale de l'application.

### d. Cloud Build
- Configurer une pipeline CI/CD dans **Cloud Build** pour :
  - Construire l'image Compute Engine avec Packer.
  - Stocker cette image dans la section Images Compute.

### e. GitHub Intégration
- Configurer un webhook entre GitHub et Cloud Build pour déclencher la CI/CD à chaque commit.

---

## **3. Déploiement de l'environnement de production**

### a. VPC et sous-réseaux
- Créer un VPC (par exemple : `vpc-cloud-devops-prod`).
- Configurer des sous-réseaux :
  - `subnet-paris-lb-prod` : Pour le Load Balancer.
  - `subnet-paris-app-prod` : Pour les instances Compute Engine.

### b. Cloud DNS
- Configurer les enregistrements DNS pour le domaine (par exemple : `exemple.q-sw.xyz`).

### c. Cloud Storage
- Créer un bucket pour stocker les fichiers statiques nécessaires à l'application.

### d. Compute Engine - MIG (Managed Instance Group)
- Créer un MIG pour héberger l'application.
- Utiliser l'image créée via Packer dans la CI/CD.

### e. Load Balancer
- Configurer un Load Balancer régional pour distribuer le trafic entre les instances du MIG.

### f. Cloud Monitoring
- Configurer des métriques et des alertes pour surveiller les performances et la disponibilité.

---

## **4. Flux de CI/CD complet**

1. **Développeur pousse le code sur GitHub.**
2. **Cloud Build** est déclenché automatiquement :
   - Construction de l'image Compute Engine avec Packer.
   - Construction et stockage des artefacts dans **Artifact Registry**.
3. Terraform applique la configuration pour :
   - Mettre à jour le MIG avec la nouvelle image.
   - Propager les modifications dans l'environnement prod.

---

## **5. Automatisation avec Terraform**

### a. Provisionnement de l'infrastructure
- Écrire des scripts Terraform pour :
  - Créer et configurer le VPC et les sous-réseaux.
  - Provisionner les buckets Cloud Storage, le MIG, et le Load Balancer.

### b. Backend Terraform
- Configurer un backend basé sur Cloud Storage pour gérer les états Terraform de manière centralisée.

---

## **6. Notes supplémentaires**
- **Sécurité :**
  - Mettre en place des politiques IAM strictes pour limiter les accès.
  - Activer les journaux d'audit pour toutes les actions critiques.
- **Résilience :**
  - Configurer un Autoscaler pour le MIG.
  - Activer les sauvegardes pour les données critiques dans Cloud Storage.

---