# NS - File Server Baseline

## Overview

The **NS - File Server Baseline** Group Policy Object (GPO) applies security and auditing settings to file servers within the Northstar Technologies environment.

The policy strengthens SMB security, restricts anonymous access, improves auditing of file access and system activity, and establishes a consistent security baseline for Windows file servers.

---

## Purpose

The purpose of this policy is to:

- Secure Windows file servers.
- Protect file shares and SMB communications.
- Restrict anonymous access to sensitive information.
- Enable auditing of file access and administrative activity.
- Establish a consistent security baseline across all managed file servers.

---

## Scope

| Setting | Value |
|---------|-------|
| Policy Type | Computer Configuration |
| Applies To | File Servers |
| User Configuration | None |

---

## GPO Information

| Property | Value |
|----------|-------|
| GPO Name | NS - File Server Baseline |
| Linked OU | Member Servers |
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

### Interactive Logon

| Policy | Configuration |
|--------|---------------|
| Don't display last signed-in user | Enabled |

---

### Microsoft Network Server

| Policy | Configuration |
|--------|---------------|
| Digitally sign communications (always) | Enabled |
| Digitally sign communications (if client agrees) | Enabled |
| Disconnect clients when logon hours expire | Enabled |

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
| Force audit policy subcategory settings to override audit policy category settings | Enabled |
| Machine inactivity limit | 900 seconds (15 minutes) |

---

# Advanced Audit Configuration

## Account Logon

| Policy | Configuration |
|--------|---------------|
| Audit Credential Validation | Success, Failure |

---

## Detailed Tracking

| Policy | Configuration |
|--------|---------------|
| Audit Process Creation | Success |

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
| Audit Detailed File Share | Success |
| Audit File Share | Success, Failure |
| Audit File System | Success, Failure |
| Audit Other Object Access Events | Success |
| Audit Removable Storage | Success, Failure |

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
- Verifying access to shared folders remained functional.
- Creating and accessing test files to confirm file access auditing.
- Confirming audit events were recorded within Event Viewer.

---

# Notes

This policy is designed specifically for Windows file servers hosting shared resources within the Northstar Technologies environment.

The policy strengthens SMB communications, improves auditing of file access and administrative activity, and applies a consistent security baseline while maintaining normal access to authorised users and shared folders.