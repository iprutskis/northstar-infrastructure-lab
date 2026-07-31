# NS - Security Baseline

## Overview

The **NS - Security Baseline** Group Policy Object (GPO) establishes the standard security configuration for Windows computers within the Northstar Technologies environment.

The policy applies security hardening, audit configuration, User Account Control (UAC), event log settings and administrative template policies to improve system security, reduce attack surface and provide consistent configuration across managed devices.

---

## Purpose

The purpose of this policy is to:

- Apply a consistent security baseline to Windows systems.
- Reduce the attack surface of managed devices.
- Strengthen authentication and network security.
- Improve security auditing and event logging.
- Configure User Account Control (UAC) security.
- Apply Microsoft security best practices through Administrative Templates.

---

## Scope

| Setting | Value |
|---------|-------|
| Policy Type | Computer Configuration |
| Applies To | Domain Computers |
| User Configuration | None |

---

## GPO Information

| Property | Value |
|--------|--------|
| GPO Name | NS - Security Baseline |
| Linked OU | Domain Computers |
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

### Devices

| Policy | Configuration |
|--------|---------------|
| Prevent users from installing printer drivers | Enabled |

---

### Interactive Logon

| Policy | Configuration |
|--------|---------------|
| Logon message | Company security notice displayed before logon |
| Logon message title | Northstar Technologies |

---

### Microsoft Network Client

| Policy | Configuration |
|--------|---------------|
| Digitally sign communications (always) | Enabled |
| Digitally sign communications (if server agrees) | Enabled |

---

### Microsoft Network Server

| Policy | Configuration |
|--------|---------------|
| Digitally sign communications (always) | Enabled |
| Digitally sign communications (if client agrees) | Enabled |

---

### Network Access

| Policy | Configuration |
|--------|---------------|
| Do not allow anonymous enumeration of SAM accounts | Enabled |
| Do not allow anonymous enumeration of SAM accounts and shares | Enabled |

---

### Network Security

| Policy | Configuration |
|--------|---------------|
| Do not store LAN Manager hash value | Enabled |
| LAN Manager authentication level | Send NTLMv2 response only. Refuse LM & NTLM |

---

### System Objects

| Policy | Configuration |
|--------|---------------|
| Strengthen default permissions of internal system objects | Enabled |

---

## User Account Control

| Policy | Configuration |
|--------|---------------|
| Behavior of elevation prompt for administrators | Prompt for consent |
| Run all administrators in Admin Approval Mode | Enabled |
| Switch to secure desktop when prompting for elevation | Enabled |

---

## Event Log

| Policy | Configuration |
|--------|---------------|
| Application log size | 32 MB |
| Security log size | 256 MB |
| System log size | 64 MB |
| Prevent Guests accessing logs | Enabled |
| Log retention | As needed |

---

# Advanced Audit Configuration

## Account Logon

| Policy | Configuration |
|--------|---------------|
| Audit Other Account Logon Events | Success |

---

## Account Management

| Policy | Configuration |
|--------|---------------|
| Audit Other Account Management Events | Success |
| Audit Security Group Management | Success, Failure |
| Audit User Account Management | Success, Failure |

---

## Detailed Tracking

| Policy | Configuration |
|--------|---------------|
| Audit Plug and Play Activity | Success |
| Audit Process Creation | Success |

---

## Logon / Logoff

| Policy | Configuration |
|--------|---------------|
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
| Audit Removable Storage | Success, Failure |

---

## Policy Change

| Policy | Configuration |
|--------|---------------|
| Audit Audit Policy Change | Success, Failure |
| Audit Authentication Policy Change | Success |
| Audit Authorization Policy Change | Success |
| Audit Filtering Platform Policy Change | Success |
| Audit MPSSVC Rule-Level Policy Change | Success |
| Audit Other Policy Change Events | Failure |

---

## Privilege Use

| Policy | Configuration |
|--------|---------------|
| Audit Sensitive Privilege Use | Success |

---

## System

| Policy | Configuration |
|--------|---------------|
| Audit Other System Events | Success |
| Audit Security State Change | Success |
| Audit Security System Extension | Success |
| Audit System Integrity | Success, Failure |

---

# Administrative Templates

## Audit Process Creation

| Policy | Configuration |
|--------|---------------|
| Include command line in process creation events | Enabled |

---

## Credentials Delegation

| Policy | Configuration |
|--------|---------------|
| Encryption Oracle Remediation | Enabled (Mitigated) |

---

## Driver Installation

| Policy | Configuration |
|--------|---------------|
| Turn off Windows Update device driver search prompt | Enabled |

---

## Filesystem

| Policy | Configuration |
|--------|---------------|
| Enable Win32 long paths | Enabled |

---

## Group Policy

| Policy | Configuration |
|--------|---------------|
| Configure Group Policy Caching | Enabled |
| Slow link value | 500 ms |
| Timeout | 5000 ms |

---

## Internet Communication Management

| Policy | Configuration |
|--------|---------------|
| Turn off Windows Messenger CEIP | Enabled |
| Turn off Windows Customer Experience Improvement Program | Enabled |

---

## Logon

| Policy | Configuration |
|--------|---------------|
| Always wait for the network at computer startup and logon | Enabled |
| Do not display the Getting Started welcome screen | Enabled |
| Turn off picture password sign-in | Enabled |

---

## Remote Assistance

| Policy | Configuration |
|--------|---------------|
| Configure Offer Remote Assistance | Disabled |
| Configure Solicited Remote Assistance | Disabled |

---

## Credential User Interface

| Policy | Configuration |
|--------|---------------|
| Prevent the use of security questions for local accounts | Enabled |
| Require trusted path for credential entry | Enabled |

---

## File Explorer

| Policy | Configuration |
|--------|---------------|
| Do not preserve Zone Information in file attachments | Disabled |

---

## Remote Desktop Connection Client

| Policy | Configuration |
|--------|---------------|
| Configure server authentication for client | Warn if authentication fails |

---

# Validation

The policy was validated by:

- Applying the policy using `gpupdate /force`.
- Confirming policy application using `gpresult`.
- Verifying Local Security Policy reflected the configured settings.
- Confirming Administrative Template settings were successfully applied.
- Verifying event log sizes and retention settings.
- Confirming UAC operated as configured.
- Generating test events and confirming they appeared in Event Viewer.
- Verifying normal system functionality following policy deployment.

---

# Notes

This policy provides the primary security baseline for Windows computers within the Northstar Technologies environment. It combines Microsoft security recommendations with organisation-specific security requirements to establish a consistent, secure and manageable operating environment while maintaining compatibility with normal business operations.