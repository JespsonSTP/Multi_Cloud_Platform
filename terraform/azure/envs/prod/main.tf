resource "azurerm_resource_group" "cloud_platform" {
  name     = var.resource_group_name
  location = var.location
}


module "hub" {
  source = "../../module/hub"
  env = var.env
  resource_group_name = azurerm_resource_group.cloud_platform.name
  location = azurerm_resource_group.cloud_platform.location
  vnet_address_space = var.vnet_address_space
}