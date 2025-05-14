variable "location" {
  default = "East US"
}

variable "resource_group" {
  default = "rg-packer"
}

source "azure-arm" "ubuntu_awx" {
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id

  managed_image_resource_group_name = var.resource_group
  managed_image_name                = "awx-image"
  location                          = var.location

  os_type  = "Linux"
  image_publisher = "Canonical"
  image_offer     = "0001-com-ubuntu-server-jammy"
  image_sku       = "22_04-lts-gen2"
  image_version   = "latest"
  build_resource_group_name = "${var.resource_group}-build"
  vm_size = "Standard_B2s"
}

build {
  sources = ["source.azure-arm.ubuntu_awx"]

  provisioner "shell" {
    script = "scripts/install_awx.sh"
  }
}
