<#
Script      : Create-DepartmentGroups.ps1
Project     : Northstar Technologies
Author      : Igors Prutskis
Version     : 1.0

Description :
Creates security groups for each department.

Requirements:
- Employees.csv
- Active Directory Domain Services
#>

# ============================================================
# Script Starts Here
# ============================================================

# Store the CSV file path
$InputFile = "C:\Users\Administrator\Desktop\Employees.csv"

# Import employee data from the CSV file
$Employees = Import-Csv -Path $InputFile

# Get a list of unique departments
$Departments = $Employees.Department | Sort-Object -Unique

# Process each department
foreach ($Department in $Departments)
{
	# Build the department group names
	$UserGroup = "${Department}_Users"
	$ManagerGroup = "${Department}_Managers"
	
	# Build the Groups OU path
	$OUPath = "OU=Groups,OU=$Department,OU=Departments,DC=northstar,DC=local"
	
	# Check whether the Users group already exists
	if (-not (Get-ADGroup -Filter "Name -eq '$UserGroup' " -ErrorAction SilentlyContinue))
	{
		New-ADGroup `
			-Name $UserGroup `
			-GroupScope Global `
			-GroupCategory Security `
			-Path $OUPath
		
		Write-Host "Created group: $UserGroup"
	}	
	else
	{
		Write-Host "Skipping existing group: $UserGroup"
	}
	
	# Check whether the Managers group already exists
	if (-not (Get-ADGroup -Filter "Name -eq '$ManagerGroup'" -ErrorAction SilentlyContinue))
	{
		New-ADGroup `
			-Name $ManagerGroup `
			-GroupScope Global `
			-GroupCategory Security `
			-Path $OUPath
			
		Write-Host "Created group: $ManagerGroup"
	}
	else 
	{
		Write-Host "Skipping existing group: $ManagerGroup"
	}
}