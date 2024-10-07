output "windows_vm_public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "ubuntu_vm_private_ip" {
  value = azurerm_network_interface.ubuntu_nic.private_ip_address
}
