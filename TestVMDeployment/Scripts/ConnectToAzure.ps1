#
# ConnectToAzure.ps1
#


$AdminCreds = Get-Credential bs.admin@use.salvationarmy.org
$MyVSSubscription = "VSE-BrianSexton-d7b"


Login-AzureRmAccount -Credential $AdminCreds

Set-AzureRmContext -Subscription $MyVSSubscription

Get-AzureRmResourceGroup
