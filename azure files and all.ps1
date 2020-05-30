#Variables

$ResourceGroup = 'DemoRG'
$VNet = 'DemoVnet'
$Location = 'canadacentral'
$VM = 'DemoVM'
$Image = 'UbuntuLTS'
$User = 'adityav'
$Password = 'BDt2$Am7&yadd'
$VNet = 'DemoVNet'
$VNet2 = 'DemoVNet2'
$PeeringName = 'Vnet1toVnet2'
$Address = '10.0.1.0/24'
$VMSize = 'Standard_B1s'
$AvailabilitySet = 'DemoAS'
$VnetAddress = '10.0.0.0/16'
$Vnet2Address = '10.1.0.0/16'
$SubNet = 'DemoSubnet'
$SubNetAddress = '10.0.1.0/24'
$SubNet2 = 'DemoSubnet2'
$SubNetAddress2 = '10.1.1.0/24'
$PublicIPName = 'DemoIP'
$NSG = 'MyNSG'
# Create a resouce group
az group create --name $ResourceGroup --location $Location

# list of images available for vm
az vm image list --output table 

#find all vm sizes
az vm list-sizes --location eastus --output table

# create a VM
az vm create --resource-group $ResourceGroup --name $VM --image $Image --size $VMsize --admin-username $User --generate-ssh-keys

# get status of a vm
az vm get-instance-view --name $VM --resource-group $ResourceGroup --query instanceView.statuses[1] --output table

# create a vnet
az network vnet create --resource-group $ResourceGroup --name $VNet --address-prefix $VnetAddress --subnet-name $SubNet --subnet-prefix $SubNetAddress

# create another Vnet
az network vnet create --resource-group $ResourceGroup --name $VNet2 --address-prefix $Vnet2Address --subnet-name $SubNet2 --subnet-prefix $SubNetAddress2

# Peer 2 vnet (Vnet1) and (Vnet2)
az network vnet peering create -g $ResourceGroup -n $PeeringName --vnet-name $VNet --remote-vnet $VNet2 --allow-vnet-access

# create a subnet
az network vnet subnet create --resource-group $ResourceGroup --vnet-name $VNet --name $SubNet --address-prefix $SubNetAddress

# deallocating a VM
az vm deallocate --resource-group $ResourceGroup --name $VM

# create an IP
az network public-ip create --resource-group $ResourceGroup --name $PublicIPName

# Alocate a VM to an IP (Using static allocation rather than default dynamic allocation)
az network public-ip update --resource-group $ResourceGroup --name $PublicIPName --allocation-method static

# Start a VM
az vm start --resource-group $ResourceGroup --name $VM --no-wait

# Create an NSG
az network nsg create --resource-group $ResourceGroup --name $NSG

# Update a subnet with an NSG
az network vnet subnet update --resource-group $ResourceGroup --vnet-name $VNet --name $SubNet --network-security-group $NSG

# New NSG Rule
az network nsg rule create --resource-group $ResourceGroup --nsg-name $NSG --name http --access allow --protocol Tcp --direction Inbound --priority 200 --source-address-prefix "*" --source-port-range "*" --destination-address-prefix "*" --destination-port-range 80

# Output current NSG Rule list
az network nsg rule list --resource-group $ResourceGroup --nsg-name $NSG --output table

