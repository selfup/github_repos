#!/usr/bin/env bash

pages='1 2 3 4 5'

echo 'pulling all repos..'

for page in $pages
do
  curl -s https://api.github.com/users/selfup/repos?page=$page \
    | perl -ne 'print "$1\n" if (/"ssh_url": "([^"]+)/)' \
    | xargs -n 1 git clone
done

echo 'done!'

