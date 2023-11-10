resource "azurerm_availability_set" "example" {
  name                = "example-avset"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}