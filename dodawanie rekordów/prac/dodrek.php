<?php
$polaczenie = new mysqli('localhost', 'root', '', 'pracownicy') or die('Błąd połączenia z bazą danych');
mysqli_set_charset($polaczenie, "utf8"); //zmiana znaków na utf-8

$imie = $_POST['imie'];
$nazwisko = $_POST['nazwisko'];
$stanowisko = $_POST['id_stanowisko'];

$polecenie = "INSERT INTO pracownik (id_pracownik, imie, nazwisko, id_stanowiska) VALUES (12, '$imie', '$nazwisko', '$stanowisko')";

$zapytanie = $polaczenie->query($polecenie);

if ($zapytanie == true) {
    echo 'Rekord został dodany';
} else {
    echo 'Wystąpił błąd podczas dodania rekordu';
}

$polaczenie->close();
?>
