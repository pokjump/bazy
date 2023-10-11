<?php
$polaczenie = new mysqli('localhost', 'root', '', 'forum') or die('Błąd połączenia z bazą danych');
mysqli_set_charset($polaczenie, "utf8"); 

$nick = $_POST['Nick'];
$hobby = $_POST['Hobby'];
$zawod = $_POST['zawod'];
$plec = $_POST['plec'];
$login = $_POST['login'];
$haslo = $_POST['haslo'];
$polityka = $_POST['polityka'];

$polecenie = "INSERT INTO uzytkownicy (nick, zainteresowania, zawod, plec) VALUES ('$nick', '$hobby', '$zawod', '$plec')";

$zapytanie = $polaczenie->query($polecenie);

if ($zapytanie === true) {
    $polecenie2 = "INSERT INTO konta (login, haslo) VALUES ('$login', '$haslo')";
    
    $zapytanie2 = $polaczenie->query($polecenie2);

    if ($zapytanie2 === true) {
        echo 'Rejestracja dla użytkownika: "' . $nick . '" przebiegła pomyślnie';
    } else {
        echo 'Wystąpił błąd podczas rejestracji';
    }
} else {
    echo 'Wystąpił błąd podczas rejestracji';
}

$polaczenie->close();
?>
