variable "env" {
  description = "Prefix for resource names"
  type        = string
}


variable "subscription_id" {
  description = "Azure region"
  type        = string
}
variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_names" {
  description = "Map of environment to resource group names"
  type        = map(string)
  default = {
    dev  = "azureplatfrom-dev"
    prod = "azureplatfrom-prod"
  }
}


variable "vnet_address_space" {
  description = "Azure region"
  type        = string
}
