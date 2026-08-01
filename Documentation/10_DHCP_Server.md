# DHCP Server

## Overview

This document describes the Dynamic Host Configuration Protocol (DHCP) deployment for the Northstar Technologies internal Active Directory lab.

The DHCP Server is responsible for automatically assigning IPv4 addresses and network configuration to domain-joined client devices.

The DHCP role is installed on the Domain Controller (DC01) due to the small size of the lab environment.

---

## Server Information

| Setting | Value |
|---------|-------|
| Server Name | DC01 |
| Server Role | Domain Controller |
| Additional Roles | DNS, DHCP |
| IPv4 Address | 192.168.10.10 |
| Domain | northstar.local |

---

## DHCP Overview

DHCP (Dynamic Host Configuration Protocol) automatically provides network settings to computers joining the network.

Instead of configuring every workstation manually, DHCP supplies:

- IP Address
- Subnet Mask
- DNS Server
- DNS Suffix
- Lease Duration

This greatly simplifies administration and reduces configuration errors.

---

## DHCP Scope

### Scope Information

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

### Scope Options

| Option | Value |
|--------|-------|
| DNS Server | 192.168.10.10 |
| DNS Domain | northstar.local |
| Router (Gateway) | None (Host-only Lab) |

---

## IP Address Allocation

The DHCP scope has been designed in accordance with the IP addressing strategy.

For the complete address allocation scheme, see:

- 05_IP_Address_Plan.md