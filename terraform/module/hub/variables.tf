variable "name" {
  description = "Prefix for resource names"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "vnet_address_space" {
  description = "VNet CIDR block"
  type        = string
}

variable "gateway_subnet_prefix" {
  description = "CIDR block for GatewaySubnet"
  type        = string
}

variable "firewall_subnet_prefix" {
  description = "CIDR block for AzureFirewallSubnet"
  type        = string
}

variable "shared_services_subnet_prefix" {
  description = "CIDR block for shared services subnet"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}
