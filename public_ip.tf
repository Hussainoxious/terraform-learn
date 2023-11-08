resource "azurerm_public_ip" "public_ip" {
  name                = "public_ip"
  sku                 = "Standard"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
}