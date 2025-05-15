terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.3.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "azureplatfrom"
    storage_account_name = "platfromterrstorage"
    container_name = "platfromtfbacken"
    key = "terraform.tfstate"
  }
}
provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}
