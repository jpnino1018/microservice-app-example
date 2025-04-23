output "resource_group" {
  description = "Name of the created Azure Resource Group"
  value       = azurerm_resource_group.microservices_rg.name
}

output "acr_login_server" {
  description = "Login server URL for the Azure Container Registry (ACR)"
  value       = azurerm_container_registry.acr.login_server
}

output "aks_cluster_name" {
  description = "Name of the Azure Kubernetes Service (AKS) cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.name
}

output "redis_hostname" {
  description = "Hostname of the Azure Redis Cache instance"
  value       = azurerm_redis_cache.redis_queue.hostname
}

output "apim_gateway_url" {
  description = "Gateway URL for the Azure API Management instance"
  value       = azurerm_api_management.apim.gateway_url
}
