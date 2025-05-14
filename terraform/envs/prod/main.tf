provider "azurerm" {
  features {}
}

module "hub" {
  source = "../../modules/hub"

  name                         = "ent-hub-prod"
  location                     = "East US"
  resource_group_name          = "rg-ent-hub-prod"
  vnet_address_space           = "10.0.0.0/16"
  gateway_subnet_prefix        = "10.0.0.0/24"
  firewall_subnet_prefix       = "10.0.1.0/24"
  shared_services_subnet_prefix = "10.0.2.0/24"

  tags = {
    environment = "prod"
    project     = "enterprise-cloud"
    owner       = "infra-team"
  }
}