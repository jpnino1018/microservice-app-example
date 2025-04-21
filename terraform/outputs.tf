output "resource_group" {
  value = azurerm_resource_group.microservices_rg.name
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks_cluster.name
}

output "redis_hostname" {
  value = azurerm_redis_cache.redis_queue.hostname
}

output "apim_gateway_url" {
  value = azurerm_api_management.apim.gateway_url
}
