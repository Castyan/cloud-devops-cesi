terraform {
  backend "gcs" {
    bucket  = "projet-devops-ops3-terraform-state"
    prefix  = "envs/prod"
  }
}