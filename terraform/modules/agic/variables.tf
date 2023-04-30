variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "resource_group_location" {
  type        = string
  description = "The Azure location where the resources will be created."
}

variable "appgw_pip_name" {}

variable "appgw_name" {}

variable "gateway_ip_configuration_name" {}

variable "frontend_ip_configuration_name" {}

variable "appgw_subnet_name" {}

variable "vnet_name" {}