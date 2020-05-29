#Variables

$ResourceGroup = 'DemoRG'
$VirtualNetwork = 'DemoVnet'
$Location = 'canadacentral'
$VM = 'DemoVM'
$Image = 'UbuntuLTS'
$User = 'adityav'
$Password = 'BDt2$Am7&yadd'
$VNet = 'DemoVNet'
$Address = '10.0.1.0/24'
$VMSize = 'Standard_B1s'
$AvailabilitySet = 'DemoAS'
$VnetAddress = '10.0.0.0/16'
$SubNet = 'DemoSubnet'
$SubNetAddress = '10.0.1.0/24'
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

