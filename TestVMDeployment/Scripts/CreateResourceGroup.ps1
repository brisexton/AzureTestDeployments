#
# Script.ps1
#

$ResourceGroupName = 'rg-TestVMDeployment'
$location = 'East US'

$tags = @{
	"Vendor" = "BrianSexton"
}
New-AzureRmResourceGroup -name $resourceGroupname -Location $location -Tag $tags


################
# Tear Down ##
###########

Remove-AzureRmResourceGroup $ResourceGroupName

Get-AzureRmResourceGroup

New-AzureRmResourceGroup -Name 'rg-tsae-briansexton-dev-ue' -Location $location -tag $tags