SELECT sygnatura, tytul, count(data_wypozyczenia) from ksiazki left outer JOIN wypozyczenia using(sygnatura) group by sygnatura;

SELECT count(c.nr_czytelnika) from czytelnicy c left join wypozyczenia w ON c.Nr_czytelnika = w.Nr_czytelnika where w.nr_czytelnika is null;

SELECT sygnatura, tytul from ksiazki left outer join wypozyczenia using (sygnatura) group by sygnatura having count(data_wypozyczenia)>=5;

SELECT id_dzial, nazwa, count(tytul) from dzialy left outer JOIN ksiazki using(id_dzial) WHERE nazwa="Informatyka" group by id_dzial UNION 
SELECT id_dzial, nazwa, count(tytul) from dzialy left outer JOIN ksiazki using(id_dzial) WHERE nazwa="Literatura" group by id_dzial;

SELECT nazwa, count(p.id_pracownika), miasto from stanowiska s left join pracownicy p on s.Id_stanowisko=p.Id_stanowisko WHERE miasto='Lublin' and wynagrodzenie>2000 group by nazwa;

SELECT S.Nazwa, COUNT(W.Nr_transakcji) FROM Pracownicy P INNER JOIN Stanowiska S ON P.Id_stanowisko = S.Id_stanowisko LEFT JOIN Wypozyczenia W ON P.Id_pracownika = W.Id_pracownika GROUP BY S.Nazwa;

SELECT k.tytul, w.id_pracownika FROM ksiazki k LEFT JOIN wypozyczenia w on k.sygnatura=w.sygnatura WHERE w.nr_czytelnika = 11 and (w.id_pracownika=3 or w.Id_pracownika = 13);

select distinct c.imie, c.nazwisko FROM czytelnicy c LEFT join wypozyczenia w on c.nr_czytelnika = w.nr_czytelnika WHERE c.funkcja = "S" and w.data_zwrotu IS null order by c.nazwisko asc;

select distinct k.tytul from ksiazki k left join wypozyczenia w on k.sygnatura=w.sygnatura WHERE Data_wypozyczenia IS NULL;

SELECT count(nazwisko) as "Liczba czytelników" from czytelnicy WHERE nazwisko LIKE "M%" or nazwisko LIKE "S%";

SELECT concat(p.imie, " ", p.nazwisko, " ID: ", p.id_pracownika) AS dane from pracownicy p left join wypozyczenia w on p.id_pracownika=w.Id_pracownika WHERE W.id_pracownika IS NULL;

SELECT count(sygnatura) from wypozyczenia WHERE sygnatura is null;

SELECT w.data_wypozyczenia, c.nazwisko from wypozyczenia w left join czytelnicy c on w.nr_czytelnika=c.Nr_czytelnika WHERE w.Data_wypozyczenia between '2009-02-09' AND '2009-05-05';

SELECT c.imie, c.nazwisko from czytelnicy c left join wypozyczenia w on c.nr_czytelnika=w.Nr_czytelnika WHERE w.nr_czytelnika is null;
