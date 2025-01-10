variable "ORG_ID" {
  description = "ID de l'organisation"
  type        = string
  # attribuer la valeur de l'ID de l'organisationurope-west1 gs://projet-devops-ops5-cloud-storage Creating gs://projet-devops-ops5-cloud-storage/... ServiceException: 409 A Cloud Storage bucket named 'projet-devops-ops5-cloud-storage' already exists. Try another name. Bucket names must be globally unique across all Google Cloud projects, including those outside of your organization. root@vm-ubuntu:</del>/test/cloud-devops-cesi# terraform init Initializing the backend...
  default     = "80379980974"
}

variable "PROJECT_ID_OPS" {
  description = "ID du projet Ops"
  type        = string
  default     = "projet-devops-ops5"
}

variable "PROJECT_ID_PROD" {
  description = "ID du projet Prod"
  type        = string
    default     = "projet-devops-prod5"
}

variable "PROJECT_NAME_OPS" {
  description = "Nom du projet Ops"
  type        = string
  default     = "projet-devops-ops5"
}

variable "PROJECT_NAME_PROD" {
  description = "Nom du projet Prod"
  type        = string
  default     = "projet-devops-ops5"
}

variable "BILLING_ACCOUNT_ID" {
  description = "Région par défaut"
  type        = string
  default     = "01C959-AE072B-E7B61E"
}

variable "REGION" {
  description = "Région par défaut"
  type        = string
  default     = "europe-west1"
}