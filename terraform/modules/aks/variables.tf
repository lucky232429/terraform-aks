variable "resource_group_name" {
  description = "Name of the Azure Resource Group to create"
  type        = string
}

variable "resource_group_location" {
  description = "Location of the Azure Resource Group"
  type        = string
}

variable "key_vault_name" {
  description = "Name of the Azure Key Vault to create"
  type        = string
}

variable "aks_subnet_name" {
  description = "Name of the subnet to be used by AKS"
  type        = string
}

variable "vnet_name" {
  description = "Name of the Azure Virtual Network to create"
  type        = string
}

variable "cluster_name" {
  description = "Name of the Azure Virtual Network to create"
  type        = string
}

variable "node_count" {
  description = "Name of the Azure Virtual Network to create"
  type        = string
}

variable "vm_size" {
  description = "Name of the Azure Virtual Network to create"
  type        = string
}

variable "os_disk_size_gb" {
  description = "Name of the Azure Virtual Network to create"
  type        = string
}

variable "network_plugin" {
  description = "Network plugin to use for networking. Currently supported values are azure and kubenet"
  type        = string
  default     = "azure"
}

variable "network_policy" {
  description = "Sets up network policy to be used with Azure CNI"
  type        = string
  default     = "azure"
}

variable "outbound_type" {
  description = "he outbound (egress) routing method which should be used for this Kubernetes Cluster"
  type        = string
  default     = "loadBalancer"
}

variable "azure_active_directory_enabled" {
  description = "managed ad integtaion  in aks cluster"
  type        = bool
  default     = true
}

variable "kubernetes_version" {
  description = "kubernetes version"
}

variable "enable_private_cluster" {
  description = "enable private cluster"
  default     = false
}

variable "load_balancer_sku" {}

variable "common_rg_name" {}




