#!/bin/bash
DOMAIN="https://code.devops.fds.com/"
PRIVATE_TOKEN=glpat-dxTLbPK_WVFwrWo9kf6S
GROUP=2508
number_of_pages=$(curl -s --head "https://$DOMAIN/api/v4/groups/$GROUP/projects?private_token=$PRIVATE_TOKEN" | grep -i x-total-pages | awk '{print $2}' | tr -d '\r\n')
for page in $(seq 1 $number_of_pages); do
    curl -s "https://$DOMAIN/api/v4/groups/$GROUP/projects?private_token=$PRIVATE_TOKEN&page=$page" | jq -r '.[] | .ssh_url_to_repo' >> test2.txt
done
