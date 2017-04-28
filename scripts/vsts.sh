#!/bin/bash

function jsonval {
    temp=`echo $json | sed 's/\\\\\//\//g' | sed 's/[{}]//g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}' | sed 's/\"\:\"/\|/g' | sed 's/[\,]/ /g' | sed 's/\"//g' | grep -w $prop`
    echo ${temp##*|}
}
echo ":: running vsts script"
echo ":: current dir:"$PWD
ls -a

#echo ":: changing dir to /src"
#cd /src
#ls -a

echo  ":: running gitversion"
mono /usr/lib/GitVersion/tools/GitVersion.exe > GitVersion.json

echo ":: writing GitVersion to json variable"
json=$(<GitVersion.json)
echo $json

echo ":: reading keys from json file"
arr=( $(jq 'keys[]' GitVersion.json) )
#printf "%s\n" ${arr[@]}

echo ":: iterating keys"
for i in "${arr[@]}"
do
	key=${i#"\""}
	key=${key%"\""}
	echo ":: key:" ${key}
	
	val=( $(jq "."${key} GitVersion.json) )
	val=${val#"\""}
	val=${val%"\""}
	echo ":: value:" ${val}
	
	echo "##vso[task.setvariable variable=GitVersion.${key};]${val}"
done

fullSemVer=(  $(jq '.FullSemVer' GitVersion.json) )
echo "##vso[build.updatebuildnumber]$fullSemVer"