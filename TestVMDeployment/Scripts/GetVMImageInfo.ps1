#
# GetVMImageInfo.ps1
#

$ResourceGroupName = 'rg-TestVMDeployment'
$location = 'East US'

$VMImagePublisher = 'MicrosoftWindowsServer'
$VMImageOffer = 'WindowsServer'


Get-AzureRmVMImagePublisher -Location $location



Get-AzureRmVMImageOffer -Location $location -PublisherName $VMImagePublisher



Get-AzureRmVMImage -Location $location -PublisherName $VMImagePublisher -Offer $VMImageOffer -Version 'latest'



Get-AzureRmVMImageSku -Location $location -PublisherName $VMImagePublisher -Offer $VMImageOffer