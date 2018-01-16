create user 'maxuser'@'%' identified by 'password';
grant SELECT on mysql.user to 'maxuser'@'%';
GRANT SELECT ON mysql.db TO 'maxuser'@'%';
GRANT SELECT ON mysql.tables_priv TO 'maxuser'@'%';
GRANT SHOW DATABASES ON *.* TO 'maxuser'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON *.* TO 'maxuser'@'%';
GRANT ALL on infinidb_vtable.* to 'maxuser'@'%';
