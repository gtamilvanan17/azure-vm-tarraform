resource "azurerm_windows_virtual_machine" "windows_10_vm" {
  count               = var.deploy_windows_10 ? 1 : 0
  name                = "Windows10-${count.index}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = var.vm_size_windows
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [azurerm_network_interface.windows_10_nic[count.index].id]
  os_disk {
    caching              = "ReadWrite"
    managed_disk_type    = "Standard"
    disk_size_gb         = 30
  }
}

resource "azurerm_network_interface" "windows_10_nic" {
  count               = var.deploy_windows_10 ? 1 : 0
  name                = "nic-windows10-${count.index}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "ipconfig-${count.index}"
    subnet_id                     = azurerm_subnet.public_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip[count.index].id
  }
}
