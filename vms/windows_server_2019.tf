resource "azurerm_windows_virtual_machine" "windows_server" {
  count = var.deploy_windows_server ? 1 : 0

  name                = "windowsserver-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size_windows
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [azurerm_network_interface.windows_server_nic[0].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  availability_zone = null  # No infrastructure redundancy required
  security_type    = "Standard"
  architecture      = "x64"
}
