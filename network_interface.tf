# associated this to VM
resource "azurerm_network_interface" "main" {
  name                = "example-nic" # name of nic
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic" # allocation method dynamic/static
    public_ip_address_id = azurerm_public_ip.public_ip.id # using created publc ip
  }
}