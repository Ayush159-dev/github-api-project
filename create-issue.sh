#!/bin/bash






URL="https://api.github.com"

USERNAME=$username
TOKEN=$token


#TITLE=$3
#DESC=$4
echo "Enter issue title:"
read TITLE
echo "Enter issue description:"
read DESC

OWNER=$1
REPO=$2

function github_api_post {

	local endpoint="$1"

	local url="${URL}/${endpoint}"
	local data="{\"title\":\"${TITLE}\",\"body\":\"${DESC}\"}"

	echo "$url"


	curl -s -u "${USERNAME}:${TOKEN}" -X POST "$url" -d "$data" | jq -r '"Issue Created: \(.title)"'



}

function create_an_issue {


	local endpoint="repos/${OWNER}/${REPO}/issues"
       
	github_api_post "$endpoint"

}



echo "creating issue inside ${OWNER}/${REPO}:"
create_an_issue
