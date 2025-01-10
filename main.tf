# main.tf

# Configure the Google Cloud provider
provider "google" {
  alias       = "ops"
  credentials = file("cle-ops.json")
  project     = var.PROJECT_ID_OPS
  region      = "eu-west1"
  zone        = "eu-west1-b"
}

provider "google" {
  alias       = "prod"
  credentials = file("cle-prod.json")
  project     = var.PROJECT_ID_PROD
  region      = "eu-west1"
  zone        = "eu-west1-b"
}

# Artifact Registry
resource "google_artifact_registry_repository" "ops_repo" {
  provider = google.ops
  location = var.REGION
  repository_id = "ops-artifact-repo"
  format = "DOCKER"
  description = "Artifact Registry for Ops environment"
}

# Cloud Storage for Terraform state
resource "google_storage_bucket" "terraform_state" {
  name     = "${var.PROJECT_ID_OPS}-cloud-storage"
  location = var.REGION
  project  = var.PROJECT_ID_OPS

  uniform_bucket_level_access = true
}

resource "google_cloudbuild_trigger" "ops_trigger" {
  provider = google.ops
  trigger_template {
    project_id = var.PROJECT_ID_OPS
    repo_name  = "ops-artifact-repo"
    branch_name = "main"
  }
  build {
    step {
      name = "gcr.io/cloud-builders/docker"
      args = ["build", "-t", "gcr.io/${var.PROJECT_ID_OPS}/your-image", "."]
    }
    images = ["gcr.io/${var.PROJECT_ID_OPS}/your-image"]
    # ce que je doit finir : 
    # - créer un fichier Dockerfile
    # - créer un fichier index.html
    # - créer un fichier app.js
    # - créer un fichier package.json
  }
}