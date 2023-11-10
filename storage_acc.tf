# defining a storage account
resource "azurerm_storage_account" "example" {
  name                     = "hussxstorage3x"   # name of the storage acc
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard" # standard/premium
  account_replication_type = "GRS"  # LRS/GRS/RAGRS redundancy
}