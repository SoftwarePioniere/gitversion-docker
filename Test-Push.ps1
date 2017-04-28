docker build -t gitversion-work .
docker tag gitversion-work tboeker/gitversion:latest
docker push tboeker/gitversion:latest