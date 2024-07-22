# Security group con las reglas de acceso para la máquina virtual
resource "azurerm_network_security_group" "securityGroup" {
  name                = "securityGroupPruebaPractica2"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
# Puerto 22 SSH
  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
# Puerto 80
  security_rule {
    name                       = "HTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
# Puerto 443
  security_rule {
    name                       = "HTTPS"
    priority                   = 1003
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    source = "PR2"
  }
}
# Se vincula el rol para hacer recuperar las imagenes del repositorio de ACR al AKS creado
resource "azurerm_role_assignment" "aks_acr_pull" {
  principal_id   = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope         = azurerm_container_registry.acr.id
}
