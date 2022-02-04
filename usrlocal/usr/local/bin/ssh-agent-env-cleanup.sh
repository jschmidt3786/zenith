#!/bin/sh
for e in $(find /usr/home/ -depth 3 -name "environment" |grep ".ssh/environment") ; do
  \rm -v "$e"
done

pkill ssh-agent

