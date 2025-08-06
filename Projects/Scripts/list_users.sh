#!/bin/bash

##############################################
# Author : Ravikant Jadhav
# Date   : 03/06/2025
# Purpose: List users with read access to a GitHub repo
##############################################

# GitHub API URL
API_URL="https://api.github.com"

# Credentials from environment variables
USERNAME="${GITHUB_USERNAME}"
TOKEN="${GITHUB_TOKEN}"

# User and Repository information from command-line arguments
REPO_OWNER=$1
REPO_NAME=$2

# Credential & input check
if [[ -z "$USERNAME" || -z "$TOKEN" || -z "$REPO_OWNER" || -z "$REPO_NAME" ]]; then
    echo "Error: Missing credentials or repo details."
    echo "Usage: export GITHUB_USERNAME=<your_username>"
    echo "       export GITHUB_TOKEN=<your_token>"
    echo "       ./list_users.sh <repo_owner> <repo_name>"
    exit 1
fi

# Function to make a GET request to the GitHub API
github_api_get() {
    local endpoint="$1"
    curl -s -u "${USERNAME}:${TOKEN}" "${API_URL}/${endpoint}"
}

# Function to list users with read access to the repository
list_users_with_read_access() {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"
    local response
    response="$(github_api_get "$endpoint")"

    # Check if response is an error
    if echo "$response" | jq -e '.message' &>/dev/null; then
        echo "GitHub API error: $(echo "$response" | jq -r '.message')"
        exit 1
    fi

    # Extract users with read access
    local collaborators
    collaborators="$(echo "$response" | jq -r '.[] | select(.permissions.pull == true) | .login')"

    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}

# Main script execution
echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access

