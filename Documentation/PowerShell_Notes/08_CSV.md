# CSV

## Export-Csv

### Purpose

Exports PowerShell objects to a CSV file

### Syntax

```powershell
Export-Csv -Path <File>
```

### Example

```powershell
$EmployeeRecords | Export-Csv -Path $OutputFile -NoTypeInformation
```

### Notes

- Each object becomes one row
- Object properties become column headers
- `-NoTypeInformation` removes the PowerShell type header

---

## Import-Csv

### Purpose

Imports a CSV file as PowerShell objects

### Syntax

```powershell
Import-Csv -Path <File>
```

### Example

```powershell
$Employees = Import-Csv -Path $InputFile
```

### Notes

- Each row becomes one object
- Column headers become object properties
- Commonly used with `foreach`