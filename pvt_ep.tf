# Defining a private endpoint to connect storage account
resource "azurerm_private_endpoint" "example" {
  name                = "example-endpoint"  # Name of the Private Endpoint.
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  subnet_id           = azurerm_subnet.endpoint.id  # pvt-ept subnet id

  private_service_connection {
    name                           = "example-privateserviceconnection" #pvt service connection name
    private_connection_resource_id = azurerm_storage_account.example.id   # connect storage acc
    subresource_names              = ["blob"]   # Subresources to access in the storage acc
    is_manual_connection           = false  # automatic connection
  }
}