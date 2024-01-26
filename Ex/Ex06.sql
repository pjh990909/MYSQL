create user 'webdb'@'%' identified by '1234';

alter user 'webdb'@'%' identified by 'webdb';

grant all privileges on web_db.* to 'webdb'@'%';

drop user 'webdb'@'%';

flush privileges;

create database web_db
       default character set utf8mb4
       collate utf8mb4_general_ci
       default encryption='n'
;

show databases;

drop database web_db;

show databases;


create user 'book_db'@'%' identified by '1234';

grant all privileges on book_db.* to 'book_db'@'%';

flush privileges;

create database book_db
	   default character set utf8mb4
       collate utf8mb4_general_ci
       default encryption='n'
;

show databases;

drop user 'book_db'@'%';

create user 'book'@'%' identified by '1234';

grant all privileges on book_db.* to 'book'@'%';

flush privileges;

alter user 'book'@'%' identified by 'book';



