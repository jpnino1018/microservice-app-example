provider "azurerm" {
  features {}
  #INSERT YOUR SUBSCRIPTION ID
  subscription_id = ""
}

# Resource Group
resource "azurerm_resource_group" "microservices_rg" {
  name     = "microservices-rg"
  location = "East US"
}

# Azure Container Registry (ACR)
resource "azurerm_container_registry" "acr" {
  name                = "acrformymicroservices"
  resource_group_name = azurerm_resource_group.microservices_rg.name
  location            = azurerm_resource_group.microservices_rg.location
  sku                 = "Standard"
  admin_enabled       = true
}

# Azure Kubernetes Service (AKS)
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "microservices-aks"
  location            = azurerm_resource_group.microservices_rg.location
  resource_group_name = azurerm_resource_group.microservices_rg.name
  dns_prefix          = "microservices"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2ms"
  }

  identity {
    type = "SystemAssigned"
  }

  # Attach ACR to AKS
  role_based_access_control_enabled = true
  network_profile {
    network_plugin = "azure"
  }
}


# Azure Redis Cache
resource "azurerm_redis_cache" "redis_queue" {
  name                = "microservices-redis"
  location            = azurerm_resource_group.microservices_rg.location
  resource_group_name = azurerm_resource_group.microservices_rg.name
  capacity            = 2
  family              = "C"
  sku_name            = "Standard"
}

# Azure API Management
resource "azurerm_api_management" "apim" {
  name                = "microservices-apim"
  location            = azurerm_resource_group.microservices_rg.location
  resource_group_name = azurerm_resource_group.microservices_rg.name
  publisher_name      = "Microservices Inc."
  publisher_email     = "admin@microservices.com"
  sku_name            = "Developer_1"
}

provider "kubernetes" {
  config_path = "kubeconfig.yaml"
}

resource "kubernetes_namespace" "microservices_ns" {
  metadata {
    name = "microservices"
  }
}
