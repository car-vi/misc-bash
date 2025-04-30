#!/bin/bash
#set -x


today=$(date +"%Y%m%d-%H")
lastmailout=$(cat /tmp/ts01_lastmailsent)



ok="ok"
current_status=$(cat /tmp/ts01_status)

if [[ "$today" == "$lastmailout" ]];
then
#    echo "mail has been sent within the hour - exiting"
    exit 1
elif [[ "$ok" == "$current_status" ]];
then
#    echo "very good - no mail sent"
    exit 1

else
#    echo "mail sent"
    echo $today > /tmp/ts01_lastmailsent
    curl --url 'smtp://<RELAY>' --mail-from '<HOST@HOST.COM>' --mail-rcpt '<RCPT@HOST.COM>' --upload-file /tmp/ts01_email
fi
