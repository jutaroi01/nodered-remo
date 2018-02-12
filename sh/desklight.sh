#!/bin/bash

echo `date` "exec command $1" >> /path/to/log/desklight.log

TOKEN=$(cat /path/to/token.txt)

case $1 in
  on)
    curl -X POST https://api.nature.global/1/signals/5320d922-xxxx-xxxx-xxxx-xxxxxxxxxxxx/send -H "Authorization: Bearer $TOKEN";;
  off)
    curl -X POST https://api.nature.global/1/signals/feb4694f-xxxx-xxxx-xxxx-xxxxxxxxxxxx/send -H "Authorization: Bearer $TOKEN";;
  *)
    echo "unknown command $1" >> /path/to/log/desklight.log
esac

