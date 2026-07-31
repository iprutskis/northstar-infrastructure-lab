# NS - Windows Experience

## Overview

The **NS - Windows Experience** Group Policy Object (GPO) standardises the Windows user experience across managed computers within the Northstar Technologies environment.

The policy removes unnecessary consumer-focused Windows features, disables advertising and promotional content, restricts cloud integration where appropriate,
improves user consistency and provides a cleaner enterprise desktop experience.

---

## Purpose

The purpose of this policy is to:

- Standardise the Windows user experience.
- Remove consumer-oriented Windows features.
- Reduce unnecessary notifications and distractions.
- Disable unwanted cloud and Microsoft consumer services.
- Improve user consistency across managed devices.
- Present a clean and professional enterprise desktop environment.

---

## Scope

| Setting | Value |
|---------|-------|
| Policy Type | Computer Configuration & User Configuration |
| Applies To | Domain Computers |
| User Configuration | Enabled |

---

## GPO Information

| Property | Value |
|----------|-------|
| GPO Name | NS - Windows Experience |
| Linked OU | Domain Computers |
| Security Filtering | Authenticated Users |
| Loopback Processing | Not Configured |

---

# Technical Configuration

## Computer Configuration

### Personalization

| Policy | Configuration |
|--------|---------------|
| Prevent changing lock screen and logon image | Enabled |
| Prevent enabling lock screen camera | Enabled |
| Prevent enabling lock screen slide show | Enabled |

---

### Regional and Language Options

| Policy | Configuration |
|--------|---------------|
| Restrict Language Pack and Language Feature Installation | Enabled |

---

### Logon

| Policy | Configuration |
|--------|---------------|
| Do not display the Getting Started welcome screen at logon | Enabled |
| Show first sign-in animation | Disabled |
| Turn off app notifications on the lock screen | Enabled |
| Turn off Windows startup sound | Enabled |

---

### AutoPlay

| Policy | Configuration |
|--------|---------------|
| Default AutoRun behaviour | Do not execute any autorun commands |
| Turn off AutoPlay | Enabled (All drives) |

---

### Cloud Content

| Policy | Configuration |
|--------|---------------|
| Do not show Windows tips | Enabled |
| Turn off cloud optimised content | Enabled |
| Turn off Microsoft consumer experiences | Enabled |

---

### File Explorer

| Policy | Configuration |
|--------|---------------|
| Do not show the "new application installed" notification | Enabled |

---

### Microsoft Account

| Policy | Configuration |
|--------|---------------|
| Block all consumer Microsoft account user authentication | Enabled |

---

### OneDrive

| Policy | Configuration |
|--------|---------------|
| Prevent the usage of OneDrive for file storage | Enabled |

---

### OOBE

| Policy | Configuration |
|--------|---------------|
| Don't launch privacy settings experience on user logon | Enabled |

---

### Search

| Policy | Configuration |
|--------|---------------|
| Allow Cloud Search | Disabled |
| Do not allow web search | Enabled |
| Don't search the web or display web results in Search | Enabled |

---

### Sync Your Settings

| Policy | Configuration |
|--------|---------------|
| Do not sync | Enabled |
| Allow users to turn syncing on | Disabled |

---

# User Configuration

### Start Menu and Taskbar

| Policy | Configuration |
|--------|---------------|
| Turn off automatic promotion of notification icons to the taskbar | Enabled |
| Turn off feature advertisement balloon notifications | Enabled |

---

### Notifications

| Policy | Configuration |
|--------|---------------|
| Turn off toast notifications on the lock screen | Enabled |

---

### Cloud Content

| Policy | Configuration |
|--------|---------------|
| Turn off all Windows Spotlight features | Enabled |
| Turn off the Windows Welcome Experience | Enabled |

---

### File Explorer

| Policy | Configuration |
|--------|---------------|
| Display confirmation dialog when deleting files | Enabled |

---

# Validation

The policy was validated by:

- Applying the policy using `gpupdate /force`.
- Confirming policy application using `gpresult`.
- Verifying Windows consumer features were disabled.
- Confirming OneDrive was unavailable.
- Verifying Windows Search no longer displayed web results.
- Confirming AutoPlay was disabled for all drives.
- Verifying Windows Spotlight and Welcome Experience were disabled.
- Confirming lock screen customisation restrictions were applied.
- Verifying configured user interface settings after user sign-in.

---

# Notes

This policy standardises the Windows desktop experience across managed devices by removing consumer-focused features, reducing unnecessary notifications and advertisements,
restricting cloud services where appropriate and providing users with a consistent enterprise operating environment.

The configuration is designed to reduce distractions, improve usability and ensure Windows presents a professional experience suitable for business environments.