variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "subscription_id" {}

variable "resource_group_name" {
  default = "vm-deployment-rg"
}

variable "location" {
  default = "centralindia"
}

variable "vnet_name" {
  default = "test-vnet"
}

variable "public_subnet_name" {
  default = "public-subnet"
}

variable "private_subnet_name" {
  default = "private-subnet"
}

variable "nsg_name" {
  default = "public-nsg"
}

variable "windows_vm_size" {
  default = "Standard_D2s_v3"
}

variable "ubuntu_vm_size" {
  default = "Standard_B1ms"
}

variable "admin_username" {
  default = "adminuser"
}

variable "admin_password" {
  default = "P@ssw0rd1234!"
}
