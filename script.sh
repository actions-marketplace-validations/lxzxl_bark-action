#!/bin/bash

red='\e[91m'
green='\e[92m'
cyan='\e[96m'
none='\e[0m'

if [[ -z $INPUT_KEY ]]; then
    echo -e "${red}ERROR: KEY is a required parameter${none}"
    exit -1
fi

request_url=$INPUT_HOST/$INPUT_KEY/
request_body="title=${INPUT_TITLE}&body=${INPUT_BODY}&sound=${INPUT_SOUND}"

if [[ -z $INPUT_ISARCHIVE ]]; then
    request_body="${request_body}&isArchive=${INPUT_ISARCHIVE}"
fi

if [[ -z $INPUT_URL ]]; then
    request_body="${request_body}&url=${INPUT_URL}"
fi

if [[ -z $INPUT_AUTOMATICALLYCOPY ]]; then
    request_body="${request_body}&automaticallyCopy=${INPUT_AUTOMATICALLYCOPY}"
fi
if [[ -z $INPUT_COPY ]]; then
    request_body="${request_body}&copy=${INPUT_COPY}"
fi

echo -e "${cyan}Request host${none}: ${request_url}"
echo -e "${cyan}Request body${none}:\n${request_body//&/\\n}"

res=`curl -s -X POST -d "${request_body}" ${request_url}`
echo -e "${green}Result${none}: ${res}"
