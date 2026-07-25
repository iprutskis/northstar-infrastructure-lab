<#
Script      : Convert-EmployeesTxtToCsv.ps1
Project     : Northstar Technologies
Author      : Igors Prutskis
Version     : 1.0

Description :
Converts the employee list from TXT format to CSV format

Requirements:
- Employees.txt
#>

# ============================================================
# Script Starts Here
# ============================================================

$InputFile = "F:\IT_Lab\Project_Data\Employees.txt"
$OutputFile = "F:\IT_Lab\Project_Data\Employees.csv"

$Employees = Get-Content -Path $InputFile
$EmployeeRecords = @()
$DepartmentFound = $false

foreach ($Employee in $Employees)
{
	if ($Employee.StartsWith("##"))
	{
		$Department = $Employee.Substring(3)
		$DepartmentFound = $true
		continue
	}
	
	if (-not $DepartmentFound)
	{
		continue
	}
	
	if ([string]::IsNullOrWhiteSpace($Employee))
	{
		continue
	}
	
	$NameParts = $Employee -split " "
	$FirstName = $NameParts[0]
	$LastName = $NameParts[1]
	
	$EmployeeRecords += [PSCustomObject]@{
		Department = $Department
		FirstName = $FirstName
		LastName = $LastName
	}
}

$EmployeeRecords | Export-Csv -Path $OutputFile -NoTypeInformation