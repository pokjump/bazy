<?php
$polaczenie = new mysqli ("localhost", "root", "", 'pracownicy') or die ('xd');
$wynik_zapytania = mysqli_query($polaczenie, 'SELECT imie, nazwisko, nazwa FROM pracownik join stanowiska on id_stanowisko=id_stanowiska');
echo '<ul>';
while ($rekord=mysqli_fetch_assoc($wynik_zapytania))
{
    echo '<li>'
    .$rekord['imie'].' '
    .$rekord['nazwisko'].' '
    .$rekord['nazwa'].'</li>';

}
echo '</ul>';
mysqli_close($polaczenie);

$polaczenie1 = new mysqli ("localhost", "root", "", 'biblioteka') or die ('xd');
$wynik = mysqli_query($polaczenie1, 'SELECT c.imie, c.nazwisko, c.nr_czytelnika, count(w.nr_czytelnika) AS liczba_ksiazek FROM czytelnicy c JOIN wypozyczenia w on c.nr_czytelnika=w.nr_czytelnika GROUP BY c.nr_czytelnika');
echo '<table>';
while ($rekord1 = mysqli_fetch_assoc($wynik)) {
    echo "<tr><td>";
    echo $rekord1['imie'];
    echo "</td><td>";
    echo $rekord1['nazwisko'];
    echo "</td><td>";
    echo $rekord1['nr_czytelnika'];
    echo "</td><td>";
    echo $rekord1['liczba_ksiazek'];
    echo "</td></tr>";
}
echo '</table>';
mysqli_close($polaczenie1);
?>
