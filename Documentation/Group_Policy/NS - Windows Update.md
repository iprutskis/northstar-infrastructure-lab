# NS - Windows Update

## Overview

The **NS - Windows Update** Group Policy Object standardises the installation of Windows updates across managed workstations within the Northstar Technologies domain.

The policy automatically downloads updates and schedules installation during a predefined maintenance window, helping ensure systems remain secure while minimising disruption to users.

---

## Purpose

- Keep workstations up to date with the latest Windows security and quality updates.
- Standardise update behaviour across all managed devices.
- Schedule installations outside normal business hours.
- Reduce the need for manual update management.

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
| GPO Name | NS - Windows Update |
| Linked OU | Departments |

---

## Technical Configuration

| Policy | Configuration |
|--------|---------------|
| Configure Automatic Updates | Enabled |
| Automatic Updating | Auto download and schedule the install |
| Install during Automatic Maintenance | Enabled |
| Scheduled Install Day | Every Saturday |
| Scheduled Install Time | 03:00 |
| Schedule Frequency | Second week of the month |
| Install updates for other Microsoft products | Disabled |

---

## Validation

- Applied the policy using `gpupdate /force`.
- Confirmed the policy was applied using `gpresult`.
- Verified Windows Update settings reflected the configured Group Policy.
- Confirmed clients received the scheduled update configuration.

---

## Notes

- Updates are installed automatically during a scheduled maintenance window to reduce user disruption.
- Updates are configured to install on the **second Saturday of each month at 03:00**, providing a predictable maintenance schedule.
- Updates for other Microsoft products are not managed by this policy.