#
# ConnectToAzure.ps1
#


$AdminCreds = Get-Credential
$MyVSSubscription = "VSE-BrianSexton"


Login-AzureRmAccount -Credential $AdminCreds

Set-AzureRmContext -Subscription $MyVSSubscription

Get-AzureRmResourceGroup
