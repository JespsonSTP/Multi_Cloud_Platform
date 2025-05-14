output "ansible_vm_public_ip" {
  value = azurerm_public_ip.ansible.ip_address
}