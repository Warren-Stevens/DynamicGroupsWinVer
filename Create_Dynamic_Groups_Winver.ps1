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

# Create Dynamic Groups (CHANGE "TEST")
$CompanyName = "Test"

# Function to check if a group exists
function GroupExists($groupName) {
    $existingGroup = Get-AzureADMSGroup -Filter "displayName eq '$groupName'"
    if ($existingGroup) {
        return $true
    }
    return $false
}

# Function to create a group if it doesn't exist
function CreateGroup($displayName, $description, $membershipRule) {
    if (-not (GroupExists $displayName)) {
        New-AzureADMSGroup -DisplayName $displayName -Description $description -MailEnabled $False -MailNickName $False -SecurityEnabled $True -GroupTypes @("DynamicMembership") -MembershipRule $membershipRule -MembershipRuleProcessingState "On"
        Write-Host "Group '$displayName' created."
    } else {
        Write-Host "Group '$displayName' already exists."
    }
}

# Create Windows 10 version groups
CreateGroup "All $CompanyName | Windows 10 | Build 1909" "Containing all Windows 10 version 1909" '(device.deviceOSVersion -startsWith "10.0.18363") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")'
CreateGroup "All $CompanyName | Windows 10 | Build 2004" "Containing all Windows 10 version 2004" '(device.deviceOSVersion -startsWith "10.0.19041") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")'
CreateGroup "All $CompanyName | Windows 10 | Build 20H2" "Containing all Windows 10 version 20H2" '(device.deviceOSVersion -startsWith "10.0.19042") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")'
CreateGroup "All $CompanyName | Windows 10 | Build 21H1" "Containing all Windows 10 version 21H1" '(device.deviceOSVersion -startsWith "10.0.19043") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")'
CreateGroup "All $CompanyName | Windows 10 | Build 21H2" "Containing all Windows 10 version 21H2" '(device.deviceOSVersion -startsWith "10.0.19044") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")'
CreateGroup "All $CompanyName | Windows 10 | Build 22H2" "Containing all Windows 10 version 22H2" '(device.deviceOSVersion -startsWith "10.0.19045") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")'

# Create Windows 11 version groups
CreateGroup "All $CompanyName | Windows 11 | Build 21H2" "Containing all Windows 11 version 21H2" '(device.deviceOSVersion -startsWith "10.0.22000") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")'
CreateGroup "All $CompanyName | Windows 11 | Build 22H2" "Containing all Windows 11 version 22H2" '(device.deviceOSVersion -startsWith "10.0.22621") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")'
CreateGroup "All $CompanyName | Windows 11 | Build 23H2" "Containing all Windows 11 version 23H2" '(device.deviceOSVersion -startsWith "10.0.22631") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")'

# Create "All Windows 10 Devices" group
CreateGroup "All $CompanyName | All Windows 10 Devices" "Containing all Windows 10 versions" '(device.deviceOSVersion -startsWith "10.0.1") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")'

# Create "All Windows 11 Devices" group
CreateGroup "All $CompanyName | All Windows 11 Devices" "Containing all Windows 11 versions" '(device.deviceOSVersion -startsWith "10.0.2") -and (device.deviceOSType -eq "Windows") -and (device.managementType -eq "MDM")'
