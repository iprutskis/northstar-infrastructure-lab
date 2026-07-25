# Objects

## PSCustomObject

### Purpose

Creates a custom PowerShell object with named properties

### Syntax

```powershell
[PSCustomObject]@{
    Property = Value
}
```

### Example

```powershell
[PSCustomObject]@{
    Department = $Department
    FirstName  = $FirstName
    LastName   = $LastName
}
```

### Notes

- Property names become object columns
- Commonly used before exporting to CSV

## Where-Object

### Purpose

Filters objects returned through the PowerShell pipeline

### Syntax

```powershell
Where-Object { <Condition> }
```

### Example

```powershell
Get-ADGroupMember -Identity $GroupName |
    Where-Object { $_.SamAccountName -eq $Username }
```

### Notes

- Returns only objects matching the condition
- Frequently used with Active Directory cmdlets