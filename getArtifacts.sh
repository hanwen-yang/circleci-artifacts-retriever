#!/bin/sh

DOMAIN=https://circleci.com
VCS=github
USERNAME=YourUserName
PROJECT=YourProjectName
export CIRCLE_TOKEN='YourCircleCIToken'

function mycurl()
{
     curl -o ${2##*/circleci/project/} "$2?circle-token=$1" --create-dirs
}

export -f mycurl

curl $DOMAIN/api/v1.1/project/$VCS/$USERNAME/$PROJECT/$1/artifacts?circle-token=$CIRCLE_TOKEN | grep -o 'https://[^"]*' > artifacts.txt

<artifacts.txt xargs -P4 -I {} bash -c 'mycurl $CIRCLE_TOKEN "{}"'

rm artifacts.txt
