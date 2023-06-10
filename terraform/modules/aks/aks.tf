data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "keyvault" {
  name                = var.key_vault_name
  resource_group_name = var.akv_resource_group_name
}

data "azurerm_key_vault_secret" "client-id" {
  name         = "client-id"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault_secret" "client-secret" {
  name         = "client-secret"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault_secret" "ssh-key" {
  name         = "ssh-key"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_subnet" "aks_subnet" {
  name                 = var.aks_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                    = var.cluster_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  dns_prefix              = var.cluster_name
  kubernetes_version      = var.kubernetes_version
  private_cluster_enabled = var.enable_private_cluster

  default_node_pool {
    name            = "default"
    node_count      = var.node_count
    vm_size         = var.vm_size
    type            = "VirtualMachineScaleSets"
    os_disk_size_gb = var.os_disk_size_gb
    vnet_subnet_id  = data.azurerm_subnet.aks_subnet.id
  }

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = data.azurerm_key_vault_secret.ssh-key.value
    }
  }

  service_principal {
    client_id     = data.azurerm_key_vault_secret.client-id.value
    client_secret = data.azurerm_key_vault_secret.client-secret.value
  }

  network_profile {
    network_plugin    = var.network_plugin
    network_policy    = var.network_policy
    outbound_type     = var.outbound_type
    load_balancer_sku = var.load_balancer_sku
  }

  /* role_based_access_control {
    enabled = true
    azure_active_directory {
      managed                = var.azure_active_directory_enabled
      admin_group_object_ids = [data.azurerm_key_vault_secret.admin-group-object-id.value]
    }
  } */

  tags = {
    "Terraform" = "true"
    "Environment"         = var.Environment
    "Created By"          = var.Created_By
  }
}

resource "azurerm_role_assignment" "acr-mi" {
  scope                = data.azurerm_subnet.aks_subnet.id
  role_definition_name = "Network Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}


