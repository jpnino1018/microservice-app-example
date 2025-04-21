provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

provider "kubernetes" {
  config_path = var.kubeconfig_path
}

resource "azurerm_resource_group" "microservices_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.microservices_rg.name
  location            = azurerm_resource_group.microservices_rg.location
  sku                 = "Standard"
  admin_enabled       = true
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_name
  location            = azurerm_resource_group.microservices_rg.location
  resource_group_name = azurerm_resource_group.microservices_rg.name
  dns_prefix          = "microservices"

  default_node_pool {
    name       = "default"
    node_count = var.aks_node_count
    vm_size    = var.aks_node_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

  network_profile {
    network_plugin = "azure"
  }
}

resource "azurerm_redis_cache" "redis_queue" {
  name                = var.redis_name
  location            = azurerm_resource_group.microservices_rg.location
  resource_group_name = azurerm_resource_group.microservices_rg.name
  capacity            = 2
  family              = "C"
  sku_name            = "Standard"
}

resource "azurerm_api_management" "apim" {
  name                = var.apim_name
  location            = azurerm_resource_group.microservices_rg.location
  resource_group_name = azurerm_resource_group.microservices_rg.name
  publisher_name      = var.apim_publisher_name
  publisher_email     = var.apim_publisher_email
  sku_name            = "Developer_1"
}

resource "kubernetes_namespace" "microservices_ns" {
  metadata {
    name = var.k8s_namespace
  }
}
