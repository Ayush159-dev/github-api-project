#!/bin/bash


Username="$user"
Token="$githubtoken"

API_URL="https://api.github.com"



endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"
url="${API_URL}/${endpoint}"

REPO_OWNER=$1
REPO_NAME=$2


function list_users_with_read_access { 
	

	collaborators="$(curl -s -u "${Username}:${Token}" "$url" "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

	if [[ -z "$collaborators" ]]; then
		echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."

	else
		echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}"
		echo "$collaborators"

		fi

}


echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access












