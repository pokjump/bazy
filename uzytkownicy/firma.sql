CREATE DATABASE firma;

CREATE TABLE pracownicy (id_pracownika INT primary key, 
						 nazwisko varchar(30),
                         imie varchar(20));
CREATE TABLE place (id_pracownika INT,
					pensja DECIMAL(10, 2),
                    dodatki decimal(10, 2),
                    FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika));
CREATE TABLE magazyn (id_towaru INT primary key,
					  nazwa varchar(100),
                      cena decimal(10, 2),
                      liczba_sztuk INT);
                      
create user kadrowa, ksiegowa, magazynier, informatyk, prezes;

GRANT ALL PRIVILEGES on pracownicy to kadrowa;
GRANT SELECT on place to kadrowa;
GRANT USAGE on magazyn to kadrowa;
GRANT SELECT on pracownicy to ksiegowa;
GRANT ALL PRIVILEGES on place to ksiegowa;
GRANT SELECT on magazyn to ksiegowa;
GRANT USAGE on pracownicy to magazynier;
GRANT USAGE on place to magazynier;
GRANT ALL PRIVILEGES on magazyn to magazynier;
GRANT ALL PRIVILEGES on pracownicy to informatyk with grant option;
GRANT ALL PRIVILEGES on place to informatyk with grant option;
GRANT ALL PRIVILEGES on magazyn to informatyk with grant option;
GRANT SELECT on pracownicy to prezes;
GRANT SELECT on place to prezes;
GRANT SELECT on magazyn to prezes;



