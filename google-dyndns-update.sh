#!/bin/bash

IP=$(curl -s "https://domains.google.com/checkip")

curl -s  https://USERNAME:PASSWORD@domains.google.com/nic/update?hostname=SUB.DOMAIN.COM&myip=${IP}

sleep 5

echo -ne '\n'
