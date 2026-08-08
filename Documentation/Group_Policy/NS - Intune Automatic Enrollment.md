# NS - Intune Automatic Enrollment

## Overview

The **NS - Intune Automatic Enrollment** Group Policy Object (GPO) automatically enrolls eligible Hybrid Microsoft Entra joined workstations into Microsoft Intune within the Northstar Technologies environment.

The policy allows domain-joined workstations to automatically register with Microsoft Intune for centralized endpoint management without requiring manual device enrollment.

---

## Purpose

- Automatically enroll eligible workstations into Microsoft Intune.
- Provide centralized endpoint management.
- Reduce manual workstation enrollment.
- Support the Northstar Hybrid Microsoft Entra ID environment.
- Establish a consistent enrollment process for managed workstations.

---

## Scope

| Setting | Value |
|---------|-------|
| Policy Type | Computer Configuration |
| Applies To | Domain Workstations |
| User Configuration | None |

---

## GPO Information

| Property | Value |
|----------|-------|
| GPO Name | NS - Intune Automatic Enrollment |
| Linked OU | Departments |
| Security Filtering | Authenticated Users |
| Loopback Processing | Not Configured |

---

## Technical Configuration

### MDM Enrollment

| Policy | Configuration |
|--------|---------------|
| Enable automatic MDM enrollment using default Microsoft Entra credentials | Enabled |
| Credential Type | User Credential |

---

## Enrollment Requirements

Devices must:

- Be joined to the northstar.local Active Directory domain.
- Be successfully Hybrid Microsoft Entra joined.
- Receive the NS - Intune Automatic Enrollment GPO.
- Have connectivity to Microsoft cloud services.
- Have an eligible Microsoft Intune licensed user.

---

## Validation

The policy was validated using IT-WS01 by:

- Applying the policy using `gpupdate /force`.
- Confirming policy application using `gpresult /r`.
- Confirming IT-WS01 was both domain joined and Microsoft Entra joined using `dsregcmd /status`.
- Confirming a Microsoft Entra Primary Refresh Token (PRT) was available.
- Verifying creation of the Windows automatic MDM enrollment scheduled task.
- Confirming successful MDM enrollment.
- Confirming IT-WS01 appeared as a managed device within Microsoft Intune.

---

## Notes

The policy provides automatic Microsoft Intune enrollment for eligible Hybrid Microsoft Entra joined Northstar workstations.

Enrollment is performed using the signed-in user's Microsoft Entra credentials. The user must have the appropriate Microsoft Intune licensing for automatic enrollment to complete successfully.