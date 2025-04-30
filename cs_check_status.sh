#!/bin/bash

ok="ok"

rslt1=$(tail -n3 /tmp/ts01_results | head -n1)
rslt2=$(tail -n3 /tmp/ts01_results | head -n2 | tail -n1)
rslt3=$(tail -n3 /tmp/ts01_results | tail -n1)


webtest=$(curl --connect-timeout 3 -sf -x <RELAY_IP>:3128 https://ts01-b.cloudsink.net > /tmp/ts01_webtest)

echo $webtest

if [ "$ok" == "$(cat /tmp/ts01_webtest)" ];
then
   echo $ok >> /tmp/ts01_results
else
   echo 'bad' >> /tmp/ts01_results
fi

if [[ "$rslt1" == "$ok" && "$rslt2" == "$ok" && "$rslt3" == "$ok" ]];
then
   echo 'ok' > /tmp/ts01_status
else
   echo 'bad' > /tmp/ts01_status

fi

tail -n 10 /tmp/ts01_results > /tmp/ts01_results.tmp
mv /tmp/ts01_results.tmp /tmp/ts01_results
