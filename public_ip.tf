# ip for Nw interface, later associated NIC with the Virtual Machine
resource "azurerm_public_ip" "public_ip" {
  name                = "public_ip" # name of public ip
  sku                 = "Standard"  # specifying sku
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"  # standard sku
}

# ip for application gw
resource "azurerm_public_ip" "example" {
  name                = "example-pip"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "Standard"
  allocation_method   = "Static"
}