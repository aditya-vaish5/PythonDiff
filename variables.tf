variable azure_subscription_id {
  type = string
}

variable azure_client_id {
  type = string
}

variable azure_client_secret {
  type = string
}

variable azure_tenan_id {
  type = string
}

variable "TerraLocation" {
  type = string
}

variable "TerraResourceGroup" {
  type = string
}

variable "TerraVNet" {
  type = string
}

variable "TerraVM" {
  type = string
}

variable "TerraImage" {
  type = string
}

variable "TerraUser" {
  type = string
}

variable "TerraVNet2" {
  type = string
}

variable "TerraPeeringName" {
  type = string
}

variable "TerraVMSize" {
  type = string
}

variable "TerraVnetAddress" {
  type = list(string)
}

variable "TerraVnet2Address" {
  type = list(string)
}

variable "TerraSubNet" {
  type = string
}

variable "TerraSubNetAddress" {
  type = list(string)
}

variable "TerraSubNet2" {
  type = string
}

variable "TerraSubNetAddress2" {
  type = list(string)
}

variable "TerraPublicIPName" {
  type = string
}

variable "TerraNSG" {
  type = string
}

variable "TerraRouteTable" {
  type = string
}

variable "TerraRoute" {
  type = string
}

variable "TerraRoutePrefix" {
  type = string
}

variable "TerraNextHop" {
  type = string
}
