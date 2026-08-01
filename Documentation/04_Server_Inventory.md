# Server Inventory

## Purpose

This document provides an inventory of all servers within the Northstar Technologies Ltd lab environment. It records each server's hardware allocation, 
operating system, network configuration and installed roles.

---

## DC01

| Property | Value |
|----------|-------|
| Asset ID | SRV-001 |
| VM Name | DC01 |
| Hostname | DC01 |
| Role | Primary Domain Controller |
| Operating System | Windows Server 2022 Standard (Desktop Experience) |
| vCPUs | 4 |
| Memory | 8 GB |
| Storage | C: 100 GB (Thin Provisioned) |
| Firmware | UEFI |
| Secure Boot | Enabled |
| Internal Network | VMnet1 (Host-only) |
| Internal IP Address | 192.168.10.10 |
| External Network | VMnet8 (NAT) |
| External IP Address | DHCP (VMware NAT) |
| Preferred DNS Server | 192.168.10.10 |
| Domain | northstar.local |
| Installed Roles | Active Directory Domain Services (AD DS), DNS Server, DHCP |
| Purpose | Domain authentication, directory services and DNS resolution |

---

## FS01

| Property | Value |
|----------|-------|
| Asset ID | SRV-002 |
| VM Name | FS01 |
| Hostname | FS01 |
| Role | File Server |
| Operating System | Windows Server 2022 Standard (Desktop Experience) |
| vCPUs | 2 |
| Memory | 4 GB |
| Storage | C: 60 GB (Thin Provisioned) |
| Secondary Storage | D: 20 GB (Thin Provisioned) |
| Firmware | UEFI |
| Secure Boot | Enabled |
| Internal Network | VMnet1 (Host-only) |
| Internal IP Address | 192.168.10.11 |
| External Network | VMnet8 (NAT) |
| External IP Address | DHCP (VMware NAT) |
| Preferred DNS Server | 192.168.10.10 |
| Domain | northstar.local |
| Installed Roles | File Server |
| Purpose | Departmental file storage, user home folders and NTFS permission management |