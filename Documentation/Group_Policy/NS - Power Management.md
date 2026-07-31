# NS - Power Management

## Overview

The **NS - Power Management** Group Policy Object (GPO) standardises power settings across domain-joined workstations to improve energy efficiency while maintaining security and a consistent user experience.

The policy configures sleep behaviour, display timeouts and wake-up authentication through Administrative Templates.

---

## Purpose

- Reduce unnecessary power consumption.
- Maintain a consistent power policy across all managed devices.
- Protect unattended computers by requiring authentication after waking from sleep.
- Balance usability with energy efficiency.

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
| GPO Name | NS - Power Management |
| Linked OU | Departments |

---

## Technical Configuration

### Sleep Settings

| Policy | Configuration |
|--------|---------------|
| Require a password when a computer wakes (on battery) | Enabled |
| Require a password when a computer wakes (plugged in) | Enabled |
| System sleep timeout (on battery) | 15 minutes |
| System sleep timeout (plugged in) | 20 minutes |

### Display Settings

| Policy | Configuration |
|--------|---------------|
| Turn off display (on battery) | 10 minutes |
| Turn off display (plugged in) | 15 minutes |

---

## Validation

- Applied the policy using `gpupdate /force`.
- Confirmed the policy was applied using `gpresult`.
- Verified the configured sleep and display timeout settings on a client workstation.
- Confirmed a password was required after waking from sleep.

---

## Notes

The display is configured to turn off before the system enters sleep mode, reducing power consumption while allowing users to resume work quickly if they return shortly after leaving their workstation.