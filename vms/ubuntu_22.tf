resource "azurerm_linux_virtual_machine" "ubuntu_22" {
  count = var.deploy_ubuntu_22 ? 1 : 0

  name                = "ubuntu22-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size_ubuntu
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [azurerm_network_interface.ubuntu_22_nic[0].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "22.04-LTS"
    version   = "latest"
  }

  availability_zone = null  # No infrastructure redundancy required
  security_type    = "Standard"
  architecture      = "x64"
}
