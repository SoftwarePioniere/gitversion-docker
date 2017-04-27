#!/bin/bash
echo ":: Test if GitVersion.yml file exist in Repository"
test -f /src/GitVersion.yml
echo ":: Result:" 
echo $?

if [ $? -eq 0 ]
then
	echo ":: GitVersion.yml file doesn't exist in Repository"
	echo ":: copy yml file to folder"
	cp /usr/lib/GitVersion.yml /src/GitVersion.yml	
 fi

echo  ":: run gitversion"
exec mono /usr/lib/GitVersion/tools/GitVersion.exe "$@"