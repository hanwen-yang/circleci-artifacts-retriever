#!/bin/sh

DOMAIN=https://circleci.com
VCS=github
USERNAME=YourUserName
PROJECT=YourProjectName
CIRCLE_TOKEN='YourCircleCIToken'

curl $DOMAIN/api/v1.1/project/$VCS/$USERNAME/$PROJECT/$1/artifacts?circle-token=$CIRCLE_TOKEN | grep -o 'https://[^"]*' > artifacts.txt

<artifacts.txt xargs -P4 -I % wget %?circle-token=$CIRCLE_TOKEN

find . -type f -name '*?circle-token=$CIRCLE_TOKEN' | while read f; do mv "$f" "${f%?circle-token=$CIRCLE_TOKEN}"; done

rm artifacts.txt
