terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.77.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "tfstate" {
  name     = var.resource_group_name
  location = var.azure_region

  tags = local.tags
}

resource "azurerm_storage_account" "tfstate" {
  name                     = var.storage_name
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  account_replication_type = "GRS"

  tags = local.tags
}

resource "azurerm_storage_container" "tfstate" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "blob"
}


locals {
  tags = {
    managedBy = "Terraform"
  }
}
