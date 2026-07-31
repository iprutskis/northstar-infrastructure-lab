# NS - Windows Defender Firewall Baseline

## Overview

The **NS - Windows Defender Firewall** Group Policy Object (GPO) configures Windows Defender Firewall across all managed Windows computers within the Northstar Technologies environment.

The policy enables Windows Defender Firewall for all network profiles, blocks unsolicited inbound traffic, permits outbound communications,
enables firewall logging and establishes a consistent firewall configuration across the enterprise.

---

## Purpose

The purpose of this policy is to:

- Enable Windows Defender Firewall on all managed devices.
- Block unsolicited inbound connections by default.
- Allow outbound traffic unless explicitly restricted.
- Maintain local firewall rule support where appropriate.
- Enable firewall logging for security monitoring and troubleshooting.
- Apply a consistent firewall configuration across all Windows computers.

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
|----------|-------|
| GPO Name | NS - Windows Defender Firewall |
| Linked OU | Domain Computers |
| Security Filtering | Authenticated Users |
| Loopback Processing | Not Configured |

---

# Technical Configuration

## Windows Defender Firewall with Advanced Security

### Global Settings

| Policy | Configuration |
|--------|---------------|
| Policy version | 2.31 |
| Disable Stateful FTP | Not Configured |
| Disable Stateful PPTP | Not Configured |
| IPsec Exempt | Not Configured |
| IPsec Through NAT | Not Configured |
| Preshared Key Encoding | Not Configured |
| SA Idle Time | Not Configured |
| Strong CRL Check | Not Configured |

---

## Domain Profile

| Policy | Configuration |
|--------|---------------|
| Firewall state | On |
| Inbound connections | Block |
| Outbound connections | Allow |
| Apply local firewall rules | Yes |
| Apply local connection security rules | Yes |
| Display notifications | No |
| Allow unicast responses | Not Configured |
| Log dropped packets | Yes |
| Log successful connections | No |
| Log file | `%systemroot%\system32\logfiles\firewall\pfirewall.log` |
| Maximum log size | 16 MB (16384 KB) |

---

## Private Profile

| Policy | Configuration |
|--------|---------------|
| Firewall state | On |
| Inbound connections | Block |
| Outbound connections | Allow |
| Apply local firewall rules | Yes |
| Apply local connection security rules | Yes |
| Display notifications | No |
| Allow unicast responses | Not Configured |
| Log dropped packets | Yes |
| Log successful connections | No |
| Log file | `%systemroot%\system32\logfiles\firewall\pfirewall.log` |
| Maximum log size | 16 MB (16384 KB) |

---

## Public Profile

| Policy | Configuration |
|--------|---------------|
| Firewall state | On |
| Inbound connections | Block |
| Outbound connections | Allow |
| Apply local firewall rules | Yes |
| Apply local connection security rules | Yes |
| Display notifications | No |
| Allow unicast responses | Not Configured |
| Log dropped packets | Yes |
| Log successful connections | No |
| Log file | `%systemroot%\system32\logfiles\firewall\pfirewall.log` |
| Maximum log size | 16 MB (16384 KB) |

---

## Connection Security Rules

No connection security rules are configured within this policy.

---

# Administrative Templates

## Domain Profile

| Policy | Configuration |
|--------|---------------|
| Allow logging | Enabled |
| Log dropped packets | Enabled |
| Log successful connections | Disabled |
| Log file path | `%systemroot%\system32\logfiles\firewall\pfirewall.log` |
| Log size limit | 16384 KB |
| Prohibit notifications | Enabled |
| Protect all network connections | Enabled |

---

# Validation

The policy was validated by:

- Applying the policy using `gpupdate /force`.
- Confirming policy application using `gpresult`.
- Verifying Windows Defender Firewall was enabled for all network profiles.
- Confirming inbound connections were blocked and outbound connections allowed by default.
- Verifying local firewall rules remained enabled.
- Confirming dropped packet logging was enabled.
- Verifying the firewall log file was created at the configured location.
- Testing normal network connectivity following policy deployment.
- Confirming required enterprise services remained accessible.

---

# Notes

This policy establishes the standard Windows Defender Firewall configuration for all managed Windows computers within the Northstar Technologies environment.

The configuration follows a default-deny approach for inbound traffic while permitting outbound communications. Firewall logging is enabled to assist with monitoring and troubleshooting,
while local firewall and connection security rules remain available to support legitimate application and system requirements.