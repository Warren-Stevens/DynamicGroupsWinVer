# Create a Dynamic Group for each Windows Version

# Check if AzureAD module is installed - run PS with admin privileges 
if (Get-Module -Name AzureAD -ListAvailable) {
    # Uninstall AzureAD module
    Uninstall-Module -Name AzureAD -AllVersions -Force
}

# Install and Import Azure AD Preview
Install-Module -Name AzureADPreview -AllowClobber -Confirm -force
Import-Module Azureadpreview

# Connect to Azure AD
Connect-AzureAD
Connect-MSGraph

# Create Dynamic Groups --- rename "COMPANY"
$CompanyName = "COMPANY"
$groupNames = @(
    "$CompanyName | Windows 10 | Build 1903",
    "$CompanyName | Windows 10 | Build 1909",
    "$CompanyName | Windows 10 | Build 2004",
    "$CompanyName | Windows 10 | Build 20H2",
    "$CompanyName | Windows 10 | Build 21H1",
    "$CompanyName | Windows 10 | Build 21H2",
    "$CompanyName | Windows 10 | Build 22H2",
    "$CompanyName | Windows 11 | Build 21H2",
    "$CompanyName | Windows 11 | Build 22H2",
    "$CompanyName | Windows 11 | Build 23H2"
)

foreach ($groupName in $groupNames) {
    # Check if the group exists
    $existingGroup = Get-AzureADMSGroup -Filter "DisplayName eq '$groupName'"

    if ($existingGroup) {
        Write-Host "The group '$groupName' already exists."
    } else {
        # Create Dynamic Group
        switch -wildcard ($groupName) {
            "*Build 1903" {
                New-AzureADMSGroup -DisplayName $groupName -Description "Containing all Windows 10 version 1903" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.18362") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"
            }
            "*Build 1909" {
                New-AzureADMSGroup -DisplayName $groupName -Description "Containing all Windows 10 version 1909" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.18363") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"
            }
            "*Build 2004" {
                New-AzureADMSGroup -DisplayName $groupName -Description "Containing all Windows 10 version 2004" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.19041") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"
            }
            "*Build 20H2" {
                New-AzureADMSGroup -DisplayName $groupName -Description "Containing all Windows 10 version 20H2" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.19042") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"
            }
            "*Build 21H1" {
                New-AzureADMSGroup -DisplayName $groupName -Description "Containing all Windows 10 version 21H1" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.19043") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"
            }
            "*Build 21H2" {
                New-AzureADMSGroup -DisplayName $groupName -Description "Containing all Windows 10 version 21H2" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.19044") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"
            }
            "*Build 22H2" {
                New-AzureADMSGroup -DisplayName $groupName -Description "Containing all Windows 10 version 22H2" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.19045") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"
            }
            "*Build 21H2" {
                New-AzureADMSGroup -DisplayName $groupName -Description "Containing all Windows 11 version 21H2" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.22000") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"
            }
            "*Build 22H2" {
                New-AzureADMSGroup -DisplayName $groupName -Description "Containing all Windows 11 version 22H2" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.22621") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"
            }
            "*Build 23H2" {
                New-AzureADMSGroup -DisplayName $groupName -Description "Containing all Windows 11 version 23H2" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.22631") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"
            }
            default {
                Write-Host "Invalid group name."
            }
        }
        Write-Host "The group '$groupName' has been created."
    }
}
