#!/bin/bash

iptables -t nat -N REDSOCKS
iptables -t nat -A REDSOCKS -d 0.0.0.0/8 -j RETURN
iptables -t nat -A REDSOCKS -d 10.0.0.0/8 -j RETURN
iptables -t nat -A REDSOCKS -d 127.0.0.0/8 -j RETURN
iptables -t nat -A REDSOCKS -d 169.254.0.0/16 -j RETURN
iptables -t nat -A REDSOCKS -d 172.16.0.0/12 -j RETURN
iptables -t nat -A REDSOCKS -d 192.168.0.0/16 -j RETURN
iptables -t nat -A REDSOCKS -d 224.0.0.0/4 -j RETURN
iptables -t nat -A REDSOCKS -d 240.0.0.0/4 -j RETURN
iptables -t nat -A REDSOCKS -p tcp -j REDIRECT --to-ports 10086

# No proxy by default. Proxy by matching process's group
iptables -t nat -A OUTPUT -p tcp -m owner --gid-owner socksproxy -j REDSOCKS

# Proxy by default.
# iptables -t nat -A OUTPUT -j REDSOCKS
# iptables -t nat -I REDSOCKS -m owner --uid-owner redsocks -j RETURN
# iptables -t nat -I REDSOCKS -m owner --uid-owner goagent -j RETURN
# iptables -t nat -I REDSOCKS -m owner --uid-owner dnscrypt -j RETURN
