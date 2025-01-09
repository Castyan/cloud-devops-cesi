provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_folder" "parent_folder" {
  display_name = "ParentFolder"
  parent       = "organizations/${var.org_id}"
}

resource "google_project" "ops_project" {
  name       = "cloud-devops-example-ops"
  project_id = "cloud-devops-example-ops"
  folder_id  = google_folder.parent_folder.name
}

resource "google_project" "prod_project" {
  name       = "cloud-devops-example-prod"
  project_id = "cloud-devops-example-prod"
  folder_id  = google_folder.parent_folder.name
}

resource "google_service_account" "ops_service_account" {
  account_id   = "service-ops"
  display_name = "Service Account for Ops"
  project      = google_project.ops_project.project_id
}

resource "google_service_account" "prod_service_account" {
  account_id   = "service-prod"
  display_name = "Service Account for Prod"
  project      = google_project.prod_project.project_id
}

resource "google_project_iam_member" "ops_iam_binding" {
  project = google_project.ops_project.project_id
  role    = "roles/owner"
  member  = "serviceAccount:${google_service_account.ops_service_account.email}"
}

resource "google_project_iam_member" "prod_iam_binding" {
  project = google_project.prod_project.project_id
  role    =