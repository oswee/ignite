#!/bin/sh

MYVAR=dzintars

read -p "Do you really want to delete current network connections and devices? (y/n)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # do dangerous stuff
echo "Hello ${MYVAR}"
fi

