
Import-Module AzureAD

Connect-AzureAD

# Register Azure Active Directory Service Principal
New-AzureADServicePrincipal -AppId "2565bd9d-da50-47d4-8b85-4c97f669dc36"

# Connect to your Azure AD directory.
Connect-AzureAD

# Login to your Azure subscription.
Connect-AzAccount

# Select the Subscription you want Azure AD Domain Services deployed 
Get-AzSubscription | Where-Object {$_.Name -like "SubscriptionName"} | Set-AzContext

# Create the delegated administration group for AAD Domain Services.
New-AzureADGroup -DisplayName "AAD DC Administrators" `
    -Description "Delegated group to administer Azure AD Domain Services" `
    -SecurityEnabled $true -MailEnabled $false `
    -MailNickName "AADDCAdministrators"

# Register the resource provider for Azure AD Domain Services with Resource Manager.
Register-AzResourceProvider -ProviderNamespace Microsoft.AAD