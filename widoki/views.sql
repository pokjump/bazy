create view czytelnicy_raport (nr_czytelnika, imie, nazwisko, liczba_wypozyczen) as
select c.nr_czytelnika, c.imie, c.nazwisko, count(w.nr_czytelnika) 
from czytelnicy c join wypozyczenia w on c.nr_czytelnika=w.nr_czytelnika group by c.nr_czytelnika;

select * from czytelnicy_raport where liczba_wypozyczen>1;

create view ksiazki_raport (sygnatura, tytul, id_dzial, liczba_wypozyczen) as
select k.sygnatura, k.tytul, k.id_dzial, count(w.sygnatura) 
from ksiazki k join wypozyczenia w on k.sygnatura=w.sygnatura group by k.sygnatura;

select tytul from ksiazki_raport where liczba_wypozyczen = (select max(liczba_wypozyczen) from ksiazki_raport);
select d.nazwa, sum(k.liczba_wypozyczen) as liczba_wypozyczen from ksiazki_raport k join dzialy d on k.id_dzial=d.id_dzial group by d.nazwa;

create view pracownik_raport (id_pracownika, imie, nazwisko, liczba_wypozyczen) as
select p.id_pracownika, p.imie, p.nazwisko, count(w.id_pracownika) 
from pracownicy p join wypozyczenia w on p.Id_pracownika=w.Id_pracownika group by p.id_pracownika;

select imie, nazwisko from pracownik_raport where liczba_wypozyczen > (SELECT avg(liczba_wypozyczen) from pracownik_raport);