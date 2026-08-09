# Naming Conventions

## Purpose

This document defines the naming conventions used within the Northstar Technologies Ltd lab environment.

Consistent naming makes systems, accounts and resources easier to identify and manage.

---

## Servers

Server names use a role-based prefix followed by a two-digit number.

| Type | Format | Example |
|------|--------|---------|
| Domain Controller | DC## | DC01 |
| File Server | FS## | FS01 |

---

## Workstations

Workstation names identify the department followed by WS and a two-digit number.

| Type | Format | Example |
|------|--------|---------|
| Workstation | Department-WS## | IT-WS01 |

---

## User Accounts

Standard user accounts use the employee's first name and surname separated by a period.

| Type | Format | Example |
|------|--------|---------|
| Standard User | firstname.lastname | igors.prutskis |

---

## Security Groups

Department security groups use the department name followed by the group role.

| Type | Format | Example |
|------|--------|---------|
| Users | Department Users | IT Users |
| Managers | Department Managers | IT Managers |

Security groups are used to assign access to resources instead of assigning permissions directly to individual users.

---

## Organizational Units

Department Organizational Units use the department name with separate child OUs for users, computers and groups.

Example structure:

Departments  
└── IT  
	├── Users  
	├── Computers  
	└── Groups

The same structure is used across departments.

---

## Group Policy Objects

Northstar Group Policy Objects use the NS - prefix followed by a descriptive policy name.

| Format | Example |
|--------|---------|
| NS - Policy Name | NS - Security Baseline |
| NS - Policy Name | NS - Windows Update |
| NS - Policy Name | NS - Drive Mapping |
| NS - Policy Name | NS - Intune Automatic Enrollment |

The NS - prefix distinguishes Northstar policies from default domain policies.

---

## Asset IDs

Server assets use the SRV prefix followed by a three-digit number.

| Format | Example |
|--------|---------|
| SRV-### | SRV-001 |
| SRV-### | SRV-002 |

---

## File Shares

File shares use clear descriptive names based on the department or resource.

| Type | Example |
|------|---------|
| Department Share | Finance |
| Department Share | Human Resources |
| Department Share | IT Department |
| Company Share | Company |
| Hidden Share | Home$ |

Hidden shares use the $ suffix.

---

## Documentation

Core documentation uses a two-digit numerical prefix followed by a descriptive filename.

| Format | Example |
|--------|---------|
| ##_Document_Name.md | 00_README.md |
| ##_Document_Name.md | 01_Naming_Conventions.md |
| ##_Document_Name.md | 03_Active_Directory_Design.md |
| ##_Document_Name.md | 08_File_Server_Design.md |

Group Policy documentation uses the corresponding GPO name as the filename.