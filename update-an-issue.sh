#!/bin/bash


set -e

URL="https://api.github.com"


USERNAME=$username
TOKEN=$token

owner=$1
repo=$2

echo "Enter the issue number:"
read issue_number

echo "Enter the issue state:"
read issue_state

url="repos/${owner}/${repo}/issues/${issue_number}"


function update_issue_state {

	local post_url="${URL}/${url}"
	local data="{\"state\":\"$issue_state\"}"
	echo "$post_url"
	curl -s -u "${USERNAME}:${TOKEN}" -X PATCH "$post_url" -d "$data" | jq -r '"issue is: \(.state)"'

}


echo "Your issue in ${owner}/${repo} is updating:"
update_issue_state

