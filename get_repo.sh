#!/bin/bash
GL_DOMAIN="https://code.devops.fds.com/"
GL_TOKEN="glpat-dxTLbPK_WVFwrWo9kf6S"
echo "" > gitlab_projects_urls.txt
for ((i=1; ; i+=1)); do
    contents=$(curl "$GL_DOMAIN/api/v4/projects?private_token=$GL_TOKEN&per_page=100&page=$i")
    if jq -e '. | length == 0' >/dev/null; then 
       break
    fi <<< "$contents"
    echo "$contents" | jq -r '.[].ssh_url_to_repo' >> gitlab_projects_urls.txt
done
