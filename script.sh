#!/bin/bash

red='\e[91m'
green='\e[92m'
cyan='\e[96m'
none='\e[0m'

if [[ -z $INPUT_KEY ]]; then
    echo -e "${red}ERROR: KEY is a required parameter${none}"
    exit -1
fi

res=`curl -X "POST" "https://bark.etcd.run/push" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{
  "device_key": "${INPUT_KEY}",
  "title": "${INPUT_TITLE}",
  "body": "${INPUT_BODY}",
  "ext_params": {
    "url": "${INPUT_URL}"
  },
  "category": "${INPUT_CATEGORY}",
  "sound": "${INPUT_SOUND}"
}'`

echo -e "${green}Result${none}: ${res}"
