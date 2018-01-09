docker network create mynet123

docker run --net mynet123 --name um1 -d -it --ip 172.18.0.11 columnstore /bin/bash
docker run --net mynet123 --name um2 -d -it --ip 172.18.0.12 columnstore /bin/bash
docker run --net mynet123 --name pm1 -d -it --ip 172.18.0.21 columnstore /bin/bash
docker run --net mynet123 --name pm2 -d -it --ip 172.18.0.22 columnstore /bin/bash

docker exec -it um1 /sbin/sshd
docker exec -it um2 /sbin/sshd
docker exec -it pm1 /sbin/sshd
docker exec -it pm2 /sbin/sshd

docker cp Columnstore.xml.rpmsave pm1:/usr/local/mariadb/columnstore/etc
docker exec -it pm1 /usr/local/mariadb/columnstore/bin/postConfigure -u

docker cp dwuser.sql um1:/root
docker cp maxuser.sql um1:/root

docker exec -it um1 mcsmysql < /root/dwuser.sql
docker exec -it um1 mcsmysql < /root/maxsql.sql
