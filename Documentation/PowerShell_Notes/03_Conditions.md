# Conditions

## if

### Purpose

Runs code only when a condition is true

### Example

```powershell
if ($Employee.StartsWith("##"))
{
    $Department = $Employee.Substring(3)
}
```

### Notes

- The code inside `{ }` only runs if the condition is true

## -not

### Purpose

Reverses the result of a condition

### Example

```powershell
if (-not (Get-ADGroup -Filter "Name -eq '$UserGroup'"))
{

}
```

### Notes

- Executes the code only when the condition is false
- Commonly used to check whether an object does not exist