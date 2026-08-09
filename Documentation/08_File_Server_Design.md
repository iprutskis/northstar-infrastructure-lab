# File Server Design

## Purpose

FS01 provides centralised file storage for Northstar Technologies Ltd.

The server stores department documents, shared company resources and user home folders.
Access to data is controlled using Active Directory security groups and NTFS permissions, 
ensuring employees only have access to information required for their role.

The server is designed to provide secure, reliable and scalable file storage for the company's daily operations.

---

## Business Requirements

The file server must:

- Store company data centrally
- Provide separate storage for each department
- Allow secure access using Active Directory accounts
- Restrict access using security groups
- Support future growth of the business
- Be easy to manage and maintain

---

## Folder Structure

### Root Structure

The data volume (D:) is separated from the operating system to improve organisation, simplify backups
and reduce the risk of accidental data loss during operating system maintenance.

```text
D:\
├── Archive
├── Backups
├── Home
├── Shares
└── Software
```

---

### Folder Purpose

| Folder | Purpose |
|--------|---------|
| Archive | Long-term storage of company data |
| Backups | Temporary storage for backup jobs and recovery files |
| Home | User home folders |
| Shares | Departmental shared folders |
| Software | Software installers, drivers and utilities for internal use |

---

## Share Structure

The departmental shared folders are stored within the **D:\Shares** directory.

```text
D:\Shares
├── Company
├── Customer Support
├── Engineering
├── Finance
├── Human Resources
├── IT Department
├── Logistics
├── Maintenance
├── Production
├── Purchasing
├── Quality Assurance
├── Research and Development
├── Sales
└── Warehouse
```

---

### Design Principles

- The Company folder provides shared resources accessible to all employees according to the configured permissions
- Each department has its own dedicated shared folder
- The folder structure is designed to support future expansion without major redesign

---

## Permission Model

The file server uses a layered permission model combining SMB share permissions with NTFS permissions.

---

### Share Permissions

All departmental shares grant **Authenticated Users** Full Control.
Share permissions are intentionally permissive because access control is enforced through NTFS permissions.

---

### NTFS Permissions

NTFS permissions provide the primary layer of security.
Department folders inherit permissions from the root share directory before inheritance is disabled and converted to explicit permissions.
Each departmental folder grants **Modify** permissions only to the corresponding Active Directory security group.
No permissions are assigned directly to individual users.
This approach simplifies administration and follows the Principle of Least Privilege.

---

## User Home Folders

Personal home folders are stored within the hidden **Home$** network share.
Each user is assigned an H: drive through their Active Directory profile.
The home folder path is configured using:

```text
\\FS01\Home$\%username%
```

When a home folder is assigned, Windows automatically creates the user's folder and applies the appropriate NTFS permissions.
Each user receives exclusive access to their own home folder while administrators retain full administrative access.

---

## Access-Based Enumeration

Access-Based Enumeration (ABE) is enabled on all departmental shares.
ABE hides folders and shares from users who do not have permission to access them.
This improves usability by reducing unnecessary clutter and prevents users from seeing departmental resources outside their responsibilities.
ABE does not replace NTFS permissions; it only controls visibility.

---

## Security Design Principles

The file server has been designed using the following principles:

- Principle of Least Privilege
- Role-Based Access Control (RBAC)
- Active Directory security groups instead of direct user permissions
- Separation of share and NTFS permissions
- Hidden administrative shares where appropriate
- Consistent permission inheritance

---

## Microsoft Entra Connect Sync

FS01 also hosts **Microsoft Entra Connect Sync**, providing identity synchronization between the on-premises **northstar.local** Active Directory domain and the Northstar Technologies Microsoft Entra ID tenant.

The synchronization service allows selected Active Directory identities to be represented within Microsoft Entra ID and supports the hybrid identity configuration used by Northstar Technologies.

### Synchronization Design

| Property | Configuration |
|----------|---------------|
| Synchronization Server | FS01 |
| On-Premises Directory | northstar.local |
| Cloud Directory | Microsoft Entra ID |
| Synchronization Service | Microsoft Entra Connect Sync |
| Synchronization Direction | On-Premises Active Directory → Microsoft Entra ID |

### Purpose

Microsoft Entra Connect Sync is used to:

- Synchronize selected Active Directory identities with Microsoft Entra ID
- Maintain consistent user identities between on-premises and cloud services
- Support Hybrid Microsoft Entra joined workstations
- Support Microsoft 365 and Microsoft Intune integration
- Provide the identity synchronization layer for the Northstar hybrid environment

---

## Future Expansion

Future improvements may include:

- File Server Resource Manager (FSRM)
- Storage quotas
- File screening
- Shadow Copies
- Distributed File System (DFS)
- PowerShell automation
- Backup integration

