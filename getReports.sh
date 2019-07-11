#!/bin/sh

DOMAIN=https://circleci.com
VCS=github
USERNAME=YourUserName
PROJECT=YourProjectName
CIRCLE_TOKEN='YourCircleCIToken'

function mywget()
{
     wget -O ${2##*/} "$2?circle-token=$1"
}

export -f mywget

curl $DOMAIN/api/v1.1/project/$VCS/$USERNAME/$PROJECT/$1/artifacts?circle-token=$CIRCLE_TOKEN | grep -o 'https://[^"]*' > artifacts.txt

<artifacts.txt xargs -P4 -I {} bash -c 'mywget $CIRCLE_TOKEN "{}"'

find . -type f -name "*?circle-token=$CIRCLE_TOKEN" | while read f; do mv "$f" "${f%?circle-token=$CIRCLE_TOKEN}"; done

rm artifacts.txt
