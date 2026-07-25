# IP Address Plan

## Network Information

| Setting | Value |
|---------|-------|
| Network Address | 192.168.10.0/24 |
| Usable Hosts | 254 |
| Purpose | Internal business network |
| Default Gateway | None (Host-Only Lab) |
| DNS Server | 192.168.10.10 (DC01) |
| DHCP Scope | To be configured |

## Domain Information

| Setting | Value |
|---------|-------|
| Active Directory Domain | northstar.local |
| NetBIOS Name | NORTHSTAR |
| Primary Domain Controller | DC01 |
| Domain DNS Server | 192.168.10.10 |

## Address Allocation Strategy

The network is divided into reserved address ranges to simplify
administration, troubleshooting and future expansion.

| Range | Purpose |
|-------|---------|
| 192.168.10.1 | Default Gateway |
| 192.168.10.2 - 9 | Network Infrastructure |
| 192.168.10.10 - 49 | Servers |
| 192.168.10.50 - 99 | Printers & Infrastructure |
| 192.168.10.100 - 199 | DHCP Client Devices |
| 192.168.10.200 - 254 | Reserved for Future Expansion |

## IP Address Allocation

| Asset ID | Device | Hostname | IP Address | Assignment | Notes |
|----------|--------|----------|------------|------------|-------|
| SRV-001 | Domain Controller | DC01 | 192.168.10.10 | Static | AD DS, DNS |
| SRV-002 | File server | FS01 | 192.168.10.11 | Static | File Server Role |

## DHCP Scope

DHCP Scope will be configured after the DHCP Server role has been installed
and the required network infrastructure has been completed.

## Notes

This IP addressing scheme has been designed to separate infrastructure,
servers and client devices while providing sufficient capacity for future
business growth.