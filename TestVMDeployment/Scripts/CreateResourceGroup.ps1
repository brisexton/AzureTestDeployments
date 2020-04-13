#
# Script.ps1
#

$ResourceGroupName = 'rg-TestVMDeployment'
$location = 'East US'

$tags = @{
	"Vendor" = "BrianSexton"
}
New-AzResourceGroup -name $resourceGroupname -Location $location -Tag $tags


################
# Tear Down ##
###########

Remove-AzResourceGroup $ResourceGroupName

Get-AzResourceGroup

New-AzResourceGroup -Name 'rg-briansexton-dev-ue' -Location $location -tag $tags