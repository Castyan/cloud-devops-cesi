terraform {
  backend "gcs" {
    bucket  = "projet-devops-ops5-cloud-storage"
    prefix  = "envs/prod"
  }
}