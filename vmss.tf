# Defining a virtual machine scale set
resource "azurerm_virtual_machine_scale_set" "example" {
  name                = "mytestscaleset-1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  upgrade_policy_mode  = "Automatic"  # automatic upgrade

# size and tier of the VM instances
  sku {
    name     = "Standard_F2"
    tier     = "Standard"
    capacity = 1
  }

# specify image reference
  storage_profile_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

# Configure OS disk for the VM instances
  storage_profile_os_disk {
    name              = ""
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

# additional data disks for the VM
  storage_profile_data_disk {
    lun           = 0
    caching       = "ReadWrite"
    create_option = "Empty"
    disk_size_gb  = 10
  }

#computer name prefix, admin username, and password for VM
  os_profile {
    computer_name_prefix = "testvm"
    admin_username       = "myadmin"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false # set password auth

  }

# network settings
  network_profile {
    name    = "terraformnetworkprofile"
    primary = true
    # configuring ip configuration
    ip_configuration {
      name                                   = "TestIPConfiguration"
      primary                                = true
      subnet_id                              = azurerm_subnet.internal.id
    }
  }
}