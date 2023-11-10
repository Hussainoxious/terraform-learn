#Defining virtual machine resource

resource "azurerm_virtual_machine" "main" {
  name                  = "example-vm"  # name of vm
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.main.id]   # refers to public_ip via nic
  vm_size               = "Standard_DS1_v2"
  availability_set_id = azurerm_availability_set.example.id     # associate vm with av-set

  # to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  #reference to os image
  storage_image_reference { 
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  #os disk config
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  #comp name and admin credentials
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false # true for ssh
  }
}