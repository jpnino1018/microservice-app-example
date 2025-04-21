variable "subscription_id" {
    default = ""
}

variable "resource_group_name" {
  default = "microservices-rg"
}

variable "location" {
  default = "East US"
}

variable "acr_name" {
  default = "acrformymicroservices"
}

variable "aks_name" {
  default = "microservices-aks"
}

variable "aks_node_count" {
  default = 1
}

variable "aks_node_vm_size" {
  default = "Standard_B2ms"
}

variable "redis_name" {
  default = "microservices-redis"
}

variable "apim_name" {
  default = "microservices-apim"
}

variable "apim_publisher_name" {
  default = "Microservices Inc."
}

variable "apim_publisher_email" {
  default = "admin@microservices.com"
}

variable "kubeconfig_path" {
  default = "kubeconfig.yaml"
}

variable "k8s_namespace" {
  default = "microservices"
}
