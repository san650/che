#!/usr/bin/env bash

end=$(     printf '\033'[00m )
red=$(     printf '\033'[31m )
green=$(   printf '\033'[32m )
yellow=$(  printf '\033'[33m )

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

version=$(sed -n '/"ember-cli"/p' package.json | awk '{ print $2 }' | sed 's/[",]//g')
ln -snf ~/.che/$version/node_modules/ node_modules
ln -snf ~/.che/$version/bower_components/ bower_components

ember_cli_version=$(ember --version | grep ^version | awk '{ print $2 }')

message "It seems to be two."
echo
message "${yellow}Using ember-cli version ${green}$ember_cli_version"
message 'Done.'
