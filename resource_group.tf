# Defining resource grp
resource "azurerm_resource_group" "example" {
  name     = "husx-resources" # naming resource grp
  location = "Central India"  # setting a location
}