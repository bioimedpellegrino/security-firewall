#!/bin/bash

# Verifica gli IP bloccati

# Elenca tutte le regole di INPUT che portano a DROP
iptables -L INPUT -v -n --line-numbers | grep "DROP"

# Se utilizzi set di IP (ad esempio ipset) per bloccare gli IP
# Puoi elencare gli IP nel set
ipset list allow_cc
