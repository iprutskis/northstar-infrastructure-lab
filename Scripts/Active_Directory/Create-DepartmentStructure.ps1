<#
Script      : Create-DepartmentStructure.ps1
Project     : Northstar Technologies
Author      : Igors Prutskis
Version     : 1.0

Description:
Creates the standard departmental Organizational Unit structure
(Users, Computers and Groups) for all departments

Requirements:
- Active Directory module
#>

# ============================================================
# Script Starts Here
# ============================================================

$Departments = @(
    "Engineering",
    "Finance",
    "Human Resources",
	"IT",
    "Logistics",
    "Maintenance",
    "Production",
    "Purchasing",
    "Quality Assurance",
    "Research and Development",
    "Sales",
    "Warehouse",
    "Customer Support"
)

$SubOUs = @(
    "Users",
    "Computers",
    "Groups"
)

foreach ($Department in $Departments)
{
    $Path = "OU=$Department,OU=Departments,DC=northstar,DC=local"

    Write-Host "Creating OUs for $Department..."

    foreach ($SubOU in $SubOUs)
    {
        New-ADOrganizationalUnit -Name $SubOU -Path $Path
    }
    
}