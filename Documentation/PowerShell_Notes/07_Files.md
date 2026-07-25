# Files

## New-Item

### Purpose

Creates a new file or folder

### Syntax

```powershell
New-Item -Path <Path> -ItemType <Type>
```

### Example

```powershell
New-Item -Path $NotesFolder -ItemType Directory

New-Item -Path "$NotesFolder\$NoteFile" -ItemType File
```

### Notes

- Use `-ItemType Directory` to create folders
- Use `-ItemType File` to create files
- Use `-Force` to avoid errors if the item already exists

---

## Get-Content

### Purpose

Reads the contents of a file

### Syntax

```powershell
Get-Content -Path <File>
```

### Example

```powershell
$Employees = Get-Content -Path $InputFile
```

### Notes

- Returns one line at a time
- Commonly used with `foreach`

---

## StartsWith()

### Purpose

Checks whether text starts with specific characters

### Example

```powershell
$Employee.StartsWith("##")
```

### When to Use

When checking whether a line starts with specific text

---

## Substring()

### Purpose

Returns text starting from a specified position

### Example

```powershell
$Employee.Substring(3)
```

### When to Use

When extracting part of a string