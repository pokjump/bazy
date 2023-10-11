<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Formularz dodawania pracownika</title>
</head>
<body>
    <form method="POST" action="dodrek.php">
        <b>Dane pracownika</b><br>
        Imię: <br><input type="text" name="imie"><br>
        Nazwisko: <br><input type="text" name="nazwisko"><br>
        Stanowisko: <br>
        <select name="id_stanowisko">
            <?php
            $polaczenie = new mysqli('localhost', 'root', '', 'pracownicy') or die('Błąd połączenia z bazą danych');
            $query = "SELECT id_stanowisko, Nazwa FROM stanowiska";
            $result = $polaczenie->query($query);

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "<option value='" . $row['id_stanowisko'] . "'>" . $row['Nazwa'] . "</option>";
                }
            } 
            $polaczenie->close();
            ?>
        </select><br><br>
        <input type="reset" value="WYCZYŚĆ">
        <input type="submit" value="REJESTRUJ"><br>
    </form>
</body>
</html>
