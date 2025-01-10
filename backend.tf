terraform {
  backend "gcs" {
    bucket  = "my-terraform-states"
    prefix  = "envs/prod"
  }
}