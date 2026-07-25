# Loops

## foreach

### Purpose

Repeats the same code for every item in a collection

### Syntax

```powershell
foreach ($Item in $Collection)
{

}
```

### Example

```powershell
foreach ($Department in $Departments)
{
    Write-Host $Department
}
```

### Notes

- Processes one item at a time
- The loop ends when every item has been processed

---

## continue

### Purpose

Skips the current loop iteration and moves to the next item

### Example

```powershell
if ([string]::IsNullOrWhiteSpace($Employee))
{
    continue
}
```

### When to Use

When you want to ignore certain items and continue processing the rest