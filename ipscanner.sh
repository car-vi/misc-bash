#!/bin/bash

IPs=$(arp-scan --localnet --numeric --quiet --ignoredups | grep -E '([a-f0-9]{2}:){5}[a-f0-9]{2}' | awk '{print $1}')

for i in $IPs ; do


	D=$(nslookup "$i" | grep -v nameserver  | cut -f 2 | grep name | cut -f 2 -d "=" | sed 's/ //' | cut -f1 -d ".")
	echo "$i" "-" "$D"

done



