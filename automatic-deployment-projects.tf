# Récupetrer les variables déjà déclaré dans init.sh
source init.sh

provider "google" {
  credentials = file("cle.json")
  project = var.PROJECT_ID
  region  = "eu-west10"
  zone    = "eu-west10-b"
}

# Création du projet ops
resource "google_project" "ops" {
  name       = "${var.PROJECT_NAME}-ops"
  project_id = "${var.PROJECT_ID}-ops"
  org_id     = var.ORG_ID
}

# Création du projet prod
resource "google_project" "prod" {
  name       = "${var.PROJECT_NAME}-prod"
  project_id = "${var.PROJECT_ID}-prod"
  org_id     = var.ORG_ID
}

# Création compte de service pour ops
resource "google_service_account" "ops" {
  account_id   = "ops"
  display_name = "ops"
  project      = google_project.ops.project_id
}

# Création compte de service pour prod
resource "google_service_account" "prod" {
  account_id   = "prod"
  display_name = "prod"
  project      = google_project.prod.project_id
}

# Création des rôles
resource "google_project_iam_custom_role" "ops" {
  role_id     = "ops"
  title       = "ops"
  description = "ops"
  permissions = [
    "roles/compute.admin",
    "roles/storage.admin",
    "roles/iam.serviceAccountUser",
    "roles/iam.serviceAccountAdmin",
    "roles/iam.roleAdmin",
    "roles/iam.serviceAccountKeyAdmin",
    "roles/iam.serviceAccountKeyAdmin
  ]
}

resource "google_project_iam_custom_role" "prod" {
  role_id     = "prod"
  title       = "prod"
  description = "prod"
  permissions = [
    "roles/compute.admin",
    "roles/storage.admin",
    "roles/iam.serviceAccountUser",
    "roles/iam.serviceAccountAdmin",
    "roles/iam.roleAdmin",
    "roles/iam.serviceAccountKeyAdmin",
    "roles/iam.serviceAccountKeyAdmin
  ]
  }
# Attribution des rôles
resource "google_project_iam_binding" "ops" {
  project = google_project.ops.project_id
  role    = google_project_iam_custom_role.ops.role_id
  members = [
    "serviceAccount:${google_service_account.ops.email}"
  ]
}

resource "google_project_iam_binding" "prod" {
  project = google_project.prod.project_id
  role    = google_project_iam_custom_role.prod.role_id
  members = [
    "serviceAccount:${google_service_account.prod.email}"
  ]
}