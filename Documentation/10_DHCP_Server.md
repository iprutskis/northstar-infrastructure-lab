# DHCP Server

---

## Overview

This document describes the Dynamic Host Configuration Protocol (DHCP) deployment for the Northstar Technologies internal Active Directory lab.

The DHCP Server is responsible for automatically assigning IPv4 addresses and network configuration to domain-joined client devices.

The DHCP role is installed on the Domain Controller (DC01) due to the small size of the lab environment.

---

# Server Information

| Setting | Value |
|---------|-------|
| Server Name | DC01 |
| Server Role | Domain Controller |
| Additional Roles | DNS, DHCP |
| IPv4 Address | 192.168.10.10 |
| Domain | northstar.local |

---

# DHCP Overview

DHCP (Dynamic Host Configuration Protocol) automatically provides network settings to computers joining the network.

Instead of configuring every workstation manually, DHCP supplies:

- IP Address
- Subnet Mask
- DNS Server
- DNS Suffix
- Lease Duration

This greatly simplifies administration and reduces configuration errors.

---

# DHCP Scope

## Scope Information

| Setting | Value |
|---------|-------|
| Scope Name | Northstar Clients |
| Network | 192.168.10.0/24 |
| Start IP | 192.168.10.100 |
| End IP | 192.168.10.199 |
| Subnet Mask | 255.255.255.0 |
| Lease Duration | 8 Days |
| Status | Active |

---

# Scope Options

| Option | Value |
|--------|-------|
| DNS Server | 192.168.10.10 |
| DNS Domain | northstar.local |
| Router (Gateway) | None (Host-only Lab) |

---

# Address Allocation Strategy

Infrastructure devices use static IP addresses while client devices receive addresses dynamically.

| Address Range | Purpose |
|---------------|---------|
| 192.168.10.1 | Reserved Gateway |
| 192.168.10.2 - 9 | Network Infrastructure |
| 192.168.10.10 - 49 | Servers |
| 192.168.10.50 - 99 | Printers / Infrastructure |
| 192.168.10.100 - 199 | DHCP Clients |
| 192.168.10.200 - 254 | Reserved for Future Expansion |

---

# DHCP Lease Duration

Lease Duration defines how long a client is allowed to use an IP address before renewing it.

Current Configuration:

- 8 Days

This value is appropriate for a stable office environment where devices rarely change.

Smaller lease times may be used for:

- Guest Wi-Fi
- Training rooms
- Hot-desking
- Temporary devices

Longer lease times reduce DHCP traffic on stable networks.

---

# DHCP Authorization

The DHCP Server has been authorized within Active Directory.

Authorization prevents unauthorized DHCP servers from issuing IP addresses inside the domain.

---

# Testing Performed

## File Server Validation

The File Server (FS01) was temporarily switched from Static IPv4 configuration to DHCP.

Validation confirmed:

- DHCP address received successfully
- DNS server assigned correctly
- Domain communication remained operational

The File Server was then returned to its original static IP configuration.

---

## Client Validation

Client workstation CL01 successfully obtained:

| Setting | Value |
|---------|-------|
| IPv4 Address | 192.168.10.100 |
| DHCP Server | 192.168.10.10 |
| DNS Server | 192.168.10.10 |
| DNS Suffix | northstar.local |

The active lease was confirmed within the DHCP Management Console.

---

# Design Decisions

The DHCP role is installed on the Domain Controller because:

- Small business environment
- Only one infrastructure server
- Simplifies administration
- Common practice in small organisations

In larger enterprise environments DHCP is commonly deployed on dedicated infrastructure servers with failover.

---

# Outcome

The DHCP infrastructure has been successfully deployed.

Completed functionality includes:

- DHCP Server installation
- Active Directory authorization
- IPv4 Scope creation
- Automatic IP allocation
- DNS configuration
- Lease validation
- Client testing
- Management console verification

The Northstar Technologies environment now supports automatic network configuration for domain workstations.