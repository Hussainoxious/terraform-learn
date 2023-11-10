# creating 3 subnets in the Vnet

# for pvt endpoint
resource "azurerm_subnet" "endpoint" {
  name                 = "endpoint" # name of the subnet
  resource_group_name  = azurerm_resource_group.example.name  #name of resource grp
  virtual_network_name = azurerm_virtual_network.example.name #name of vnet
  address_prefixes     = ["10.0.2.0/24"]  # address range of subnet

  enforce_private_link_endpoint_network_policies = true
}

# other resources
resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.3.0/24"]
}

# application gateway
resource "azurerm_subnet" "frontend" {
  name                 = "frontend"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.5.0/24"]
}