output "windows_10_public_ip" {
  value = azurerm_public_ip.public_ip[0].ip_address
  description = "Public IP address of the Windows 10 VM"
  depends_on = [azurerm_windows_virtual_machine.windows_10]
}

output "windows_11_public_ip" {
  value = azurerm_public_ip.public_ip[1].ip_address
  description = "Public IP address of the Windows 11 VM"
  depends_on = [azurerm_windows_virtual_machine.windows_11]
}

output "windows_server_private_ip" {
  value = azurerm_network_interface.windows_server_nic[0].ip_configuration[0].private_ip_address
  description = "Private IP address of the Windows Server 2019 VM"
  depends_on = [azurerm_windows_virtual_machine.windows_server]
}

output "ubuntu_22_private_ip" {
  value = azurerm_network_interface.ubuntu_22_nic[0].ip_configuration[0].private_ip_address
  description = "Private IP address of the Ubuntu 22.04 VM"
  depends_on = [azurerm_linux_virtual_machine.ubuntu_22]
}
