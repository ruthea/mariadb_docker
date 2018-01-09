create user 'dwuser'@'%' identified by 'password';
grant SELECT on mysql.user to 'dwuser'@'%';
GRANT SELECT ON mysql.db TO 'dwuser'@'%';
GRANT SELECT ON mysql.tables_priv TO 'dwuser'@'%';
GRANT SHOW DATABASES ON *.* TO 'dwuser'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON *.* TO 'dwuser'@'%';
GRANT ALL ON infinidb_vtable.* TO 'dwuser'@'%';
