create user 'maxuser'@'maxscale.mynet123' identified by 'password';
grant SELECT on mysql.user to 'maxuser'@'maxscale.mynet123';
GRANT SELECT ON mysql.db TO 'maxuser'@'maxscale.mynet123';
GRANT SELECT ON mysql.tables_priv TO 'maxuser'@'maxscale.mynet123';
GRANT SHOW DATABASES ON *.* TO 'maxuser'@'maxscale.mynet123';
GRANT SELECT, INSERT, UPDATE, DELETE ON *.* TO 'maxuser'@'maxscale.mynet123';
