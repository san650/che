#!/usr/bin/env bash

end=$(     printf '\033'[00m )
red=$(     printf '\033'[31m )
green=$(   printf '\033'[32m )
yellow=$(  printf '\033'[33m )

version=$(sed -n '/"ember-cli"/p' package.json | awk '{ print $2 }' | sed 's/[",]//g')

if [[ -z $version ]]
then
  echo "Booom!"
  exit 1
fi

cmd=$1
path=~/.che/$version

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

case $cmd in
  "")
    # Support che without command (implicit command)
  ;;
  install)
    message "Installing.."
    mkdir -p $path
    cp package.json $path/
    cp bower.json $path/
    (
      cd $path
      npm install --silent
      bower install --silent
    )
  ;;
  *)
    echo $red"Invalid command"$end
    exit 1
  ;;
esac

ln -snf $path/node_modules/ node_modules
ln -snf $path/bower_components/ bower_components

ember_cli_version=$(ember --version | grep ^version | awk '{ print $2 }')

echo
message "${yellow}Using ember-cli version ${green}$ember_cli_version"

message 'Done.'
