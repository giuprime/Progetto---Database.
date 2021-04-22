<?php

$servername = "localhost";
$username = "root";
$pass = "";
$dbname = "progetto";
$conn;

function connetti() {
    global $servername;
    global $username;
    global $pass;
    global $dbname;
    global $conn;
    // CREA CONNESSIONE
    $conn = new mysqli($servername, $username, $pass, $dbname);
    // VERIFICO CONNESSIONE
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function utentedocente($nome_u, $cognome_u, $email_u, $numero_u,$problema_u,$priorita_u, $dipartimento_u, $categoria_u, $tipologia_u) {
    connetti();
    global $conn;
    $sql="SELECT * FROM personale_docente WHERE email = '$email_u' ";
    $result = $conn->query($sql);
    if($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()){
        # INSERIMENTO SEGNALAZIONE IN TABELLA PROBLEMA CON ID_DOCENTE
        inseriscisegnalazionedocente($problema_u,$priorita_u, $email_u, $dipartimento_u, $categoria_u, $tipologia_u);
      }
    }else{
      #INSERIMENTO SEGNALAZIONE IN TABELLA PROBLEMA CON ID_UTENTE E INSERIMENTO NUOVI DATI IN TABELLA UTENTE
      inseriscicredenziali($nome_u, $cognome_u, $email_u, $numero_u);
      inseriscisegnalazioneutente($problema_u,$priorita_u, $email_u, $dipartimento_u, $categoria_u, $tipologia_u);
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function inseriscisegnalazionedocente($problema_u,$priorita_u, $email_u, $dipartimento_u, $categoria_u, $tipologia_u) {
    global $conn;
    $id = cercaidcategoria($categoria_u);
    $id1 = cercaiddipartimento($dipartimento_u);
    $id2 = cercaiddocente($email_u);
    $id3 = cercaidlocale($tipologia_u,$dipartimento_u);
    $created_data = date("Y-m-d");
    $sql1 ="INSERT INTO problema (priorita, descrizione, data_segnalazione,id_docente, id_dipartimento,id_locale, id_categoria)
                            VALUES ('$priorita_u','$problema_u','$created_data','$id2','$id1','$id3','$id')";
    if ($conn->query($sql1) === TRUE) {
        echo"<br><br><br><p id='inserisci'<center>Nuova Segnalazione inserita correttamente <br>
            <form action='index.php' text-align: center>
              <center><input id='button' type='submit' value='Ritorna indietro'/>
            </form>";
    } else {
        echo "Error:  ". $sql1."<br>". $conn->error;
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function inseriscicredenziali($nome_u, $cognome_u, $email_u, $numero_u){
    global $conn;
    $sql = "INSERT INTO utente (nome, cognome, email, numero_di_telefono) VALUES ('$nome_u', '$cognome_u', '$email_u','$numero_u')";
    if ($conn->query($sql) === TRUE) {
      echo"<br><br><br><p id='inserisci' <center>Credenziali inserite correttamente <br>";
      } else {
          echo "Error:  ". $sql."<br>". $conn->error;
      }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function inseriscisegnalazioneutente($problema_u,$priorita_u, $email_u, $dipartimento_u, $categoria_u, $tipologia_u) {
    global $conn;
    $id = cercaidcategoria($categoria_u);
    $id1 = cercaiddipartimento($dipartimento_u);
    $id11 = cercaidutente($email_u);
    $created_data = date("Y-m-d");
    $id3 = cercaidlocale($tipologia_u, $dipartimento_u);
    $sql ="INSERT INTO problema (priorita, descrizione, data_segnalazione,id_utente, id_dipartimento,id_locale,id_categoria) VALUES ('$priorita_u','$problema_u','$created_data','$id11','$id1','$id3','$id')";
    if ($conn->query($sql) === TRUE) {
      echo"<p id='inserisci' <center>Nuova Segnalazione inserita correttamente <br>
          <form action='index.php' text-align: center>
            <center><input id='button' type='submit' value='Ritorna indietro'/>
          </form>";
    } else {
        echo "Error:  ". $sql."<br>". $conn->error;

    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function cercaDipartimento() {
    connetti();
    global $conn;
    $sql = "SELECT nome FROM dipartimento";
    $result = $conn->query($sql);
    return $result;
}

function cercaCategoria() {
    connetti();
    global $conn;
    $sql = "SELECT * FROM categoria";
    $result = $conn->query($sql);
    return $result;
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function cercaNumero() {
    connetti();
    global $conn;
    $sql = "SELECT numero FROM locale";
    $result = $conn->query($sql);
    return $result;
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#funzione per inserire le foreign key-> mette l'id della categoria nella tabella problema
function cercaidcategoria($nome) {
    connetti();
    global $conn;
    $sql = "SELECT * FROM categoria WHERE classificazione = '$nome'";
    $result = $conn->query($sql);
    if($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()){
      $id = $row['id_categoria'];
      return $id;
      }
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function cercaiddipartimento($nome1) {
    connetti();
    global $conn;
    $sql = "SELECT * FROM dipartimento WHERE nome = '$nome1'";
    $result = $conn->query($sql);
    if($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()){
      $id = $row['id_dipartimento'];
      return $id;
      }
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function cercaidutente($nome2) {
    connetti();
    global $conn;
    $sql = "SELECT * FROM utente WHERE email = '$nome2'";
    $result = $conn->query($sql);
    if($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()){
      $id = $row['id'];
      return $id;
      }
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function cercaiddocente($nome3) {
    connetti();
    global $conn;
    $sql = "SELECT * FROM personale_docente WHERE email = '$nome3'";
    $result = $conn->query($sql);
    if($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()){
      $id11 = $row['id'];
      return $id11;
      }
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function cercaidlocale($nome4, $nome5) {
    connetti();
    global $conn;
    $stringa = explode("/",$nome4);
    if ($stringa[1] == ' ') {
      $stringa = explode("/",$nome4);
      $tip = $stringa[0];
      $num = $stringa[2];
      $id_dip = cercaiddipartimento($nome5);
      $sql = "SELECT * FROM locale WHERE tipologia = '$tip'  AND numero = '$num' AND id_dipartimento = '$id_dip'";
      $result = $conn->query($sql);
      if($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()){
        $id12 = $row['id_locale'];
        return $id12;
        }
      }
    }else{
      $stringa = explode("/ ",$nome4);
      $tip = $stringa[0];
      $cla = $stringa[1];
      $num = $stringa[2];
      $id_dip = cercaiddipartimento($nome5);
      $sql = "SELECT * FROM locale WHERE tipologia = '$tip' AND classificazione = '$cla' AND numero = '$num' AND id_dipartimento = '$id_dip'";
      $result = $conn->query($sql);
      if($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()){
        $id12 = $row['id_locale'];
        return $id12;
        }
      }
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function cercanomedirettore($nome6) {
    connetti();
    global $conn;
    $sql = "SELECT * FROM direttore WHERE id = '$nome6'";
    $result = $conn->query($sql);
    if($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()){
      $id12 = $row['cognome'];
      return $id12;
      }
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function cercanometecnico($nome7) {
    connetti();
    global $conn;
    $sql = "SELECT * FROM tecnico WHERE id = '$nome7'";
    $result = $conn->query($sql);
    if($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()){
      $id13 = $row['cognome'];
      return $id13;
      }
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function cercaTipologia(){
    connetti();
    global $conn;
    $sql = "SELECT DISTINCT tipologia, classificazione, numero FROM locale";
    $result = $conn->query($sql);
    return $result;
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function cercaufficio(){
    connetti();
    global $conn;
    $sql = "SELECT DISTINCT tipologia, classificazione, numero FROM locale WHERE tipologia = 'Ufficio'";
    $result = $conn->query($sql);
    return $result;
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function autenticazione($email){
    connetti();
    global $conn;
    $sql = "SELECT * FROM credenziali WHERE email='$email'";
    $result = $conn->query($sql);
    return $result;
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function sexion($email){
  connetti();
  global $conn;
  $sql = "SELECT * FROM credenziali WHERE email ='$email' AND id_direttore IS NULL";
  $result = $conn->query($sql);
  return $result;
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function showsegnalazioni(){
    connetti();
    global $conn;
    global $session_user;
    $sql="SELECT * FROM problema WHERE id_dipartimento = '$session_user'";
    if ($result = mysqli_query($conn, $sql)){
    echo "<center><h2>LISTA SEGNALAZIONI</h2>";
    echo "<br><table>";
      echo "<tr>";
          echo '<th>';
          printf("ID Problema");
          echo "</th>";
          echo '<th>';
          printf("Priorita");
          echo "</th>";
          echo '<th>';
          printf("Descrizione");
          echo "</th>";
          echo '<th>';
          printf("Data Segnalazione");
          echo "</th>";
          echo '<th>';
          printf("Id_Utente");
          echo "</th>";
          echo '<th>';
          printf("Id_Tecnico");
          echo "</th>";
          echo '<th>';
          printf("Id_Docente");
          echo "</th>";
          echo '<th>';
          printf("Id_Locale");
          echo "</th>";
      echo "</tr>";
      while ($row = mysqli_fetch_row($result)) {
        echo "<tr>";
            echo '<td>';
            printf("%s ", $row[0]);
            echo "</td>";
            echo '<td>';
            printf("%s ", $row[1]);
            echo "</td>";
            echo '<td>';
            printf("%s ", $row[2]);
            echo "</td>";
            echo '<td>';
            printf("%s ", $row[3]);
            echo "</td>";
            echo '<td>';
            printf("%s ", $row[4]);
            echo "</td>";
            if (empty($row[5])) {
              echo '<td>';
              echo "<a href='assegna.php'>Assegna</a>";
              echo "</td>";
            }else{
              echo '<td>';
              printf("%s ", $row[5]);
              echo "</td>";
            }
            echo '<td>';
            printf("%s ", $row[6]);
            echo "</td>";
            echo '<td>';
            printf("%s ", $row[8]);
            echo "</td>";
        echo "</tr>";
      }
      echo "</table>";
      mysqli_free_result($result);
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function showsegnalazioni2(){
    connetti();
    global $conn;
    global $session_user;
    $sql="SELECT * FROM problema WHERE id_tecnico = '$session_user' AND stato = 'Incompleto'";
    if ($result = mysqli_query($conn, $sql)){
    echo "<center><h2>LISTA SEGNALAZIONI</h2>";
    echo "<br><table>";
      echo "<tr>";
          echo '<th>';
          printf("ID Problema");
          echo "</th>";
          echo '<th>';
          printf("Priorita");
          echo "</th>";
          echo '<th>';
          printf("Descrizione");
          echo "</th>";
          echo '<th>';
          printf("Data Segnalazione");
          echo "</th>";
          echo '<th>';
          printf("ID Utente");
          echo "</th>";
          echo '<th>';
          printf("ID Locale");
          echo "</th>";
          echo '<th>';
          printf("Stato");
          echo "</th>";
      echo "</tr>";
      while ($row = mysqli_fetch_row($result)) {
          echo "<tr>";
              echo '<td>';
              printf("%s ", $row[0]);
              echo "</td>";
              echo '<td>';
              printf("%s ", $row[1]);
              echo "</td>";
              echo '<td>';
              printf("%s ", $row[2]);
              echo "</td>";
              echo '<td>';
              printf("%s ", $row[3]);
              echo "</td>";
              echo '<td>';
              printf("%s ", $row[4]);
              echo "</td>";
              echo '<td>';
              printf("%s ", $row[8]);
              echo "</td>";
              echo '<td>';
              printf("%s ", $row[10]);
              echo "</td>";
          echo "</tr>";
      }
      echo "</table>";
      mysqli_free_result($result);
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function showtecnico(){
    connetti();
    global $conn;
    global $session_user;
    $sql="SELECT * FROM tecnico WHERE id_dipartimento = '$session_user'";
    if ($result = mysqli_query($conn, $sql)){
    echo "<center><h2>LISTA TECNICI</h2>";
    echo "<br><table>";
      echo "<tr>";
          echo '<th>';
          printf("Id");
          echo "</th>";
          echo '<th>';
          printf("Nome");
          echo "</th>";
          echo '<th>';
          printf("Cognome");
          echo "</th>";
          echo '<th>';
          printf("Email");
          echo "</th>";
          echo '<th>';
          printf("Numero Telefono");
          echo "</th>";
          echo '<th>';
          printf("Inizio contratto");
          echo "</th>";
          echo '<th>';
          printf("Fine contratto");
          echo "</th>";
          echo '<th>';
          printf("Specializzazione");
          echo "</th>";
          echo '<th>';
          printf("ID Dipartimento");
          echo "</th>";
      echo "</tr>";
      while ($row = mysqli_fetch_row($result)) {
        echo "<tr>";
            echo '<td>';
            printf("%s ", $row[0]);
            echo "</td>";
            echo '<td>';
            printf("%s ", $row[1]);
            echo "</td>";
            echo '<td>';
            printf("%s ", $row[2]);
            echo "</td>";
            echo '<td>';
            printf("%s ", $row[3]);
            echo "</td>";
            echo '<td>';
            printf("%s ", $row[4]);
            echo "</td>";
            echo '<td>';
            printf("%s ", $row[5]);
            echo "</td>";
            echo '<td>';
            printf("%s ", $row[6]);
            echo "</td>";
            echo '<td>';
            printf("%s ", $row[7]);
            echo "</td>";
            echo '<td>';
            printf("%s ", $row[8]);
            echo "</td>";
        echo "</tr>";
      }
      echo "</table>";
      mysqli_free_result($result);
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function inserisciDipartimento($Nome_dip, $CAP_dip, $numero_civico_dip, $via_dip, $citta_dip, $provincia_dip) {
    global $conn;
    $sql = "INSERT INTO dipartimento(nome, CAP, numero_civico, via, citta, provincia) VALUES ('$Nome_dip', '$CAP_dip', '$numero_civico_dip','$via_dip','$citta_dip','$provincia_dip')";
    if ($conn->query($sql) === TRUE) {
        echo"<center>Nuovo dipartimento inserito correttamente <br>
            <form action='panel.php' text-align: center>
            <input type='submit' value='Ritorna indietro'/>
            </form>";
    }else{
        echo "Error:  ". $sql."<br>". $conn->error;
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function inseriscidirettore($ciao1, $ciao2, $ciao3, $ciao4, $ciao5, $ciao6){
    global $conn;
    echo "Inizio mandato". "$ciao5";
    echo "Fine mandato". "$ciao6";
    $sql2 = "INSERT INTO direttore (nome, cognome, email, numero_di_telefono, inizio_mandato, fine_mandato) VALUES ('$ciao1', '$ciao2', '$ciao3', '$ciao4', '$ciao5', '$ciao6')";
    if ($conn->query($sql2) === TRUE) {
        echo"<center>Nuovo direttore inserito correttamente <br>
            <form action= 'panel.php' text-align: center>
            <input type='submit' value='Ritorna indietro'/>
            </form>";
    }else{
        echo "Error:  ". $sql2."<br>". $conn->error;
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function inserisciCorsoLaurea($nome_corso,$sessione){
    global $conn;
    $sql = "INSERT INTO corso_laurea (nome_corso, id_dipartimento) VALUES ('$nome_corso', '$sessione')";
    if ($conn->query($sql) === TRUE) {
      echo "<center>Corso di Laurea inserito correttamente <br>
          <form action='panel.php' text-align: center>
          <input type='submit' value='Ritorna indietro'/>
          </form>";
    }else {
      echo "Error: " . $sql . "<br>" .$conn->error;
    }
}

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function inseriscitecnico($nome_t, $cognome_t, $email_t, $numero_di_telefono_t, $inizio_t, $fine_t, $specializzazione_t, $sessione){
    global $conn;
    $sql = "INSERT INTO tecnico (nome, cognome, email, numero_di_telefono, inizio_contratto, fine_contratto, specializzazione, id_dipartimento)
    VALUES ('$nome_t', '$cognome_t', '$email_t', '$numero_di_telefono_t', '$inizio_t', '$fine_t', '$specializzazione_t', '$sessione')";
    if ($conn->query($sql) === TRUE) {
      echo "<center>Tecnico inserito correttamente <br>
          <form action='panel.php' text-align: center>
          <input type='submit' value='Ritorna indietro'/>
          </form>";
    }else {
      echo "Error: " . $sql . "<br>" .$conn->error;
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function cercaid_locale($tip, $num, $sessione) {
    connetti();
    global $conn;
    $sql = "SELECT * FROM locale WHERE tipologia = '$tip' AND numero = '$num' AND id_dipartimento = '$sessione'";
    $result = $conn->query($sql);
    if($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()){
        $id = $row['id_locale'];
        return $id;
      }
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function inseriscipdocente($nome_pd, $cognome_pd, $email_pd, $numero_di_telefono_pd, $tipologia_pd, $sessione){
    global $conn;
    $stringa = explode("/",$tipologia_pd);
    $tip = $stringa[0];
    $num = $stringa[1];
    $id_locale = cercaid_locale($tip, $num, $sessione);
    $sql = "INSERT INTO personale_docente (nome, cognome, email, numero_di_telefono, id_locale) VALUES ('$nome_pd', '$cognome_pd', '$email_pd', '$numero_di_telefono_pd', '$id_locale')";
    if ($conn->query($sql) === TRUE) {
      echo "<center>Docente inserito correttamente <br>
          <form action='panel.php' text-align: center>
          <input type='submit' value='Ritorna indietro'/>
          </form>";
    }else {
      echo "Error: " . $sql . "<br>" .$conn->error;
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function inserisciptecnico($nome_pta, $cognome_pta, $email_pta, $numero_di_telefono_pta, $tipologia_pta, $sessione){
    global $conn;
    $stringa = explode("/",$tipologia_pta);
    $tip = $stringa[0];
    $num = $stringa[1];
    $id_locale = cercaid_locale($tip, $num, $sessione);
    $sql = "INSERT INTO personale_tecnico_amministrativo (nome, cognome, email, numero_di_telefono, id_locale) VALUES ('$nome_pta', '$cognome_pta', '$email_pta', '$numero_di_telefono_pta', '$id_locale')";
    if ($conn->query($sql) === TRUE) {
      echo "<br><p id='inserisci' <center>Personale Tecnico Amministrativo inserito correttamente <br>
          <form action='panel.php' text-align: center>
          <center><input id='button'type='submit' value='Ritorna indietro'/>
          </form>";
    }else {
      echo "Error: " . $sql . "<br>" .$conn->error;
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function inseriscicategoria($classificazione){
    global $conn;
    $sql = "INSERT INTO categoria (Classificazione) VALUES ('$classificazione')";
    if ($conn->query($sql) === TRUE) {
      echo "<center>Categoria inserito correttamente <br>
          <form action='panel.php' text-align: center>
          <input type='submit' value='Ritorna indietro'/>
          </form>";
    }else {
      echo "Error: " . $sql . "<br>" .$conn->error;
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function mostraproblemi(){
    global $conn;
    global $session_user;
    $sql = "SELECT * FROM problema WHERE id_tecnico IS NULL AND id_dipartimento = '$session_user' ";
    $result = $conn->query($sql);
    return $result;
  }
  #-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function mostraproblemiincompleti(){
    global $conn;
    global $session_user;
    $sql = "SELECT * FROM problema WHERE id_tecnico = '$session_user' AND stato = 'Incompleto'";
    $result = $conn->query($sql);
    return $result;
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function risolviproblema($problemi_darisolvere){
    global $conn;
    $stringa = explode("/",$problemi_darisolvere);
    $id_problema = $stringa[0];
    $sql = "UPDATE problema SET stato ='Completato' WHERE id_problema ='$id_problema'";
    if ($conn->query($sql) === TRUE) {
      echo"<br><br><br><p id='inserisci'<center>Problema risolto! <br>
          <form action='pannellotecnico.php' text-align: center>
          <center><input type='submit' id='button' value='Ritorna indietro'/>
          </form>";
    }else {
      echo "Error: " . $sql . "<br>" .$conn->error;
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function mostratecnici(){
    global $conn;
    global $session_user;
    $sql = "SELECT * FROM tecnico WHERE id_dipartimento = '$session_user' ";
    $result = $conn->query($sql);
    return $result;
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function cercaprofessione(){
    global $conn;
    $sql = "SELECT * FROM specializzazione";
    $result = $conn->query($sql);
    return $result;
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function assegnaproblema($test1, $test2){
    global $conn;
    $stringa = explode("/",$test1);
    $id_problema = $stringa[0];
    $stringa1 = explode("/",$test2);
    $id_tecnico = $stringa1[0];
    $sql1 = "SELECT COUNT(id_tecnico) AS ciao FROM problema WHERE id_tecnico= '$id_tecnico'";
    $result = $conn->query($sql1);
    if($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()){
        $conteggio = $row['ciao'];
      }
    }
    if($conteggio < 5){
      $sql = "UPDATE problema SET id_tecnico = '$id_tecnico' WHERE id_problema='$id_problema' ";
      if ($conn->query($sql) === TRUE) {
        echo "<br><br><p id='inserisci' <center>Tecnico Assegnato<br>
            <form action='assegna.php' text-align: center>
            <center><input id='button' type='submit' value='Ritorna indietro'/>
            </form>";
      }else {
        echo "Error: " . $sql . "<br>" .$conn->error;
      }
    }else{
      echo "<br><br><br><br><p id='inserisci'<center> Tecnico troppo occupato <br>
      <form action='assegna.php' text-align: center>
        <center><input id='button' type='submit' value='Ritorna indietro'/>
        </form>";
    }
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function cerca_segreteria_biblioteca(){
    connetti();
    global $conn;
    $sql = "SELECT DISTINCT tipologia, classificazione, numero FROM locale WHERE tipologia = 'Segreteria' OR tipologia = 'Biblioteca'";
    $result = $conn->query($sql);
    return $result;
}
?>
