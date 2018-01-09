create user 'maxuser'@'maxscale.mynet123' identified by 'password';
grant SELECT on mysql.user to 'maxuser'@'%';
GRANT SELECT ON mysql.db TO 'maxuser'@'%';
GRANT SELECT ON mysql.tables_priv TO '%';
GRANT SHOW DATABASES ON *.* TO 'maxuser'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON *.* TO 'maxuser'@'%';
GRANT REPLICATION SLAVE ON *.* TO 'maxuser'@'%';
