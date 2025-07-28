#!/bin/bash

url=192.168.0.20
user=thk
tmp=/tmp
path=/usr/local/bin

if ! scp -o StrictHostKeyChecking=no -o ConnectTimeout=10 "$file" "$user@$url:$tmp"; then
    echo -e "\e[31m SCP error\e[0m" >&2
    exit 1
fi

if ! ssh -o StrictHostKeyChecking=no -o ConnectTimeout=10 -tt "$user@$url" \
    "sudo --non-interactive /bin/mv -v '$tmp/$file' '$path/'"; then
    echo -e "\e[31m SSH error\e[0m" >&2
    exit 1
fi

echo -e "\e[32m Job SUCCESS  ))\e[0m"
exit 0

exit 0