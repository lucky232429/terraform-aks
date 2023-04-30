output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
}

output "id" {
  value = data.azurerm_subnet.aks_subnet.id
}