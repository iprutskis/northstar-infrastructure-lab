# Build Logs

## Build 001 - Base Infrastructure Deployment

**Date:** 13 July 2026

### Completed

- Project documentation created
- VMware virtual machine (DC01) configured
- Initial network and IP address planning completed
- Installed Windows Server 2022 Standard (Desktop Experience)
- Completed the initial operating system setup
- Configured the local Administrator account
- Renamed the server to DC01
- Added a computer description
- Installed VMware Tools
- Configured a static IPv4 address
- Verified network configuration
- Installed Active Directory Domain Services (AD DS)
- Promoted DC01 to a Domain Controller

---

## Build 002 - Active Directory Structure

**Date:** 14 July 2026

### Completed

- Created the departmental Organizational Unit structure
- Created Users, Computers and Groups sub-OUs for each department
- Created employee data and converted it to CSV format
- Imported Active Directory users from Employees.csv
- Created department security groups automatically using PowerShell
- Added users to their department security groups automatically
- Tested all automation scripts successfully
- Updated PowerShell documentation and project notes

---

### PowerShell Scripts

- Create-DepartmentStructure.ps1
- Convert-EmployeesToCsv.ps1
- Import-EmployeesFromCsv.ps1
- Create-DepartmentGroups.ps1
- Add-UsersToGroups.ps1

---

### Issues Encountered

- Parser errors caused by missing quotes and '=' during script development
- Username mismatch (Sara vs Sarah) caused duplicate user creation
- Existing users and groups required existence checks before creation

---

### Outcome

Active Directory was successfully populated with the required organizational structure, users and security groups.
All deployment scripts were validated and prepared for future reuse.

---

## Build 003 - File Server Deployment

**Date:** 23 July 2026

### Objective

Deploy a dedicated file server to separate company data from the domain controller and prepare the environment for departmental shared folders,
user home folders and NTFS permissions.

---

### Completed

- Created the FS01 virtual machine
- Installed Windows Server 2022 Standard (Desktop Experience)
- Installed VMware Tools
- Configured a static IPv4 address
- Configured the preferred DNS server to use DC01 (192.168.10.10)
- Joined FS01 to the northstar.local domain
- Verified successful communication with the domain controller
- Installed the File Server role
- Initialised and formatted the secondary virtual disk
- Assigned drive letter D: for company data
- Created the initial storage folder structure:
  - Archive
  - Backups
  - Home
  - Shares
  - Software
- Created departmental shared folders
- Configured SMB share permissions
- Configured NTFS permissions using Active Directory security groups
- Disabled permission inheritance on the D:\Shares directory and converted inherited permissions to explicit permissions
- Created and configured the hidden Home$ share
- Configured user home folder paths in Active Directory
- Automatically generated home folders for all users
- Verified user home folder permissions
- Enabled Access-Based Enumeration (ABE) on all departmental shares

---

### Outcome

FS01 was successfully deployed and configured as the enterprise file server for Northstar Technologies.
The server provides secure departmental file shares, automated user home folders and role-based access control using Active Directory security groups.

---

## Build 004 - Windows 11 Client Deployment

**Date:** 25 July 2026

### Objective

Deploy a Windows 11 Enterprise client workstation, join it to the northstar.local domain and verify communication with the existing Active Directory infrastructure.

---

### Completed

- Deployed Windows 11 Enterprise client (CL01)
- Joined CL01 to the northstar.local domain
- Verified domain authentication using a standard domain user account
- Configured and validated automatic Home (H:) drive mapping through Active Directory
- Manually mapped the Company (S:) and IT Department (I:) network drives
- Verified persistent network drive mappings after user logoff/logon
- Validated NTFS and share permissions for Home, Company and departmental shares
- Confirmed read-only access to the Company share for standard users
- Confirmed read/write access to the user's departmental share
- Verified communication between CL01, DC01 and FS01

---

### Outcome

CL01 was successfully deployed and integrated into the Northstar Technologies domain.
The workstation communicates correctly with the Domain Controller and File Server, 
and all configured network drives and file permissions were successfully validated.

---

## Build 005 - Group Policy Deployment

**Date:** 31 July 2026

### Objective

Deploy and validate Group Policy Objects (GPOs) to establish a centrally managed Windows environment for Northstar Technologies, including security settings, firewall configuration,
Windows Update, user experience, power management, drive mapping and printer deployment.

---

### Completed

- Created enterprise Group Policy Objects
- Configured Group Policy settings for workstations, servers and domain controllers where applicable
- Linked GPOs to the appropriate Organizational Units (OUs)
- Verified GPO inheritance and precedence
- Configured automatic departmental drive mappings using Group Policy Preferences
- Configured Windows Defender settings
- Configured Windows Defender Firewall baseline
- Configured Windows Update settings
- Configured Windows user experience settings
- Configured power management settings
- Validated policy deployment using gpupdate and gpresult
- Verified successful application of both computer and user policies
- Verified automatic network drive mapping and access to departmental shares

---

### Issues Encountered

- Network shares became inaccessible after the initial Windows Defender Firewall Baseline deployment.
- Investigation determined that disabling local firewall rules prevented the built-in SMB firewall rules from being applied.
- Updated the Firewall Baseline to allow local firewall and connection security rules.
- Re-tested Group Policy deployment and confirmed successful access to all mapped network drives.

---

### Outcome

Group Policy infrastructure was successfully deployed and validated. User and computer policies applied correctly, network drives were mapped automatically,
shared resources remained accessible and the final Firewall Baseline operated as intended without impacting domain services.
