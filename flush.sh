#!/bin/bash

# Flush di tutte le regole di iptables

# Flush delle regole
iptables -F
iptables -X

# Flush delle regole specifiche delle catene
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -t raw -F
iptables -t raw -X

# Imposta la policy predefinita su ACCEPT
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
