#!/bin/bash

export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
stop.bash
sleep 4
trashbase.bash
cd /Applications
git clone https://github.com/CyberGhost84/PlexConnect.git
mkdir -p /Applications/PlexConnect/update/OSX
cd __HOME__/Library/Application\ Support/OpenPlex
# fetch changes, git stores them in FETCH_HEAD
git fetch
# check for remote changes in origin repository
newUpdatesAvailable=`git diff HEAD FETCH_HEAD`
if [ "$newUpdatesAvailable" != "" ]
then
git pull
cd /Applications/PlexConnect/update/OSX
git reset --hard
else
echo "no updates available"
fi
echo 'CyberGhost84 cloned to /Applications/PlexConnect'
chmod 777 /Applications/PlexConnect/Update/OSX
cp -R __HOME__/Library/Application\ Support/OpenPlex/update/OSX/* /Applications/PlexConnect/update/OSX