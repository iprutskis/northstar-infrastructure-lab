<#
Script      : Add-UsersToGroups.ps1
Project     : Northstar Technologies
Author      : Igors Prutskis
Version     : 1.0

Description :
Adds users to their department security groups

Requirements:
- Employees.csv
- Active Directory Domain Services
#>

# ============================================================
# Script Starts Here
# ============================================================

# Store the CSV file path
$InputFile = "C:\Users\Administrator\Desktop\Employees.csv"

# Import employee datat from the CSV file
$Employees = Import-Csv -Path $InputFile

# Process each employee from the CSV file
foreach ($Employee in $Employees)
{
	# Bild the department group name
	$GroupName = "$($Employee.Department)_Users"
	
	# Build the username
	$Username = "$($Employee.FirstName).$($Employee.LastName)".ToLower()
	
	# Check whether the user is already in the group
	$IsMember = Get-ADGroupMember -Identity $GroupName |
		Where-Object { $_.SamAccountName -eq $Username }
	
	if ($IsMember)
	{
		Write-Host "Skipping existing member: $Username in $GroupName"
		continue
	}
		
	# Add the user to the department group
	Add-ADGroupMember -Identity $GroupName -Members $Username
	Write-Host "Added $Username to $GroupName"
}