SELECT imie, nazwisko FROM czytelnicy UNION SELECT imie, nazwisko FROM pracownicy;
SELECT p.imie, p.nazwisko FROM pracownicy p JOIN czytelnicy c ON p.nazwisko = c.nazwisko;
SELECT distinct c.imie, c.nazwisko FROM czytelnicy c LEFT OUTER JOIN pracownicy p ON c.nazwisko = p.nazwisko WHERE p.nazwisko IS NULL;

SELECT nazwisko from pracownicy INTERSECT select nazwisko from czytelnicy;
SELECT nazwisko from czytelnicy EXCEPT SELECT nazwisko from pracownicy;