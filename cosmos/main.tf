terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  # skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

# Defining resource grp
resource "azurerm_resource_group" "example" {
  name     = "hus-resources" # naming resource grp
  location = "Central India"  # setting a location
}

resource "azurerm_cosmosdb_account" "db" {
  name                = "newcosmos"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  offer_type          = "Standard"
  kind                = "MongoDB"

  enable_automatic_failover = true

  capabilities {
    name = "mongoEnableDocLevelTTL"
  }

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  geo_location {
    location          = "eastus"
    failover_priority = 1
  }
}

resource "azurerm_cosmosdb_sql_database" "db" {
  name = "products"
  resource_group_name = azurerm_resource_group.example.name
  account_name = azurerm_cosmosdb_account.db.name
}

#Azure Cosmos DB database container
resource "azurerm_cosmosdb_sql_container" "coll" {
  name = "Devices"
  resource_group_name = azurerm_resource_group.example.name
  account_name = azurerm_cosmosdb_account.db.name
  database_name = azurerm_cosmosdb_sql_database.db.name
  partition_key_path = "/Devices"
}