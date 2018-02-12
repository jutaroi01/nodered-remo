#!/bin/bash

echo `date` "exec command $1" >> /path/to/log/aircon.log

ID="6c10f1a1-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
TOKEN=$(cat /path/to/token.txt)

case $1 in
  on)
    curl -X POST https://api.nature.global/1/appliances/$ID/aircon_settings -H "Authorization: Bearer $TOKEN" -d "button=";;
  off)
    curl -X POST https://api.nature.global/1/appliances/$ID/aircon_settings -H "Authorization: Bearer $TOKEN" -d "button=power-off";;
  up)
    temp=`curl https://api.nature.global/1/appliances -H "Authorization: Bearer $TOKEN" | jq -r --arg id $ID '.[] | select(.id == $id) | .settings.temp'`
    temp=$((temp + 1))
    curl -X POST https://api.nature.global/1/appliances/$ID/aircon_settings -H "Authorization: Bearer $TOKEN" -d "temperature=$temp";;
  down)
    temp=`curl https://api.nature.global/1/appliances -H "Authorization: Bearer $TOKEN" | jq -r --arg id $ID '.[] | select(.id == $id) | .settings.temp'`
    temp=$((temp - 1))
    curl -X POST https://api.nature.global/1/appliances/$ID/aircon_settings -H "Authorization: Bearer $TOKEN" -d "temperature=$temp";;
  [12][0-9])
    curl -X POST https://api.nature.global/1/appliances/$ID/aircon_settings -H "Authorization: Bearer $TOKEN" -d "temperature=$1";;
  *)
    echo `date` "unknown command $1" >> /path/to/log/aircon.log
esac

