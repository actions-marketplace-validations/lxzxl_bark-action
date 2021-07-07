#!/bin/bash

red='\e[91m'
green='\e[92m'
cyan='\e[96m'
none='\e[0m'

if [[ -z $INPUT_KEY ]]; then
    echo -e "${red}ERROR: KEY is a required parameter${none}"
    exit -1
fi

request_url=$INPUT_HOST/push

json_body_tpl='{
  "device_key":"%s",
  "title":"%s",
  "body":"%s",
  "ext_params": {
    "url": "%s"
  },
  "category":"%s",
  "sound":"%s"
}'

json_body=`printf $json_body_tpl $INPUT_KEY $INPUT_TITLE $INPUT_BODY $INPUT_URL $INPUT_CATEGORY $INPUT_SOUND`


echo -e "${cyan}POST URL${none}: "$request_url"
echo -e "${cyan}Body${none}:\n${json_body}"

res=`curl -X "POST" "$request_url" \
-H 'Content-Type: application/json; charset=utf-8' \
-d "$json_body"`

echo -e "${green}Result${none}: ${res}"
