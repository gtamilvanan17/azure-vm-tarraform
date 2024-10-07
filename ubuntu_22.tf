resource "azurerm_linux_virtual_machine" "ubuntu_22_vm" {
  count               = var.deploy_ubuntu_22 ? 1 : 0
  name                = "Ubuntu22-${count.index}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = var.vm_size_ubuntu
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [azurerm_network_interface.ubuntu_22_nic[count.index].id]
  os_disk {
    caching              = "ReadWrite"
    managed_disk_type    = "Standard"
    disk_size_gb         = 30
  }
}

resource "azurerm_network_interface" "ubuntu_22_nic" {
  count               = var.deploy_ubuntu_22 ? 1 : 0
  name                = "nic-ubuntu-22-${count.index}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "ipconfig-${count.index}"
    subnet_id                     = azurerm_subnet.private_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
