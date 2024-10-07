# Windows 10 VM
resource "azurerm_windows_virtual_machine" "windows_10" {
  count = var.deploy_windows_10 ? 1 : 0

  name                = "windows10-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size_windows
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [azurerm_network_interface.windows_10_nic[0].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "Windows-10-Pro"
    sku       = "22H2"
    version   = "latest"
  }

  availability_zone = null  # No infrastructure redundancy required
  security_type    = "Standard"
  architecture      = "x64"
}

# Windows 11 VM
resource "azurerm_windows_virtual_machine" "windows_11" {
  count = var.deploy_windows_11 ? 1 : 0

  name                = "windows11-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size_windows
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [azurerm_network_interface.windows_11_nic[0].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "Windows-11-Pro"
    sku       = "22H2"
    version   = "latest"
  }

  availability_zone = null  # No infrastructure redundancy required
  security_type    = "Standard"
  architecture      = "x64"
}

# Windows Server 2019 VM
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

# Ubuntu 22.04 VM
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
