variable "resource_group_name" {}

variable "location" {}

variable "key_vault_name" {}

variable "aks_subnet_name" {}

variable "vnet_name" {}

variable "cluster_name" {}

variable "node_count" {}

variable "vm_size" {}

variable "os_disk_size_gb" {}

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

/* variable "azure_active_directory_enabled" {
  description = "managed ad integtaion  in aks cluster"
  type        = bool
  default     = true
} */

variable "kubernetes_version" {
  description = "kubernetes version"
}

variable "enable_private_cluster" {
  description = "enable private cluster"
  default     = false
}

variable "load_balancer_sku" {}

variable "Environment" {
}
variable "Created_By" {
}

variable "akv_resource_group_name" {
  default = "Terraform-Remote-State-RG"
}




