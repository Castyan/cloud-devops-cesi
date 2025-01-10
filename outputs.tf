# outputs.tf

output "artifact_registry_repo" {
  value = google_artifact_registry_repository.ops_repo.repository_id
}

output "cloud_build_trigger_id" {
  value = google_cloudbuild_trigger.ops_trigger.id
}