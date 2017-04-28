docker build -t gitversion-work .
docker run --rm  -v "$(PWD):/src" gitversion-work