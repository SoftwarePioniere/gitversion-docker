docker build -t gitversion-work .
docker run --rm  -v "$(PWD):/src" -w "/src" gitversion-work bash