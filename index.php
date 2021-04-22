<!DOCTYPE html>
<html lang="it">
  <head>
    <meta charset="utf-8">
    <title>HOMEPAGE</title>
    <link  rel="stylesheet" type="text/css" href="grafica.css">
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
        echo "<br>Clicca per accedere al <a href='panel.php'>Pannello</a>";
    }else{
        echo "<p  style='text-align:right;'>";
        printf("Effettua il %s per accedere all'area riservata", '<a href="index.html">login</a>');
    }
?>
    <center><Img id='logo' src = "unime.png" alt = "Unime"></center>
    <left><h1 id="Welcome">L'università degli Studi di Messina ti da il Benvenuto, <br> qui potrai inserire le segnalazioni riguardanti un problema riscontrato nei locali dell'ateneo.</h1><left>
    <div id="container-segnalazione">
      <center><h2 >Aggiungi Segnalazione</h2><center>
      <form method='get' action='aggiungi.php'>
        <b>Nome*</b>   <br><input type='text' name='nome_u' required> <br><br>
        <b>Cognome*</b>   <br><input type='text' name='cognome_u' required> <br><br>
        <b>Email (Istituzionale in caso di Docente)*</b>   <br><input type='text' name='email_u' required> <br><br>
        <b>Numero di Telefono</b>   <br><input type='tel' name='numero_u'> <br><br>
        <b>Descrizione Problema (max 280 caratteri)*</b>   <br><textarea id="problema "name="problema_u" cols="50" rows="6" maxlength="280" required style="resize: none;"></textarea><br><br>
        <label  for="priorita_u" required><b>Priorita*<br></b></label>
          <select id="select-css" name="priorita_u">
            <option value="Alta">Alta</option>
            <option value="Media">Media</option>
            <option value="Bassa">Bassa</option>
          </select><br>
<?php
        $info1 = cercaCategoria();
        echo "<b><br>Categoria *<br></b><select name='categoria_u' required id='select-css'>";
        while ($row = $info1->fetch_assoc()) {
          echo "<option>" .$row['classificazione']. "</option>";
        }
        echo "</select><br>";

        $info5 = cercaDipartimento();
        echo "<b><br>Dipartimento *<br></b><select name='dipartimento_u' required id='select-css'>";
        while ($row = $info5->fetch_assoc()) {
          echo " <option>" .$row['nome']. "</option>";
        }
        echo "</select><br>";

        $info7 = cercaTipologia();
        echo "<b><br>Tipologia / Classificazione / Numero *<br></b><select name='tipologia_u' required id='select-css'>";
        while ($row = $info7->fetch_assoc()) {
          echo " <option>" .$row['tipologia'] ." / ".$row['classificazione']." / ".$row['numero']."</option>";
        }
        echo "</select><br><br>";
?>
        <p style="text-align: right; font-size: 11px;">(*) Campo obbligatorio</p>
        <br><br>

    </div>
        <center><b><br><br><input id="button-segnalazione" type='submit' value='Inserisci Segnalazione'></center>
      </form>
    </div>
    </body>
</html>
