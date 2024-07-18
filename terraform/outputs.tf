output "acr_login_server" {
  description = "The login server of the Azure Container Registry"
  value       = azurerm_container_registry.acr.login_server
}

output "vm_public_ip" {
  description = "The public IP address of the virtual machine"
  value       = azurerm_public_ip.publicIP.ip_address
}
output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}