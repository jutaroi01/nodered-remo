#!/bin/bash

echo `date` "exec command $1" >> /path/to/log/tv.log

TOKEN=$(cat /path/to/token.txt)

case $1 in
  on|off)
    curl -X POST https://api.nature.global/1/signals/2c9aa4b9-xxxx-xxxx-xxxx-xxxxxxxxxxxx/send -H "Authorization: Bearer $TOKEN";;
  11)
    # 1ch
    curl -X POST https://api.nature.global/1/signals/0ddd912a-xxxx-xxxx-xxxx-xxxxxxxxxxxx/send -H "Authorization: Bearer $TOKEN";;
  4)
    # 4ch
    curl -X POST https://api.nature.global/1/signals/8ab05d9a-xxxx-xxxx-xxxx-xxxxxxxxxxxx/send -H "Authorization: Bearer $TOKEN";;
  10)
    curl -X POST https://api.nature.global/1/signals/da9efa43-xxxx-xxxx-xxxx-xxxxxxxxxxxx/send -H "Authorization: Bearer $TOKEN"
    curl -X POST https://api.nature.global/1/signals/da9efa43-xxxx-xxxx-xxxx-xxxxxxxxxxxx/send -H "Authorization: Bearer $TOKEN"
    curl -X POST https://api.nature.global/1/signals/da9efa43-xxxx-xxxx-xxxx-xxxxxxxxxxxx/send -H "Authorization: Bearer $TOKEN";;
  100)
    curl -X POST https://api.nature.global/1/signals/85a0f17d-xxxx-xxxx-xxxx-xxxxxxxxxxxx/send -H "Authorization: Bearer $TOKEN"
    curl -X POST https://api.nature.global/1/signals/85a0f17d-xxxx-xxxx-xxxx-xxxxxxxxxxxx/send -H "Authorization: Bearer $TOKEN"
    curl -X POST https://api.nature.global/1/signals/85a0f17d-xxxx-xxxx-xxxx-xxxxxxxxxxxx/send -H "Authorization: Bearer $TOKEN";;
  *)
    echo `date` "unknown command $1" >> /path/to/log/tv.log
esac

