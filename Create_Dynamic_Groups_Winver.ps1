# Create a Dynamic Group for each Windows Version, including groups for All Windows 10 and 11 

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

# Create Dynamic Groups
 
# Windows 10 version 1903 (build 18362)
New-AzureADMSGroup -DisplayName "Intune | Windows 10 | Build 1903" -Description "Containing all Windows 10 version 1903" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.18362") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"
 
# Windows 10 version 1909 (build 18363)
New-AzureADMSGroup -DisplayName "Intune | Windows 10 | Build 1909" -Description "Containing all Windows 10 version 1909" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.18363") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"
 
# Windows 10 version 2004 (build 19041)
New-AzureADMSGroup -DisplayName "Intune | Windows 10 | Build 2004" -Description "Containing all Windows 10 version 2004" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.19041") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"
 
# Windows 10 version 20H2 (build 19042)
New-AzureADMSGroup -DisplayName "Intune | Windows 10 | Build 20H2" -Description "Containing all Windows 10 version 20H2" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.19042") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"
 
# Windows 10 version 21H1 (build 19043)
New-AzureADMSGroup -DisplayName "Intune | Windows 10 | Build 21H1" -Description "Containing all Windows 10 version 21H1" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.19043") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"
 
# Windows 10 version 21H2 (build 19044)
New-AzureADMSGroup -DisplayName "Intune | Windows 10 | Build 21H2" -Description "Containing all Windows 10 version 21H2" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.19044") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"
 
# Windows 10 version 22H2 (build 19045)
New-AzureADMSGroup -DisplayName "Intune | Windows 10 | Build 22H2" -Description "Containing all Windows 10 version 22H2" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.19045") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"
 
# Windows 11 version 21H2 (build 22000)
New-AzureADMSGroup -DisplayName "Intune | Windows 11 | Build 21H2" -Description "Containing all Windows 11 version 21H2" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.22000") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"
 
# Windows 11 version 22H2 (build 22621)
New-AzureADMSGroup -DisplayName "Intune | Windows 11 | Build 22H2" -Description "Containing all Windows 11 version 22H2" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.22621") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"
 
# Windows 11 version 22H3 (build 22621)
New-AzureADMSGroup -DisplayName "Intune | Windows 11 | Build 23H2" -Description "Containing all Windows 11 version 22H3" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.22631") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"

# Windows 10 - All versions
New-AzureADMSGroup -DisplayName "Intune | All Windows 10 Devices" -Description "Containing all Windows 10 versions" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.1") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"
 
# Windows 11 - All versions
New-AzureADMSGroup -DisplayName "Intune | All Windows 11 Devices" -Description "Containing all Windows 11 versions" -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule '(device.deviceOSVersion -startsWith "10.0.2") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")' -MembershipRuleProcessingState "On"
