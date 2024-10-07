# Resource Group
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "sne-devops"
}

# Location
variable "location" {
  description = "The Azure region to deploy the resources"
  type        = string
  default     = "centralindia"
}

# VNet Configurations
variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "sne-devops-vnet"
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = string
  default     = "192.168.0.0/16"
}

# Subnet Configurations
variable "public_subnet_name" {
  description = "The name of the public subnet"
  type        = string
  default     = "sne-devops-vnet-subnet-public"
}

variable "public_subnet_address_prefix" {
  description = "Address prefix for the public subnet"
  type        = string
  default     = "192.168.50.0/24"
}

variable "private_subnet_name" {
  description = "The name of the private subnet"
  type        = string
  default     = "sne-devops-vnet-subnet-private"
}

variable "private_subnet_address_prefix" {
  description = "Address prefix for the private subnet"
  type        = string
  default     = "192.168.100.0/24"
}

# NSG Configurations
variable "public_nsg_name" {
  description = "Name of the Network Security Group for the public subnet"
  type        = string
  default     = "sne-devops-nsg-public"
}

variable "private_nsg_name" {
  description = "Name of the Network Security Group for the private subnet"
  type        = string
  default     = "sne-devops-nsg-private"
}

# VM Configurations
variable "admin_username" {
  description = "Admin username for the VMs"
  type        = string
  default     = "tamilvanan"
}

variable "admin_password" {
  description = "Admin password for the VMs"
  type        = string
  sensitive   = true
}

variable "vm_size_windows" {
  description = "The size of the Windows VMs"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "vm_size_ubuntu" {
  description = "The size of the Ubuntu VMs"
  type        = string
  default     = "Standard_D2s_v3"
}

# Deployment Toggle (True/False)
variable "deploy_windows_10" {
  description = "Flag to deploy Windows 10 VM"
  type        = bool
  default     = false
}

variable "deploy_windows_11" {
  description = "Flag to deploy Windows 11 VM"
  type        = bool
  default     = true
}

variable "deploy_windows_server" {
  description = "Flag to deploy Windows Server 2019 VM"
  type        = bool
  default     = false
}

variable "deploy_ubuntu_22" {
  description = "Flag to deploy Ubuntu 22.04 VM"
  type        = bool
  default     = true
}

# Subnet Assignment for VMs (Public/Private)
variable "windows_10_subnet" {
  description = "Subnet for Windows 10 VM (public or private)"
  type        = string
  default     = "public"
}

variable "windows_11_subnet" {
  description = "Subnet for Windows 11 VM (public or private)"
  type        = string
  default     = "public"
}

variable "windows_server_subnet" {
  description = "Subnet for Windows Server VM (public or private)"
  type        = string
  default     = "private"
}

variable "ubuntu_22_subnet" {
  description = "Subnet for Ubuntu 22.04 VM (public or private)"
  type        = string
  default     = "private"
}
