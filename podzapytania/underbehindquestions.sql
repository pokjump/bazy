SELECT id, wartosc from zamowienia WHERE wartosc in (SELECT wartosc from zamowienia order by wartosc asc limit 1);
SELECT id, nazwa FROM towary WHERE id in (SELECT id FROM zamowienia WHERE wartosc = (SELECT wartosc FROM zamowienia ORDER BY wartosc ASC LIMIT 1));
SELECT nazwa, grupa FROM towary WHERE id IN (SELECT towar_id FROM zamowienia WHERE wartosc = (SELECT MAX(wartosc) FROM zamowienia));
SELECT nazwa, grupa FROM towary WHERE cena > (SELECT avg(cena) from towary);

SELECT count(*) from wlasciciel WHERE wlascicielnr in (SELECT wlascicielnr from nieruchomosc WHERE miasto="Bialystok");
SELECT count(*) from biuro WHERE biuronr in (SELECT biuronr from biuro WHERE miasto="Lomza"); 
SELECT count(*) from personel WHERE biuronr in (SELECT biuronr from biuro group by biuronr having count(*)>=3);
SELECT count(*) from nieruchomosc WHERE nieruchomoscnr in (SELECT nieruchomoscnr from wynajecie group by nieruchomoscnr having count(*)>2);
SELECT count(*) from personel WHERE personelnr in (SELECT personelnr from nieruchomosc group by personelnr having count(*)>3);
SELECT count(*) from klient WHERE klientnr in (SELECT klientnr from nieruchomosc group by klientnr having count(*)>=2);
SELECT avg(pensja), biuronr from personel group by biuronr;
SELECT count(personelnr), biuronr from personel WHERE datediff(curdate(), dataur) > 65 group by biuronr;
SELECT count(*) from wynajecie WHERE od_kiedy>='2004-10-01' AND od_kiedy<='2004-12-31';
SELECT count(*), klientnr from wynajecie WHERE od_kiedy LIKE '2004-03-%%' group by klientnr;
