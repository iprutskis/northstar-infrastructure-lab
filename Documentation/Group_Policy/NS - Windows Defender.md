# NS - Windows Defender

## Overview

The **NS - Windows Defender** Group Policy Object (GPO) configures Microsoft Defender Antivirus and related Windows security features across the Northstar Technologies environment.

The policy strengthens endpoint protection by enabling real-time protection, cloud-delivered protection, attack surface reduction features, SmartScreen, exploit protection, malware scanning, security intelligence updates and Windows Security configuration.

---

## Purpose

The purpose of this policy is to:

- Provide a consistent Microsoft Defender configuration.
- Strengthen malware protection.
- Improve detection of potentially unwanted applications.
- Enable cloud-delivered protection.
- Protect against malicious websites and downloads.
- Improve attack prevention using Defender Network Protection and SmartScreen.
- Configure enterprise Windows Security settings.
- Standardise endpoint security across managed devices.

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
| GPO Name | NS - Windows Defender |
| Linked OU | Domain Computers |
| Security Filtering | Authenticated Users |
| Loopback Processing | Not Configured |

---

# Technical Configuration

## Microsoft Defender Antivirus

| Policy | Configuration |
|--------|---------------|
| Allow antimalware service to remain running always | Enabled |
| Configure detection for potentially unwanted applications | Enabled |
| Configure local administrator merge behavior for lists | Disabled |
| Turn off Microsoft Defender Antivirus | Disabled |

---

## Microsoft Defender MAPS

| Policy | Configuration |
|--------|---------------|
| Local MAPS reporting override | Disabled |
| Block at First Sight | Enabled |
| Join Microsoft MAPS | Enabled (Advanced MAPS) |
| Send file samples for further analysis | Enabled |

---

## Microsoft Defender Exploit Guard

### Network Protection

| Policy | Configuration |
|--------|---------------|
| Prevent users and apps from accessing dangerous websites | Enabled |
| Allow Network Protection configuration on Windows Server | Enabled |

---

## Microsoft Defender MpEngine

| Policy | Configuration |
|--------|---------------|
| Extended cloud check | Enabled (50 seconds) |
| File hash computation | Enabled |
| Cloud protection level | High Blocking Level |

---

## Microsoft Defender Network Inspection System

| Policy | Configuration |
|--------|---------------|
| Datagram processing | Enabled |
| Definition retrieval | Enabled |
| Protocol recognition | Enabled |

---

## Quarantine

| Policy | Configuration |
|--------|---------------|
| Local quarantine override | Disabled |
| Remove items from quarantine | Enabled (90 days) |

---

## Real-Time Protection

| Policy | Configuration |
|--------|---------------|
| Local monitoring override | Disabled |
| Local incoming/outgoing monitoring override | Disabled |
| Local download scanning override | Disabled |
| Local behaviour monitoring override | Disabled |
| Local real-time protection override | Disabled |
| Monitor file and program activity | Enabled (Bi-directional) |
| Monitor file and program activity on computer | Enabled |
| Scan downloaded files and attachments | Enabled |
| Turn off real-time protection | Disabled |
| Behaviour monitoring | Enabled |
| Process scanning | Enabled |
| Raw volume write notifications | Enabled |
| Script scanning | Enabled |

---

## Remediation

| Policy | Configuration |
|--------|---------------|
| Local scheduled full scan override | Disabled |

---

## Reporting

| Policy | Configuration |
|--------|---------------|
| Turn off enhanced notifications | Enabled |

---

## Scan Configuration

| Policy | Configuration |
|--------|---------------|
| Check security intelligence before scheduled scan | Enabled |
| Scan archive files | Enabled |
| Scan packed executables | Enabled |
| Scan removable drives | Enabled |
| Enable email scanning | Enabled |
| Enable heuristics | Enabled |

---

## Security Intelligence Updates

| Policy | Configuration |
|--------|---------------|
| Allow security intelligence updates from Microsoft Update | Enabled |
| Check security intelligence at startup | Enabled |
| Initiate update at startup | Enabled |
| Scan after security intelligence update | Enabled |

---

## Windows Defender SmartScreen

### Explorer

| Policy | Configuration |
|--------|---------------|
| App Install Control | Warn before installing apps from outside the Microsoft Store |
| Windows Defender SmartScreen | Warn and prevent bypass |

---

### Microsoft Edge

| Policy | Configuration |
|--------|---------------|
| Configure SmartScreen | Enabled |
| Prevent bypassing SmartScreen warnings | Enabled |

---

## Windows Security

### App and Browser Protection

| Policy | Configuration |
|--------|---------------|
| Prevent users from modifying settings | Enabled |

---

### Device Security

| Policy | Configuration |
|--------|---------------|
| Disable Clear TPM button | Enabled |

---

### Enterprise Customization

| Policy | Configuration |
|--------|---------------|
| Configure customised contact information | Enabled |
| Configure customised notifications | Enabled |
| Company Name | Northstar Technologies LTD |
| Contact Email | it@northstar.local |
| Contact Phone | 1000 |
| Support Website | https://support.northstar.local |

---

### Family Options

| Policy | Configuration |
|--------|---------------|
| Hide Family Options area | Enabled |

---

### Notifications

| Policy | Configuration |
|--------|---------------|
| Hide non-critical notifications | Enabled |

---

# Validation

The policy was validated by:

- Applying the policy using `gpupdate /force`.
- Confirming policy application using `gpresult`.
- Verifying Microsoft Defender settings within Windows Security.
- Confirming cloud-delivered protection was enabled.
- Verifying real-time protection remained active.
- Confirming SmartScreen settings were applied.
- Verifying Defender Security Intelligence updates completed successfully.
- Running a manual Defender quick scan.
- Confirming Windows Security displayed the configured enterprise contact information.
- Verifying all configured settings were successfully applied.

---

# Notes

This policy standardises Microsoft Defender Antivirus across all managed Windows devices within the Northstar Technologies environment.

The configuration prioritises preventative protection by combining real-time monitoring, cloud-delivered intelligence, SmartScreen, Network Protection, exploit mitigation and automated scanning. Enterprise customisation provides users with clear internal IT support information while preventing modification of security settings.