#!/usr/bin/env bash

end=$(     printf '\033'[00m )
red=$(     printf '\033'[31m )
green=$(   printf '\033'[32m )
yellow=$(  printf '\033'[33m )

npm_bin=$(npm bin)
echo $red'
          _____                    _____                    _____
         /\    \                  /\    \                  /\    \
        /::\    \                /::\____\                /::\    \
       /::::\    \              /:::/    /               /::::\    \
      /::::::\    \            /:::/    /               /::::::\    \
     /:::/\:::\    \          /:::/    /               /:::/\:::\    \
    /:::/  \:::\    \        /:::/____/               /:::/__\:::\    \
   /:::/    \:::\    \      /::::\    \              /::::\   \:::\    \
  /:::/    / \:::\    \    /::::::\    \   _____    /::::::\   \:::\    \
 /:::/    /   \:::\    \  /:::/\:::\    \ /\    \  /:::/\:::\   \:::\    \
/:::/____/     \:::\____\/:::/  \:::\    /::\____\/:::/__\:::\   \:::\____\
\:::\    \      \::/    /\::/    \:::\  /:::/    /\:::\   \:::\   \::/    /
 \:::\    \      \/____/  \/____/ \:::\/:::/    /  \:::\   \:::\   \/____/
  \:::\    \                       \::::::/    /    \:::\   \:::\    \
   \:::\    \                       \::::/    /      \:::\   \:::\____\
    \:::\    \                      /:::/    /        \:::\   \::/    /
     \:::\    \                    /:::/    /          \:::\   \/____/
      \:::\    \                  /:::/    /            \:::\    \
       \:::\____\                /:::/    /              \:::\____\
        \::/    /                \::/    /                \::/    /
         \/____/                  \/____/                  \/____/

'$end

function message
{
  echo "$green$1$end"
}

message 'Calculating the largest prime number divisible by two...'

npm cache clean --silent
npm install --no-spin --silent
bower cache clean --silent
bower install --silent

export PATH="$npm_bin:$PATH"

ember_cli_version=$(ember --version | grep ^version | awk '{ print $2 }')

message "It seems to be two."
echo
message "${yellow}Using ember-cli version ${green}$ember_cli_version"
message 'Done.'
