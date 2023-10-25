variable "resource_group_name" {
  type        = string
  description = "Resource group for Terraform related resources"
  default     = "Terraform"
}

variable "azure_region" {
  type        = string
  description = "Azure region to deploy to"
  default     = "westeurope"
}

variable "storage_name" {
  type        = string
  description = "Name for storage account that will hold Terraform state files"
}

variable "storage_container_name" {
  type        = string
  description = "Name for storage container that will hold Terraform state files"
  default     = "tfstate"
}
