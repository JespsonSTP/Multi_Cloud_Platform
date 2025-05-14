output "vnet_id" {
  value = azurerm_virtual_network.hub.id
}

output "firewall_ip" {
  value = azurerm_public_ip.firewall.ip_address
}

output "firewall_subnet_id" {
  value = azurerm_subnet.firewall.id
}

output "shared_services_subnet_id" {
  value = azurerm_subnet.shared.id
}
