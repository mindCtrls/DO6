#!/bin/bash

url=192.168.0.20
user=thk
tmp=/tmp
path=/usr/local/bin

whoami

scp -o StrictHostKeyChecking=no DO $user@$url:$tmp
ssh -o StrictHostKeyChecking=no -tt $user@$url \ "sudo --non-interactive /bin/mv /tmp/$1 /usr/local/bin/"

exit 0