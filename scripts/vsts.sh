#!/bin/bash

echo ":: running vsts script"
echo ":: current dir:"$PWD

echo  ":: running gitversion"
mono /usr/lib/GitVersion/tools/GitVersion.exe > GitVersion.json

echo ":: writing GitVersion to json variable"
json=$(<GitVersion.json)
echo $json

echo ":: reading keys from json file"
arr=( $(jq 'keys[]' GitVersion.json) )

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
	
	echo "Set Variable GitVersion_${key} Value: ${val}"

	echo "##vso[task.setvariable variable=GitVersion_${key};]${val}"
done

val=(  $(jq '.FullSemVer' GitVersion.json) )
val=${val#"\""}
val=${val%"\""}
echo "##vso[build.updatebuildnumber]${val}"