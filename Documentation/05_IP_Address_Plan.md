# IP Address Plan

## Network Information

| Setting | Value |
|---------|-------|
| Network Address | 192.168.10.0/24 |
| Usable Hosts | 254 |
| Purpose | Internal business network |
| Default Gateway | None (Host-Only Lab) |
| DNS Server | 192.168.10.10 (DC01) |
| DHCP Scope | Northstar Clients |
| DHCP Server | DC01 (192.168.10.10) |
| Lease Duration | 8 days |

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
| SRV-001 | Domain Controller | DC01 | 192.168.10.10 | Static | AD DS, DNS, DHCP |
| SRV-002 | File server | FS01 | 192.168.10.11 | Static | File Server Role |

## DHCP Scope

## DHCP Scope

| Setting | Value |
|---------|-------|
| Scope Name | Northstar Clients |
| Network | 192.168.10.0/24 |
| Address Range | 192.168.10.100 - 192.168.10.199 |
| Subnet Mask | 255.255.255.0 |
| Lease Duration | 8 Days |
| DNS Server | 192.168.10.10 |
| DNS Domain | northstar.local |
| Default Gateway | None (Host-only Lab) |
| Excluded Range | 192.168.10.1 - 192.168.10.99 |

### Validation

- DHCP Server installed on DC01.
- DHCP authorized in Active Directory.
- Scope activated successfully.
- CL01 successfully obtained IP address **192.168.10.100**.
- Lease verified in DHCP Management Console.
- FS01 was tested with DHCP and returned to a static IP address.

## Notes

This IP addressing scheme separates infrastructure servers from client devices while providing sufficient capacity for future business growth.

Infrastructure servers use static IP addresses, while workstation devices receive addresses automatically through DHCP.