# NS - Domain Controller Baseline

## Overview

The **NS - Domain Controller Baseline** Group Policy Object (GPO) applies security and auditing settings specifically to Active Directory Domain Controllers within the Northstar Technologies environment.

The policy strengthens the security of the domain controller by enforcing secure authentication methods, restricting anonymous access,
enabling comprehensive security auditing and applying recommended Microsoft security settings for Active Directory infrastructure.

---

## Purpose

The purpose of this policy is to:

- Secure Active Directory Domain Controllers.
- Strengthen authentication security.
- Protect domain controller network communications.
- Restrict anonymous access to sensitive information.
- Enable comprehensive auditing of security-related events.
- Establish a consistent security baseline across all domain controllers.

---

## Scope

| Setting | Value |
|---------|-------|
| Policy Type | Computer Configuration |
| Applies To | Domain Controllers |
| User Configuration | None |

---

## GPO Information

| Property | Value |
|----------|-------|
| GPO Name | NS - Domain Controller Baseline |
| Linked OU | Domain Controllers |
| Security Filtering | Authenticated Users |
| Loopback Processing | Not Configured |

---

# Technical Configuration

## Security Options

### Accounts

| Policy | Configuration |
|--------|---------------|
| Guest account status | Disabled |
| Limit local account use of blank passwords to console logon only | Enabled |

---

### Domain Controller

| Policy | Configuration |
|--------|---------------|
| LDAP server signing requirements | Require signing |

---

### Interactive Logon

| Policy | Configuration |
|--------|---------------|
| Don't display last signed-in user | Enabled |
| Message title for users attempting to log on | Northstar Technologies |

---

### Microsoft Network Server

| Policy | Configuration |
|--------|---------------|
| Microsoft network server: Digitally sign communications (always) | Enabled |

---

### Network Access

| Policy | Configuration |
|--------|---------------|
| Do not allow anonymous enumeration of SAM accounts | Enabled |
| Do not allow anonymous enumeration of SAM accounts and shares | Enabled |

---

### Shutdown

| Policy | Configuration |
|--------|---------------|
| Clear virtual memory pagefile | Disabled |

---

### Other

| Policy | Configuration |
|--------|---------------|
| Block Microsoft accounts | Users can't add Microsoft accounts |
| Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings | Enabled |
| Machine inactivity limit | 900 seconds (15 minutes) |

---

# Advanced Audit Configuration

## Account Logon

| Policy | Configuration |
|--------|---------------|
| Audit Credential Validation | Success, Failure |
| Audit Kerberos Authentication Service | Success, Failure |
| Audit Kerberos Service Ticket Operations | Success, Failure |
| Audit Other Account Logon Events | Success |

---

## Account Management

| Policy | Configuration |
|--------|---------------|
| Audit Application Group Management | Success |
| Audit Computer Account Management | Success, Failure |
| Audit Distribution Group Management | Success |
| Audit Other Account Management Events | Success |
| Audit Security Group Management | Success, Failure |
| Audit User Account Management | Success, Failure |

---

## Detailed Tracking

| Policy | Configuration |
|--------|---------------|
| Audit Process Creation | Success |

---

## DS Access

| Policy | Configuration |
|--------|---------------|
| Audit Directory Service Access | Success, Failure |
| Audit Directory Service Changes | Success, Failure |
| Audit Directory Service Replication | Success |

---

## Logon / Logoff

| Policy | Configuration |
|--------|---------------|
| Audit Account Lockout | Success |
| Audit Group Membership | Success |
| Audit Logoff | Success |
| Audit Logon | Success, Failure |
| Audit Other Logon/Logoff Events | Success |
| Audit Special Logon | Success |

---

## Object Access

| Policy | Configuration |
|--------|---------------|
| Audit File Share | Success |
| Audit Other Object Access Events | Success |
| Audit Removable Storage | Success, Failure |
| Audit SAM | Success, Failure |

---

## Policy Change

| Policy | Configuration |
|--------|---------------|
| Audit Audit Policy Change | Success, Failure |
| Audit Authentication Policy Change | Success |
| Audit Authorization Policy Change | Success, Failure |
| Audit Other Policy Change Events | Success, Failure |

---

## Privilege Use

| Policy | Configuration |
|--------|---------------|
| Audit Other Privilege Use Events | Success, Failure |
| Audit Sensitive Privilege Use | Success, Failure |

---

## System

| Policy | Configuration |
|--------|---------------|
| Audit Other System Events | Success, Failure |
| Audit Security State Change | Success |
| Audit Security System Extension | Success |
| Audit System Integrity | Success, Failure |

---

# Validation

The policy was validated by:

- Applying the policy using `gpupdate /force`.
- Confirming policy application using `gpresult`.
- Verifying configured security options within Local Security Policy.
- Confirming Advanced Audit Policy settings were successfully applied.
- Generating test authentication and logon events.
- Verifying audit events were recorded within Event Viewer.
- Confirming the Domain Controller operated normally following policy deployment.

---

# Notes

This Group Policy Object applies only to Domain Controllers and contains security settings that are specific to Active Directory infrastructure.

The policy enforces secure authentication methods, protects directory services, strengthens network communications and enables detailed auditing of security-related activity.
Using Advanced Audit Policy Configuration provides more granular control than legacy audit policy categories, allowing more effective monitoring,
troubleshooting and security investigations while maintaining a consistent security baseline across all domain controllers.