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
resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "canadacentral"
  tags = {
    Environment = "Terraform Getting Started"
    Team        = "DevOps"
  }
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}
