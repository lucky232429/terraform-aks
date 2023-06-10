module "rg" {
  source                      = "./modules/rg"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  Environment                 = var.Environment
  Created_By                  = var.Created_By
}

module "vnet" {
  source                      = "./modules/vnet"
  vnet_name                   = var.vnet_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  vnet_address_space          = var.vnet_address_space
  aks_subnet_name             = var.aks_subnet_name
  Environment                 = var.Environment
  Created_By                  = var.Created_By

  depends_on = [
    module.rg
  ]
}

module "acr" {
  source                           = "./modules/acr"
  acr_name                         = var.acr_name
  Environment                      = var.Environment
  Created_By                       = var.Created_By
  resource_group_name              = var.resource_group_name
  location                         = var.location

  depends_on = [
    module.rg
  ]
}

module "aks" {
  source                           = "./modules/aks"
  resource_group_name              = var.resource_group_name
  location                         = var.location
  kubernetes_version               = var.kubernetes_version
  cluster_name                     = var.cluster-name
  network_plugin                   = "azure"
  aks_subnet_name                  = var.aks_subnet_name
  os_disk_size_gb                  = 30
  Environment                      = var.Environment
  Created_By                       = var.Created_By
  vnet_name                        = var.vnet_name
  vm_size                          = var.vm_size
  node_count                       = var.node_count
  load_balancer_sku                = var.load_balancer_sku
  key_vault_name                   = var.key_vault_name

  depends_on = [
    module.rg,
    module.vnet,
    module.acr,
    module.log-analytics
  ]
}

module "log-analytics" {
  source                          = "./modules/log-analytics"
  log_analytics_workspace_name    = var.log_analytics_workspace_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  log_analytics_workspace_sku     = var.log_analytics_workspace_sku
  log_retention_in_days           = var.log_retention_in_days   
  Environment                     = var.Environment  
  Created_By                      = var.Created_By 

  depends_on = [
    module.rg
  ]
}