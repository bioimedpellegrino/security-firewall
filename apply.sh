#!/bin/bash

# Flush existing rules
iptables -F

# Allow incoming HTTP connections from the whitelisted IP addresses
iptables -A INPUT -p tcp --dport 80 -m set --match-set allow_cc src -j ACCEPT

# Allow incoming HTTPS connections from the whitelisted IP addresses
iptables -A INPUT -p tcp --dport 443 -m set --match-set allow_cc src -j ACCEPT

# Allow incoming SSH connections
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow established and related connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow all loopback traffic
iptables -I INPUT 1 -i lo -j ACCEPT

# Drop all other incoming connections
iptables -A INPUT -j DROP