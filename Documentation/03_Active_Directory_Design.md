# Active Directory Design

## Purpose

This document describes the Active Directory structure used within the Northstar Technologies Ltd lab environment.

The environment is designed to provide centralised user, computer and group management while supporting departmental organisation and Group Policy administration.

---

## Domain

| Property | Value |
|----------|-------|
| Domain Name | northstar.local |
| NetBIOS Name | NORTHSTAR |
| Domain Controller | DC01 |
| Operating System | Windows Server 2022 Standard |
| Forest | northstar.local |

---

## Domain Controller

DC01 provides the core Active Directory services for the Northstar environment.

| Service | Server |
|---------|--------|
| Active Directory Domain Services | DC01 |
| DNS | DC01 |
| DHCP | DC01 |

---

## Organizational Unit Structure

Active Directory objects are organised by department.

Each department contains separate OUs for users, computers and security groups.

    northstar.local
    └── Departments
        ├── Customer Support
        │   ├── Users
        │   ├── Computers
        │   └── Groups
        ├── Engineering
        │   ├── Users
        │   ├── Computers
        │   └── Groups
        ├── Finance
        │   ├── Users
        │   ├── Computers
        │   └── Groups
        ├── Human Resources
        │   ├── Users
        │   ├── Computers
        │   └── Groups
        ├── IT
        │   ├── Users
        │   ├── Computers
        │   └── Groups
        ├── Logistics
        │   ├── Users
        │   ├── Computers
        │   └── Groups
        ├── Maintenance
        │   ├── Users
        │   ├── Computers
        │   └── Groups
        ├── Production
        │   ├── Users
        │   ├── Computers
        │   └── Groups
        ├── Purchasing
        │   ├── Users
        │   ├── Computers
        │   └── Groups
        ├── Quality Assurance
        │   ├── Users
        │   ├── Computers
        │   └── Groups
        ├── Research and Development
        │   ├── Users
        │   ├── Computers
        │   └── Groups
        ├── Sales
        │   ├── Users
        │   ├── Computers
        │   └── Groups
        └── Warehouse
            ├── Users
            ├── Computers
            └── Groups

---

## User Accounts

User accounts are stored within the Users OU of their assigned department.

Standard usernames use:

| Format | Example |
|--------|---------|
| firstname.lastname | igors.prutskis |

Users can be moved between departmental OUs when their role or department changes.

---

## Computer Accounts

Domain workstations are stored within the Computers OU of their assigned department.

Example:

| Computer | OU |
|----------|----|
| IT-WS01 | Departments > IT > Computers |

This structure allows computer-based Group Policies to be targeted by department.

---

## Security Groups

Each department contains security groups used to control access to resources.

| Group Type | Example |
|------------|---------|
| Department Users | IT Users |
| Department Managers | IT Managers |

Users are assigned to the appropriate security groups based on their role.

Permissions are assigned to security groups rather than directly to individual users where possible.

---

## Group Policy

Group Policy Objects are used to centrally configure domain users and workstations.

Northstar-managed GPOs use the `NS -` prefix.

Examples include:

| GPO |
|-----|
| NS - Security Baseline |
| NS - Windows Defender |
| NS - Windows Defender Firewall Baseline |
| NS - Windows Update |
| NS - Windows Experience |
| NS - Power Management |
| NS - Drive Mapping |
| NS - Intune Automatic Enrollment |

Individual Group Policy configurations are documented separately within the Group_Policy directory.

---

## Hybrid Identity

The Northstar Active Directory environment is integrated with Microsoft Entra ID using Microsoft Entra Connect Sync.

| Component | Configuration |
|-----------|---------------|
| On-Premises Directory | northstar.local |
| Synchronization Server | FS01 |
| Synchronization Service | Microsoft Entra Connect Sync |
| Cloud Directory | Microsoft Entra ID |

Selected Active Directory identities are synchronized from the on-premises domain to Microsoft Entra ID.

The hybrid identity configuration supports Microsoft 365, Hybrid Microsoft Entra joined workstations and Microsoft Intune management.

---

## Design Principles

The Active Directory environment follows the following principles:

- Department-based Organizational Unit structure
- Separation of users, computers and groups
- Group-based resource permissions
- Centralised configuration through Group Policy
- Principle of Least Privilege
- Consistent naming conventions
- Hybrid integration with Microsoft Entra ID