<!DOCTYPE html>
<html lang="it">
  <head>
    <meta charset="utf-8">
    <title>ASSEGNA</title>
    <link rel="stylesheet" type="text/css" href="grafica.css">
    <link rel="stylesheet" type="text/css" href="pannello.css">

  </head>
  <body>

<?php
include('config.php');
session_start();
if (isset($_SESSION['session_id'])) {
    $session_user = htmlspecialchars($_SESSION['session_user'], ENT_QUOTES, 'UTF-8');
    $session_id = htmlspecialchars($_SESSION['session_id']);
    $nome = cercanomedirettore($session_user);
    printf("Benvenuto Direttore %s,", $nome);
    echo "<br>";
    printf("%s", '<a href="logout.php">Logout</a>');
} else {
  echo "<p  style='text-align:right;'>";
    printf("Effettua il %s per accedere all'area riservata", '<a href="index.html">login</a>');
}
$_SESSION['sessione'] = $session_user;
echo "<br><br><form id='form-assegna' method='get' action='aggiungi.php'>";
$info1 = mostraproblemi();
echo "<b><br>LISTA PROBLEMI NON ASSEGNATI <br><br></b><select id='select-css' name='problemi_nonassegnati'>";
while ($row = $info1->fetch_assoc()) {
  echo "<option >" .$row['id_problema']. " / ".   $row['priorita']." / ".$row['data_segnalazione']. "</option>";
}
echo "</select><br><br><br>";
$info1 = mostratecnici();
echo "<b><br>LISTA TECNICI <br><br></b><select  id='select-css' name='tecnici_disponibili'>";
  while ($row = $info1->fetch_assoc()) {
echo "<option>" .$row['id']. " / ".   $row['nome']." / ".$row['cognome']." / ".$row['specializzazione']. "</option>";
}
echo "</select><br>";
echo "<br><br><input type='submit' id='button' value='Assegna'></form>";
?>

  </body>
</html>
