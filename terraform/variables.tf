variable "resource_group_name" {
  description = "Nombre del grupo de recursos "
  type        = string
}

variable "location" {
  description = "Region de Azure donde se van a crear los recursos"
  type        = string
  default     = "Spain Central"
}

variable "admin_username" {
  description = "nombre de usuario"
  type        = string
}

variable "admin_password" {
  description = "Password para la maquina virtual"
  type        = string
  sensitive   = true
}

variable "acr_name" {
  description = "Nombre del Registro"
  type        = string
}
variable "hostname" {
  description = "Nombre de la maquina"
  type        = string
  default = "VmPrueba"
}
variable "aks_cluster_name" {
  description = "Nombre del clúster de AKS"
  type        = string
}

variable "aks_dns_prefix" {
  description = "Prefijo DNS para el clúster de AKS"
  type        = string
}

variable "aks_node_count" {
  description = "Número de nodos en el pool predeterminado de AKS."
  type        = number
  default     = 2
}