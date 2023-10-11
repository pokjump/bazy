<?php
$polaczenie = new mysqli('localhost', 'root', '', 'egzamin1') or die('Błąd połączenia z bazą danych');
mysqli_set_charset($polaczenie, "utf8"); 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $wynik = 0;
    $query = "SELECT id, answer FROM pytania";
    $result = $polaczenie->query($query);
    if ($result) {
        while ($row = $result->fetch_assoc()) {
            $pytanie_id = $row['id'];
            $poprawna_odpowiedz = $row['answer'];

            if (isset($_POST['odpowiedz'][$pytanie_id]) && $_POST['odpowiedz'][$pytanie_id] === $poprawna_odpowiedz) {
                $wynik++;
            }
        }
    }
    echo '<p>Twój wynik to: ' . $wynik . ' / ' . $result->num_rows . '</p>';
} else {
    echo '<form method="post" action="">';
    $query = "SELECT id, tresc, odpa, odpb, odpc, odpd FROM pytania";
    $result = $polaczenie->query($query);
    if ($result) {
        while ($row = $result->fetch_assoc()) {
            echo '<p>' . $row['tresc'] . '</p>';
            echo '<label><input type="radio" name="odpowiedz[' . $row['id'] . ']" value="A"> A. ' . $row['odpa'] . '</label><br>';
            echo '<label><input type="radio" name="odpowiedz[' . $row['id'] . ']" value="B"> B. ' . $row['odpb'] . '</label><br>';
            echo '<label><input type="radio" name="odpowiedz[' . $row['id'] . ']" value="C"> C. ' . $row['odpc'] . '</label><br>';
            echo '<label><input type="radio" name="odpowiedz[' . $row['id'] . ']" value="D"> D. ' . $row['odpd'] . '</label><br>';
        }
        echo '<br><input type="submit" value="Sprawdź">';
        echo '</form>';
    }
}
$polaczenie->close();
?>
