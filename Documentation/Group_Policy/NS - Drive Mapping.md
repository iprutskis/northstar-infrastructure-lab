# NS - Drive Mapping

## Overview

The **NS - Drive Mapping** Group Policy Object (GPO) automatically maps network drives for users within the Northstar Technologies Active Directory environment using **Group Policy Preferences (GPP)**.

Rather than requiring users or IT administrators to manually map network drives, the policy delivers the appropriate departmental shares automatically during user logon. Access to departmental drives is controlled using **Item-Level Targeting** based on Active Directory security group membership, ensuring users only receive the drives relevant to their department.

---

## Purpose

The purpose of this policy is to:

- Automatically map required network drives during user logon.
- Provide users with access only to the departmental shares they require.
- Standardise drive mappings across the organisation.
- Reduce manual administration and onboarding time.
- Ensure a consistent user experience across all domain-joined workstations.

---

## Scope

| Setting | Value |
|---------|-------|
| Policy Type | User Configuration |
| Technology | Group Policy Preferences |
| Applies To | Domain Users |
| Processing | User Logon |

---

## GPO Information

| Property | Value |
|----------|-------|
| GPO Name | NS - Drive Mapping |
| Linked OU | Departments |
| Security Filtering | Authenticated Users |
| Loopback Processing | Not Configured |

---

## Technical Configuration

### Company Drive

| Setting | Value |
|---------|-------|
| Drive Letter | P: |
| Action | Update |
| Location | `\\FS01\Company` |
| Label | Company |
| Reconnect | Enabled |
| Run in Logged-on User's Security Context | Enabled |
| Targeting | All users |

---

### Departmental Drives

Departmental drives are deployed using **Item-Level Targeting** based on Active Directory security group membership.

| Drive | Share | Target Group |
|-------|-------|--------------|
| F: | Finance | Finance Users OR Finance Managers |
| V: | Human Resources | HR Users OR HR Managers |
| I: | IT Department | IT Users OR IT Managers |
| L: | Logistics | Logistics Users OR Logistics Managers |
| M: | Maintenance | Maintenance Users OR Maintenance Managers |
| R: | Production | Production Users OR Production Managers |
| T: | Customer Support | Customer Support Users OR Customer Support Managers |
| Q: | Quality Assurance | QA Users OR QA Managers |
| D: | Research and Development | R&D Users OR R&D Managers |
| S: | Sales | Sales Users OR Sales Managers |
| W: | Warehouse | Warehouse Users OR Warehouse Managers |
| U: | Purchasing | Purchasing Users OR Purchasing Managers |

---

## Validation

The policy was validated by:

- Running `gpupdate /force`
- Reviewing applied policies using `gpresult`
- Logging on with multiple department user accounts
- Confirming only the correct departmental drives were mapped
- Confirming the Company drive was mapped for all users
- Verifying successful access to mapped network shares

---

## Notes

- Drive mappings use the **Update** action to avoid recreating existing mappings unnecessarily.
- Department-specific drives are assigned dynamically using **Item-Level Targeting**, allowing users to receive the correct mappings automatically based on Active Directory group membership.
- The policy requires no manual configuration on client workstations after domain join.

## Troubleshooting

### Existing Manual Drive Mappings

During testing, duplicate or unexpected drive mappings were observed.

**Cause**

The test user already had manually created network drive mappings from Build 004 before the Drive Mapping GPO was introduced.

**Resolution**

The existing manual mappings were removed and the user logged on again. Group Policy Preferences then recreated the drive mappings correctly according to the configured policy.

**Recommendation**

When validating Group Policy drive mappings, remove any existing manual mappings or use a clean test user to avoid misleading results.