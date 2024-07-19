resource "azurerm_virtual_network" "main" {
  name                = "VnetPractica2"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags = {
    environment = "PR2"
  }
}

resource "azurerm_subnet" "subnet" {
  name                 = "SubnetPractica2"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
  
  
}

resource "azurerm_public_ip" "publicIP" {
  name                = "PublicIPPractica2"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Dynamic"
  
  tags = {
    environment = "PR2"
  }
}

resource "azurerm_network_interface" "nic" {
  name                = "NICPractica2"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicIP.id
  }
  tags = {
    environment = "PR2"
  }
}
