#!/usr/bin/env bash

if [[ -z $1 ]]; then
  echo "Pattern parameter required"
else
  scp -v cabanaboy:/home/debian-guest-utility/coconuts/$1 ~/coconuts/
fi
