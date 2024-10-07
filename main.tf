provider "azurerm" {
  features {}
}

# Create Resource Group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = [var.vnet_address_space]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

# Create Public Subnet
resource "azurerm_subnet" "public_subnet" {
  name                 = var.public_subnet_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.public_subnet_address_prefix]
}

# Create Private Subnet
resource "azurerm_subnet" "private_subnet" {
  name                 = var.private_subnet_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.private_subnet_address_prefix]
}

# Network Security Group for Public Subnet
resource "azurerm_network_security_group" "nacl_public" {
  name                = var.public_nacl_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  # Inbound Security Rules
  security_rule {
    name                       = "Allow_HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix  = "*"
  }

  security_rule {
    name                       = "Allow_HTTPS"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix  = "*"
  }

  security_rule {
    name                       = "Allow_RDP"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix  = "*"
  }

}

# Network Security Group for Private Subnet
resource "azurerm_network_security_group" "nacl_private" {
  name                = var.private_nacl_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  # Inbound Security Rules
  security_rule {
    name                       = "Allow_SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = azurerm_network_interface.windows_server_nic[0].private_ip_address
    destination_address_prefix  = "*"
  }
}

# Create Public IPs for VMs
resource "azurerm_public_ip" "public_ip" {
  count               = var.deploy_windows_10 ? 1 : 0 + var.deploy_windows_11 ? 1 : 0
  name                = "public-ip-${count.index}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Dynamic"
  sku                 = "Standard"
}

# Call VM Definitions
module "windows_10" {
  source = "./vms/windows_10.tf"
}

module "windows_11" {
  source = "./vms/windows_11.tf"
}

module "windows_server" {
  source = "./vms/windows_server.tf"
}

module "ubuntu_22" {
  source = "./vms/ubuntu_22.tf"
}
