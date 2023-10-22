#!/bin/bash

# Get the current date and time
NOW=$(date +%Y-%m-%d_%H%M%S)

# Get the IP address
IP=$(ip addr show | grep "inet\b" | grep -v 127.0.0.1 | awk '{print $2}' | cut -d '/' -f 1)

# Get the DNS servers
DNS=$(cat /etc/resolv.conf | grep "nameserver" | awk '{print $2}')

# Get the open ports
PORTS=$(netstat -tuln | awk '{print $4}' | grep -E ':[0-9]+' | awk -F ':' '{print $2}' | sort -u)

# Create a file to store the network information
OUTPUT_FILE="/tmp/network_info_$NOW.txt"

# Write the network information to the file
echo "IP address: $IP" >> $OUTPUT_FILE
echo "DNS servers: $DNS" >> $OUTPUT_FILE
echo "Open ports: $PORTS" >> $OUTPUT_FILE

# Display the network information to the console
echo "IP address: $IP"
echo "DNS servers: $DNS"
echo "Open ports: $PORTS"

# Exit the script
exit 0
