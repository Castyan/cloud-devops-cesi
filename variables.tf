variable "ORG_ID" {
  description = "ID de l'organisation"
  type        = string
  # attribuer la valeur de l'ID de l'organisation
  default     = "80379980974"
}

variable "PROJECT_ID_OPS" {
  description = "ID du projet Ops"
  type        = string
  default     = "projet-devops-ops3"
}

variable "PROJECT_ID_PROD" {
  description = "ID du projet Prod"
  type        = string
    default     = "projet-devops-prod3"
}

variable "PROJECT_NAME_OPS" {
  description = "Nom du projet Ops"
  type        = string
  default     = "projet-devops-ops3"
}

variable "PROJECT_NAME_PROD" {
  description = "Nom du projet Prod"
  type        = string
  default     = "projet-devops-ops3"
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