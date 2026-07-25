# Active Directory

## New-ADOrganizationalUnit

### Purpose

Creates a new Organizational Unit (OU)

### Syntax

```powershell
New-ADOrganizationalUnit -Name <Name> -Path <Path>
```

### Example

```powershell
New-ADOrganizationalUnit -Name $SubOU -Path $Path
```

### Notes

- Used to create OUs in Active Directory
- Requires the Active Directory module

---

## New-ADUser

### Purpose

Creates a new Active Directory user

### Syntax

```powershell
New-ADUser
```

### Example

```powershell
New-ADUser `
    -Name "$($Employee.FirstName) $($Employee.LastName)" `
    -SamAccountName $Username `
    -UserPrincipalName "$Username@northstar.local"
```

### Notes

- Creates a new user account
- Requires the Active Directory module

---

## ConvertTo-SecureString

### Purpose

Converts a plain text password into a SecureString

### Syntax

```powershell
ConvertTo-SecureString "Password123!" -AsPlainText -Force
```

### Example

```powershell
$Password = ConvertTo-SecureString "Password123!" -AsPlainText -Force
```

### Notes

- Used when creating AD users
- `New-ADUser` expects a SecureString password

---

## SamAccountName

### Purpose

Stores the legacy Windows username

### Example

```text
john.smith
```

### Notes

- Also known as the pre-Windows 2000 logon name
- Must be unique

---

## UserPrincipalName (UPN)

### Purpose

Stores the modern logon name

### Example

```text
john.smith@northstar.local
```

### Notes

- Usually formatted as username@domain
- Must be unique

## New-ADGroup

### Purpose

Creates a new Active Directory group

### Syntax

```powershell
New-ADGroup `
    -Name <GroupName> `
    -GroupScope Global `
    -GroupCategory Security `
    -Path <OUPath>
```

### Example

```powershell
New-ADGroup `
    -Name $UserGroup `
    -GroupScope Global `
    -GroupCategory Security `
    -Path $OUPath
```

### Notes

- Creates a new Active Directory group
- Used to create Security or Distribution groups
- In this lab we use Global Security groups

---

## Get-ADGroup

### Purpose

Retrieves Active Directory groups

### Syntax

```powershell
Get-ADGroup -Filter <Filter>
```

### Example

```powershell
Get-ADGroup -Filter "Name -eq '$UserGroup'"
```

### Notes

- Used to check whether a group exists
- Often used before creating a group

---

## Add-ADGroupMember

### Purpose

Adds users or groups to an Active Directory group

### Syntax

```powershell
Add-ADGroupMember `
    -Identity <GroupName> `
    -Members <UserName>
```

### Example

```powershell
Add-ADGroupMember `
    -Identity $GroupName `
    -Members $Username
```

### Notes

- Adds one or more members to a group
- The group must already exist

---

## Get-ADGroupMember

### Purpose

Retrieves members of an Active Directory group

### Syntax

```powershell
Get-ADGroupMember -Identity <GroupName>
```

### Example

```powershell
Get-ADGroupMember -Identity $GroupName
```

### Notes

- Returns every member of the group
- Often used before adding a new member