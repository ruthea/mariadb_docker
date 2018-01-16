docker build . -t columnstore
docker network create --subnet=172.18.0.0/16 mynet123

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


echo "Waiting 1 Minute..."
sleep 60

docker exec -it um1 /usr/local/mariadb/columnstore/bin/mcsadmin startsystem

docker cp dwuser.sql um1:/root
docker cp maxuser.sql um1:/root
docker exec -it um1 chown root:root /root/dwuser.sql
docker exec -it um1 chown root:root /root/maxuser.sql
docker exec -it um1 sh -c '/usr/local/mariadb/columnstore/mysql/bin/mysql --defaults-extra-file=/usr/local/mariadb/columnstore/mysql/my.cnf -u root < /root/dwuser.sql'
docker exec -it um1 sh -c '/usr/local/mariadb/columnstore/mysql/bin/mysql --defaults-extra-file=/usr/local/mariadb/columnstore/mysql/my.cnf -u root < /root/maxuser.sql'


#### For some reason replication isn't working, this should be able to be deleted
docker cp dwuser.sql um2:/root
docker cp maxuser.sql um2:/root
docker exec -it um2 chown root:root /root/dwuser.sql
docker exec -it um2 chown root:root /root/maxuser.sql
docker exec -it um2 sh -c '/usr/local/mariadb/columnstore/mysql/bin/mysql --defaults-extra-file=/usr/local/mariadb/columnstore/mysql/my.cnf -u root < /root/dwuser.sql'
docker exec -it um2 sh -c '/usr/local/mariadb/columnstore/mysql/bin/mysql --defaults-extra-file=/usr/local/mariadb/columnstore/mysql/my.cnf -u root < /root/maxuser.sql'
