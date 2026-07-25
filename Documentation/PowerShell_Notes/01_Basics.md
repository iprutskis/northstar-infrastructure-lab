# PowerShell Basics

## Backtick (`)

### Purpose

Continues a command onto the next line

### Example

```powershell
New-ADUser `
    -Name "John Smith" `
    -Enabled $true
```

### Notes

- Must be the last character on the line
- Used to split long commands across multiple lines