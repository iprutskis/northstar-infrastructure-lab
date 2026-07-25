# Arrays

## Arrays

### Purpose

Stores multiple values in a single variable

### Syntax

```powershell
$Departments = @(
    "IT",
    "Sales"
)
```

### Example

```powershell
$NoteFiles = @(
    "README.md"
    "01_Basics.md"
    "02_Variables.md"
)
```

### Notes

- Arrays are created using `@()`
- Each item is stored separately
- Arrays are commonly used with `foreach`