# mariadb_docker

go into each directory and build each docker image and name them the same name as the directory


cd columnstore
docker build . -t columnstore

cd maxscale
docker build . -t maxscale

cd mariadb
docker build . -t mariadb

cd cdcclient
docker build . -t cdcclient

cd maxcdc
docker build . -t maxcdc
