# IP Address Plan

## Purpose

This document defines the IP addressing scheme used within the Northstar Technologies Ltd lab environment. 
It provides a structured IP allocation strategy for infrastructure, servers and client devices to ensure consistency, 
simplify administration and support future expansion.

---

## Internal Network

| Setting | Value |
|---------|-------|
| Network Address | 192.168.10.0/24 |
| Usable Hosts | 254 |
| Purpose | Internal business network |

---

## Domain Information

| Setting | Value |
|---------|-------|
| Active Directory Domain | northstar.local |
| NetBIOS Name | NORTHSTAR |

---

## Address Allocation Strategy

The internal network is divided into dedicated address ranges to simplify administration and allow future infrastructure expansion.

| Range | Purpose |
|-------|---------|
| 192.168.10.1 | Reserved (Future Gateway) |
| 192.168.10.2–9 | Network Infrastructure |
| 192.168.10.10–49 | Servers |
| 192.168.10.50–99 | Infrastructure Services |
| 192.168.10.100–199 | Client Devices (DHCP) |
| 192.168.10.200–254 | Reserved for Future Expansion |

---

## Static IP Assignments

| Asset ID | Device | Hostname | IP Address | Assignment | Status | Notes |
|----------|--------|----------|------------|------------|--------|-------|
| SRV-001 | Domain Controller | DC01 | 192.168.10.10 | Static | Active | AD DS, DNS, DHCP |
| SRV-002 | File Server | FS01 | 192.168.10.11 | Static | Active | File Services |

---

## DHCP Allocation

Client workstations receive IPv4 addresses dynamically from the Windows DHCP Server.

Detailed DHCP configuration, scope settings and server configuration are documented separately in **10_DHCP_Server.md**.

---

## Future Address Reservations

The following address ranges are reserved for future infrastructure expansion.

| Range | Planned Use |
|-------|-------------|
| 192.168.10.20–29 | Application Servers |
| 192.168.10.30–39 | Management Servers |
| 192.168.10.40–49 | Additional Infrastructure Services |

---

## Notes

Infrastructure servers use static IP addresses, while client workstations receive addresses dynamically through the Windows DHCP Server.

The addressing strategy has been designed to provide consistent IP allocation, simplify administration and support future growth without requiring changes to the existing network design.