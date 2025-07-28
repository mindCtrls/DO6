#!/bin/bash

url=192.168.0.20
user=thk

whoami

if ! scp -o StrictHostKeyChecking=no DO "$user@$url:/tmp"; then
    echo -e "\e[31m SCP error\e[0m" >&2
    exit 1
fi

if ! ssh -o StrictHostKeyChecking=no -tt "$user@$url" "sudo --non-interactive /bin/mv /tmp/DO /usr/local/bin"; then
    echo -e "\e[31m SSH error\e[0m" >&2
    exit 1
fi

echo -e "\e[32m Job SUCCESS  ))\e[0m"
exit 0
