docker build . -t mariadb

docker run --net mynet123 --name mariadb -d -it --ip 172.18.0.31 mariadb /bin/bash
