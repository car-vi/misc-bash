#!/bin/bash


ok="ok"

rslt1=$(tail -n3 /tmp/ts01_results | head -n1)
rslt2=$(tail -n3 /tmp/ts01_results | head -n2 | tail -n1)
rslt3=$(tail -n3 /tmp/ts01_results | tail -n1)

#echo $rslt1
#echo $rslt2
#echo $rslt3

#curl --show-error --fail --connect-timeout 5 http://ts01-b.cloudsink.net >> /tmp/foo && echo ' ' >> /tmp/foo

webtest=$(curl --connect-timeout 3 https://ts01-b.cloudsink.net > /tmp/ts01_webtest)

echo $webtest

if [ "$ok" == "$(cat /tmp/ts01_webtest)" ];
then
   echo $ok >> /tmp/ts01_results
else
   echo 'bad' >> /tmp/ts01_results
fi



#if [[ "$last3" == "$test" ]];
if [[ "$rslt1" == "$ok" && "$rslt2" == "$ok" && "$rslt3" == "$ok" ]];
then
   echo 'ok' > /tmp/ts01_status
else
   echo 'bad' > /tmp/ts01_status

fi
