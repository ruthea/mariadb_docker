docker build . -t maxscale
docker network create --subnet=172.18.0.0/16 mynet123

docker run --net mynet123 --name maxscale -d -it --ip 172.18.0.51 maxscale /bin/bash
docker cp maxscale.cnf maxscale:/etc

echo "Starting maxscale..."
docker exec -i maxscale maxscale &

echo "Waiting a moment..."
sleep 5

echo "Setting slave...."
docker exec -i maxscale maxadmin set server dbserv1 master
docker exec -i maxscale maxadmin set server dbserv2 slave
