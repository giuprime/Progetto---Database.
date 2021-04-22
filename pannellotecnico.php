<!DOCTYPE html>
<html lang="it">
  <head>
    <meta charset="utf-8">
    <title>PANNELLO DI CONTROLLO</title>
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
        $nome = cercanometecnico($session_user);
        printf("Benvenuto Tecnico %s,", $nome);
        echo "<br>";
        printf("%s", '<a href="logout.php">Logout</a>');
    }else{
      echo "<p  style='text-align:right;'>";
      printf("Effettua il %s per accedere all'area riservata", '<a href="index.html">login</a>');
    }
    showsegnalazioni2();
    echo "<br><br>";
    echo "<form method='get' action='aggiungi.php'>";
    $info1 = mostraproblemiincompleti();
    echo "<b><br>LISTA DEI PROBLEMI DA RISOLVERE <br></b><select name='problemi_darisolvere'>";
    while ($row = $info1->fetch_assoc()) {
      echo "<option>" .$row['id_problema']. " / ".   $row['priorita']." / ".$row['data_segnalazione']. "</option>";
    }
    echo "</select><br>";
    echo "<center><b><br><br><input id='button' type='submit' value='Risolto'></center>";
    ?>

</body>
</html>
