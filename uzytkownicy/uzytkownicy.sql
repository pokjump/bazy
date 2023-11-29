use mysql;

select * from user where authentication_string like "";

create user user1, user2, user3, admin2;
GRANT USAGE ON pracownicy.* to user1, user2;
GRANT ALL privileges on pracownicy to user3;
GRANT ALL privileges on *.* to admin2;

create database baza1;
create database baza2;

GRANT ALL privileges on baza1 to user1;
GRANT ALL privileges on baza2 to user2;

set password for user1='xd';
set password for user2='xdd';

REVOKE ALL PRIVILEGES, GRANT OPTION FROM admin2;

CREATE TABLE tab1 (xp varchar(5));
CREATE TABLE tab2 (xp varchar(5));
CREATE TABLE tab3 (xp varchar(5));
CREATE TABLE tab4 (xp varchar(5));
GRANT SELECT, INSERT, UPDATE, DELETE ON tab3 TO user1;

GRANT SELECT, INSERT, UPDATE, DELETE ON baza2.tab3 TO user1;
GRANT SELECT (id_tab3) ON baza2.tab3 TO user1;

GRANT ALL privileges on baza1.* to user2;

show grants for user1;
show grants for user2;
show grants for user3;
show grants for admin2;

select * from user;














