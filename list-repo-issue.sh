#!/bin/bash


#LIST-REPO-ISSUES


USERNAME="username"
TOKEN="token"


API_URL="https://api.github.com"

REPO_OWNER=$1
REPO_NAME=$2

function api_get {
	local endpoint="$1"
	local url="${API_URL}/${endpoint}"

	curl -s -u "${USERNAME}:${TOKEN}" "$url"
}


#list repository issues

function list_repository_issues {

	local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/issues"

	issues="$(api_get "$endpoint" | jq -r '.[].title')"

	if [[ -z "$issues" ]];  then 
	      echo "NO repo issues found for ${REPO_OWNER}/${REPO_NAME}"

	else
	      echo "REPO issues found for ${REPO_OWNER}/${REPO_NAME}"
	      echo "$issues"
	      
	     	      
	fi	       


}


echo "THE REPO ISSUES OF ${REPO_OWNER}/${REPO_NAME} are:"
list_repository_issues



