# az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTION_ID"

#  {
#   "appId": "40e32bc0-55cb-4af7-bcb5-1db787c244b0",
# 40e32bc0-55cb-4af7-bcb5-1db787c244b0
#   "displayName": "azure-cli-2020-06-02-21-38-13",
#   "name": "http://azure-cli-2020-06-02-21-38-13",
#   "password": "n8>3tC5qn1vMV)OlZN5BTS>R\"#(dJ7]a",
# n8>3tC5qn1vMV)OlZN5BTS>R\"#(dJ7]a
#   "tenant": "335836de-42ef-43a2-b145-348c2ee9ca5b"
# 335836de-42ef-43a2-b145-348c2ee9ca5b
# }
# subscription_id = 1e370135-747d-4cd0-93b8-625861a34cfa
# 1e370135-747d-4cd0-93b8-625861a34cfa

#  az login --service-principal -u "40e32bc0-55cb-4af7-bcb5-1db787c244b0" -p "n8>3tC5qn1vMV)OlZN5BTS>R\"#(dJ7]a" --tenant "335836de-42ef-43a2-b145-348c2ee9ca5b"


# Configure the Azure provider
provider "azurerm" {
  version = "~>1.32.0"
}

# Create a new resource group
resource "azurerm_resource_group" "main" {
  name     = var.TerraResourceGroup
  location = var.TerraLocation
  tags = {
    Environment = "Terraform Getting Started"
    Team        = "DevOps"
  }
}

# Create a virtual network
resource "azurerm_virtual_network" "main" {
  name                = var.TerraVNet
  address_space       = var.TerraVnetAddress
  location            = var.TerraLocation
  resource_group_name = azurerm_resource_group.main.name
}

# Create a subnet
resource "azurerm_subnet" "main" {
  name                 = var.TerraSubNet
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefix       = var.TerraSubNetAddress[0]
}

# create network interface
resource "azurerm_network_interface" "main" {
  name                = var.TerraPublicIPName
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
  }
}
# #Create a Virtual Machine

resource "azurerm_virtual_machine" "main" {
  name                  = var.TerraVM
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "adityav"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}

resource "azurerm_route_table" "main" {
  name                = var.TerraRouteTable
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  route {
    name                   = var.TerraRoute
    address_prefix         = var.TerraRoutePrefix
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.TerraNextHop
  }
}

output "op1" {
  value = azurerm_route_table.main
}

resource "azurerm_subnet_route_table_association" "new" {
  subnet_id      = azurerm_subnet.main.id
  route_table_id = azurerm_route_table.main.id
}


output "op2" {
  value = azurerm_route_table.main
}
