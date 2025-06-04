resource "azurerm_virtual_network" "hub" {
  name                = "${var.env}-hub-vnet"
  address_space       = [var.vnet_address_space]
  location            = var.location
  resource_group_name = var.resource_group_name

}

