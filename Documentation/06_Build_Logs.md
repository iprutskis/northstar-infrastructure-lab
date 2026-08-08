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

---

## Build 006 - Enterprise Network Infrastructure

**Date:** 1 August 2026

### Objective

Implement enterprise network services by deploying a Windows DHCP Server, introducing a dual-network architecture,
enabling internet connectivity for all virtual machines and validating communication between on-premises infrastructure and external services.

---

### Completed

- Installed and configured the Windows DHCP Server role on DC01
- Authorised the DHCP Server in Active Directory
- Created and activated the **Northstar Clients** DHCP scope
- Configured DHCP options for DNS server and DNS suffix
- Configured DC01 with separate Internal and External network adapters
- Configured FS01 with separate Internal and External network adapters
- Configured CL01 with separate Internal and External network adapters
- Connected all virtual machines to the VMware NAT network for internet access
- Configured DC01 DNS forwarders for external name resolution
- Disabled DNS registration on the DC01 External network adapter to prevent incorrect DNS records
- Configured all domain-joined systems to use DC01 (192.168.10.10) as their preferred DNS server
- Validated DHCP lease assignment for CL01
- Verified internal hostname resolution between DC01, FS01 and CL01
- Verified external DNS resolution through DC01
- Verified internet connectivity from all virtual machines
- Successfully updated Group Policy using `gpupdate /force`
- Updated project documentation to reflect the completed network architecture

---

### Issues Encountered

- The multi-homed Domain Controller initially registered both network adapters in DNS, causing domain clients to resolve the incorrect IP address.
- DNS registration was disabled on the External network adapter, ensuring that only the Internal IP address is published in Active Directory DNS.
- Client network adapter identification required verification using IP configuration rather than Windows network profile names, as the displayed network profile was not a reliable indicator of adapter purpose.

---

### Outcome

The Northstar Technologies lab now operates with a fully functional enterprise network architecture. Active Directory, DNS, DHCP, Group Policy and file services communicate over the Internal network, 
while internet access is provided through the External VMware NAT network. The environment is now prepared for Microsoft 365, Microsoft Entra ID and Intune integration.

---

## Build 007 - Microsoft 365 and Hybrid Identity Integration

**Date:** 7 August 2026

### Objective

Integrate the Northstar Technologies on-premises Active Directory environment with Microsoft cloud services by configuring Microsoft 365, Microsoft Entra ID, Microsoft Intune and Microsoft Entra Connect Sync,
establishing hybrid identity and preparing the environment for modern Windows device management.

---

### Completed

- Configured the Northstar Technologies Microsoft 365 tenant
- Configured Microsoft Entra ID for cloud identity management
- Configured Microsoft Intune for Windows device management
- Created a Windows Autopilot deployment profile for corporate-owned Windows devices
- Installed Microsoft Entra Connect Sync on FS01
- Connected the northstar.local Active Directory forest to Microsoft Entra ID
- Added northstartechltd.onmicrosoft.com as an alternative Active Directory UPN suffix
- Updated Active Directory user UPNs to use the name.surname@northstartechltd.onmicrosoft.com format
- Configured Active Directory domain and OU synchronization filtering
- Configured Password Hash Synchronization (PHS)
- Configured ms-DS-ConsistencyGuid as the source anchor for synchronized identities
- Completed the initial Active Directory to Microsoft Entra ID synchronization
- Verified synchronized Active Directory users in Microsoft Entra ID
- Verified the Microsoft Entra Connect synchronization scheduler
- Confirmed the automatic 30-minute synchronization interval
- Successfully performed a manual Delta synchronization using PowerShell
- Verified Microsoft Entra Connect Health monitoring and synchronization alerts

---

### Issues Encountered

- The northstar.local UPN suffix could not be matched to a verified Microsoft Entra ID domain because it is a non-routable internal domain.
- Added the Microsoft tenant domain as an alternative Active Directory UPN suffix and updated user UPNs accordingly.
- Microsoft Entra Connect Seamless Single Sign-On configuration failed with a Win32Exception stating that the implementation was not capable of performing the request.
- Seamless Single Sign-On was postponed to allow the core hybrid identity and synchronization configuration to be completed first.
- Microsoft Entra Connect Health generated a synchronization-stopped alert after the lab environment remained powered off for more than 24 hours; this was confirmed as expected behaviour for the lab environment.

---

### Outcome

Northstar Technologies now operates with a functional hybrid identity environment integrating on-premises Active Directory with Microsoft Entra ID. 
Active Directory users and password hashes synchronize successfully to Microsoft Entra ID through Microsoft Entra Connect Sync, and the environment is integrated with Microsoft 365 and Microsoft Intune.

The core infrastructure is now ready for final workstation and deployment preparation before transitioning the Northstar Technologies lab into a ticket-driven live support environment.

---

## Build 008 - Windows 11 Golden Image and Workstation Deployment

**Date:** 8 August 2026

### Objective

Create and deploy a standardized Windows 11 Enterprise workstation image and integrate the first workstation with the Northstar domain and Microsoft Entra ID.

### Completed

- Created Windows 11 Enterprise reference workstation
- Used Audit Mode for workstation configuration
- Installed required workstation applications
- Applied workstation baseline configuration
- Prepared and captured customized Windows image
- Created custom Windows installation media
- Deployed custom image to IT-WS01
- Verified deployed applications and configuration
- Created LocalAdmin provisioning and recovery account
- Removed initial direct Microsoft Entra ID join and previous user configuration
- Joined IT-WS01 to northstar.local
- Moved IT-WS01 to IT Computers OU
- Verified domain authentication
- Verified domain Group Policy application
- Configured Hybrid Microsoft Entra ID join
- Verified Hybrid Microsoft Entra device state
- Verified Microsoft Entra device authentication and user PRT

### Outcome

A standardized Windows 11 Enterprise workstation image was successfully created and validated through deployment to IT-WS01. 
The workstation was joined to northstar.local, received the required domain policies and was successfully configured as a Hybrid Microsoft Entra joined device. 
IT-WS01 is now ready for endpoint management and IT support configuration.

---

## Build 009 - IT Support Workstation and Service Management

**Date:** 8 August 2026

### Objective

Prepare IT-WS01 as an operational IT support workstation, enable Microsoft Intune management and implement a service management platform for Northstar Technologies.

### Completed

- Configured IT-WS01 as the primary IT support workstation
- Installed required IT support and administration software
- Verified Microsoft 365 access using the Northstar user account
- Assigned required Microsoft 365 licence to the IT user
- Configured Group Policy for automatic Microsoft Intune enrollment
- Applied Intune automatic enrollment policy to IT-WS01
- Verified automatic enrollment GPO application using gpresult
- Verified Microsoft Intune enrollment scheduled tasks
- Verified MDM enrollment and device management configuration
- Confirmed IT-WS01 successfully appeared in Microsoft Intune
- Verified Hybrid Microsoft Entra joined and Intune-managed device state
- Selected Jira Service Management as the Northstar IT ticketing platform
- Created Northstar IT Service Desk
- Configured IT service request types and categories
- Configured service desk access and customer permissions
- Configured Jira email request channel
- Tested email-to-ticket creation successfully
- Configured separate Jira administrator and IT support agent access
- Verified IT agent permissions from IT-WS01
- Created and connected a Confluence knowledge base
- Reviewed Jira incident management configuration
- Verified the IT agent can access service desk queues and work submitted requests

### Outcome

IT-WS01 is now configured as an operational Northstar IT support workstation with Hybrid Microsoft Entra ID and Microsoft Intune management. 
Jira Service Management has been configured as the central IT service desk with email ticket creation, agent access and a connected knowledge base. 
The environment is now ready to transition from infrastructure deployment into ticket-driven IT support and troubleshooting scenarios.