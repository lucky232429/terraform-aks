variable "resource_group_name" {
  description = "Name of the Azure Resource Group to create"
  type        = string
}

variable "resource_group_location" {
  description = "Location of the Azure Resource Group"
  type        = string
}

variable "vnet_name" {
  description = "Name of the Azure Virtual Network to create"
  type        = string
}

variable "address_space" {
  description = "The address space that the Azure Virtual Network will use"
  type        = list(string)
}

/* variable "subnets" {
  default = {
    aks_subnet = "10.0.1.0/24"
    appgw_subnet = "10.0.2.0/24"
  }
} */