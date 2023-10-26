# terraform-infra

Provision infrastructure to use as base for Terraform.

## Prerequisites

- Terraform ([Installation guide](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli)).
- Azure CLI ([Installation guide](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)).
- Authenticate via Azure CLI and create Service Principal ([Guide](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build)).

## Modules

- **[storage-backend](./storage-backend/README.md)** - This module provisions Azure Blob Storage to be used as Terraform state storage for all other modules. It is the only module that utilizes local state storage.

## Deployment

The [storage-backend](./storage-backend/main.tf) module must be applied first, because it provisions state storage for all other modules.

Apply a module:

1. `cd` to directory of the module.
2. Define variables in a `.tfvars` file, e.g. `prod.tfvars`.
3. Initialize module: `terraform init`.
4. Apply module: `terraform apply -var-file="prod.tfvars"`.
