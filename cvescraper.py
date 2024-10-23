#!/usr/bin/bash

while read -r cve
    do
        curl https://access.redhat.com/security/cve/$cve > $cve
        date=$(grep -A1 'Public Date' $cve |grep -Eo '([0-9]{4})-([0-9]{2})-([0-9]{2})')
        grep bugzilla  $cve | sed -e 's/<a href="//g' -e 's/">.*//g' > $cve
        mv $cve $cve.$date
done < foobar
