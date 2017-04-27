# What is GitVersion

GitVersion is a tool to help you achieve *Semantic Versioning* on your project.

* [GitVersion Project homepage](https://github.com/GitTools/GitVersion)


## show
Display the GitVersion Info

```
docker run --rm -v "$(PWD):/src" tboeker/gitversion git-version-show
```


## json
Writes the GitVersion Info to GitVersion.json file

```
docker run --rm -v "$(PWD):/src" tboeker/gitversion git-version-json
```

## bash 
Run bash and use GitVersion.exe

```
docker run --rm  -it -v "$(PWD):/src"  tboeker/gitversion bash
git-version /?
```

# Building and local test

```
#Build the Container:
docker build -t gitversion-work .
#Run the Container 
docker run --rm -v "$(PWD):/src" gitversion-work json
docker run --rm -v "$(PWD):/src" gitversion-work show
docker run --rm  -it -v "$(PWD):/src" gitversion-work bash

#Login to docker
docker login
docker tag gitversion-work tboeker/gitversion:latest
docker push tboeker/gitversion:latest

```