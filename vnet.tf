resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]   # address space of Vnet
  location            = azurerm_resource_group.example.location # location of resource grp
  resource_group_name = azurerm_resource_group.example.name # name of resource grp
}