terraform {
  backend "gcs" {
    bucket  = "projet-devops-ops5-terraform-state-unique"
    prefix  = "envs/prod"
  }
}