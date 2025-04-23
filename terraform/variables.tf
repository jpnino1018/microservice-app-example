variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  default     = "94101e63-55cd-434a-bf37-69fa8ccffe39"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "microservices-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "acr_name" {
  description = "Name of the Azure Container Registry (ACR)"
  type        = string
  default     = "acrformymicroservices-test"
}

variable "aks_name" {
  description = "Name of the Azure Kubernetes Service (AKS) cluster"
  type        = string
  default     = "microservices-aks"
}

variable "aks_node_count" {
  description = "Number of nodes in the AKS cluster"
  type        = number
  default     = 1
}

variable "aks_node_vm_size" {
  description = "Size of the virtual machines for AKS nodes"
  type        = string
  default     = "Standard_B2ms"
}

variable "redis_name" {
  description = "Name of the Azure Redis Cache instance"
  type        = string
  default     = "microservices-redis"
}

variable "apim_name" {
  description = "Name of the Azure API Management service"
  type        = string
  default     = "microservices-apim"
}

variable "apim_publisher_name" {
  description = "Publisher name for API Management"
  type        = string
  default     = "Microservices Inc."
}

variable "apim_publisher_email" {
  description = "Publisher email for API Management"
  type        = string
  default     = "admin@microservices.com"
}

variable "kubeconfig_path" {
  description = "Path where the Kubernetes configuration file will be saved"
  type        = string
  default     = "kubeconfig.yaml"
}

variable "k8s_namespace" {
  description = "Namespace in Kubernetes where the microservices will be deployed"
  type        = string
  default     = "microservices"
}
