terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"
    }
  }
  
  backend "azurerm" {}
}


provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

locals {
  # Determine resource group name based on environment
  resource_group_name = var.env == "dev" ? "dev-resource-group" : "prod-resource-group"
}

resource "azurerm_resource_group" "cloud_platform" {
  name     = var.resource_group_names[var.env]
  location = var.location
  
  tags = {
    Environment = var.env
  }
}