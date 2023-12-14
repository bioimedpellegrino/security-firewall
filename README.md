# README for IP Restriction Scripts
## Overview
This repository contains two scripts, ipset.sh and apply.sh, designed for IP-based access control using IP sets and iptables in Linux. The ipset.sh script creates a whitelist of IP ranges based on specified countries, and apply.sh applies firewall rules to allow traffic only from these whitelisted IPs.

## Prerequisites
- A Linux system with ipset and iptables installed.
- Root privileges for executing the scripts and modifying iptables rules.
- Internet connection to download IP ranges.

## Installation

1. **Clone the Repository:**
You can clone this repository to your local machine or simply download the scripts.

2. **Prepare the Environment:**

Ensure you have ipset and iptables installed on your system. These can be installed via your package manager (e.g., apt-get on Debian-based systems).

## Usage
### ipset.sh
This script creates IP sets based on country-specific IP ranges.

1. **Configuration:**

You can modify the countries variable within the script to include or exclude specific country codes. The default is set to it (Italy), fr (France), si (Slovenia), de (Germany), and at (Austria).

2. **Execution:**

Run the script as root:

```
ipset create allow_cc hash:net family inet hashsize 1024 maxelem 65536
```

```
./ipset.sh
```

This will download the latest IP ranges for the specified countries and add them to an IP set named allow_cc.

```
./apply.sh
```

This script applies iptables rules to allow traffic from the IPs in the allow_cc set.

## Customization:

Review and modify the iptables rules if necessary, especially if you have pre-existing rules or specific network requirements.

## Important Notes
Backup Your Current iptables Rules: Before running apply.sh, it is recommended to back up your current iptables rules.
Testing: Test the scripts in a controlled environment before deploying them in a production setting.
Updating IP Ranges: Rerun ipset.sh periodically to update the IP ranges.

This project is licensed under the MIT License.

## Contributions
Contributions are welcome. Please open an issue or submit a pull request with your proposed changes or enhancements.