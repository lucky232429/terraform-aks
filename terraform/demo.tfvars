resource_group_name         = "Terraform-AKS-Demo"
location     = "eastus"
Environment                 = "Demo"
Created_By                  = "Terraform"

/* Vnet values: */
vnet_name                   = "code-challenge-vnet"
aks_subnet_name             = "aks-subnet"
vnet_address_space          = ["10.0.0.0/8"]
vm_size                     = "Standard_D2_v2"
node_count                  = "1"
load_balancer_sku           = "standard"

key_vault_name              = "terraform-demo-akv"

/* Kubernetes values */
kubernetes_version          = "1.25.6"
cluster-name                = "code-challenge-aks"

/* Acr */
acr_name                    = "codechallengechn"

# log analytics
log_retention_in_days       = "30"
log_analytics_workspace_name= "code-challenge"
log_analytics_workspace_sku = "PerGB2018"

