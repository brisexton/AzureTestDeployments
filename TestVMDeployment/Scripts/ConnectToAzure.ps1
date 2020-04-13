#
# ConnectToAzure.ps1
#


$AdminCreds = Get-Credential
$MyVSSubscription = "VSE*"

Import-AzContext -Path C:\Automation\credentials\Azure-brianjsexton.json

Get-AzSubscription | Where-Object {$_.Name -like "$MyVSSubscription"} | Set-AzContext

Get-AzResourceGroup
