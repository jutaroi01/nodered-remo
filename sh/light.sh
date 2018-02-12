#!/bin/bash

echo `date` "exec command $1" >> /path/to/log/light.log

TOKEN=$(cat /path/to/token.txt)

case $1 in
  on)
    # 全灯
    curl -X POST https://api.nature.global/1/signals/24ff57a4-xxxx-xxxx-xxxx-xxxxxxxxxxxx/send -H "Authorization: Bearer $TOKEN";;
  off)
    # 消灯
    curl -X POST https://api.nature.global/1/signals/31f3d863-xxxx-xxxx-xxxx-xxxxxxxxxxxx/send -H "Authorization: Bearer $TOKEN";;
  20)
    # 保安球
    curl -X POST https://api.nature.global/1/signals/96cd18d3-xxxx-xxxx-xxxx-xxxxxxxxxxxx/send -H "Authorization: Bearer $TOKEN";;
  10)
    # 暗く
    curl -X POST https://api.nature.global/1/signals/35da045b-xxxx-xxxx-xxxx-xxxxxxxxxxxx/send -H "Authorization: Bearer $TOKEN";;
  100)
    # 明るく
    curl -X POST https://api.nature.global/1/signals/3321286f-xxxx-xxxx-xxxx-xxxxxxxxxxxx/send -H "Authorization: Bearer $TOKEN";;
  *)
    echo `date` "unknown command $1" >> /path/to/log/light.log
esac

