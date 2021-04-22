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
        $nome = cercanomedirettore($session_user);
        printf("Benvenuto Direttore %s,", $nome);
        echo "<br>";
        printf("%s", '<a href="logout.php">Logout</a>');
    }else{
      echo "<p  style='text-align:right;'>";
      printf("Effettua il %s per accedere all'area riservata", '<a href="index.html">login</a>');
    }
    $flag=@$_GET['case'];
    echo "<center><form method='get' action='panel.php'>
      	<h1>Pannello Amministrativo</h1>
        Seleziona l'operazione da compiere:<br><br>
        <select id='select-css' name='case'>
      		<option >Aggiungi Corso di Laurea </option>
      		<option >Aggiungi Tecnico </option>
      		<option >Aggiungi Personale Docente  </option>
          <option >Aggiungi Personale Tecnico Amministrativo  </option>
          <option >Gestisci Lavori  </option>
        </select>
        <input type='submit' id='button' value='Vai'>
      </form>
      </center>
      <hr>";
    echo "<center>";
    switch($flag) {
    		case 'Aggiungi Corso di Laurea':
          echo "<div id='container-cdl'> <h2>Aggiungi Corso di Laurea</h2>";
          {
            echo "<form method='get' action='aggiungi.php'>
            <b>Nome Corso *</b><br><input type='text' name='nome_corso' required><br><br>";
            $_SESSION['sessione'] = $session_user;
            echo "<br><br><input type='submit'id='button' value='Aggiungi'></form></div>";
          }
        break;
    		case 'Aggiungi Tecnico':
          echo "<div id='container-tecnico'>
          <h2>Aggiungi Tecnico</h2>";
    			{
            echo "<form method='get' action='aggiungi.php'>
    				<center>	<b>Nome *</b> <br><input type='text' name='nome_t'required> <br> </center>
    				<center>	<b>Cognome *</b>   <br><input type='text' name='cognome_t' required> <br>
    				<center>	<b>Email *</b>     <br><input type='email' name='email_t' required> <br>
    				<center>	<b>Numero di Telefono</b>   <br><input type='tel' name='numero_di_telefono_t'> <br>
            <center>  <b>Inizio contratto *</b>     <br><input type ='date' name='inizio_t' required><br>
            <center>  <b>Fine contratto *</b>    <br> <input type ='date' name='fine_t' required><br>";
            $info1 = cercaprofessione();
            echo "<b><br>Specializzazione *<br></b><select name='specializzazione_t' required>";
            while ($row = $info1->fetch_assoc()) {
              echo "<option>" .$row['professione']. "</option>";
            }
            echo "</select><br>";
            $_SESSION['sessione'] = $session_user;
    					echo "<br><br><input type='submit'id='button' value='Aggiungi Tecnico'></form></div>";
    				}
    		break;
      	case 'Aggiungi Personale Docente':
    				echo "<div id='container-pd'> <h2>Aggiungi Personale Docente</h2>";
    				{
    					echo "<form method='get' action='aggiungi.php'>
    					<b>Nome *</b>   <br><input type='text' name='nome_pd'required> <br>
    					<b>Cognome *</b>   <br><input type='text' name='cognome_pd'required> <br>
    					<b>Email *</b>   <br><input type='email' name='email_pd' required> <br>
    					<b>Numero di Telefono</b>   <br><input type='tel' name='numero_di_telefono_pd'> <br>";
              $_SESSION['sessione'] = $session_user;
              $info7 = cercaufficio();
              echo "<b><br>Tipologia / Numero *<br></b><select id='ciao' name='tipologia_pd' required>";
              while ($row = $info7->fetch_assoc()) {
                echo "<option>" .$row['tipologia'] ." / ".$row['numero']."</option>";
              }
              echo "</select><br>";
    					echo "<br><br><input type='submit' id='button' value='Aggiungi Docente'></form></div>";
    				}
    		break;
        case 'Aggiungi Personale Tecnico Amministrativo':
            echo "<div id='container-pd'> <h3>Aggiungi Personale Tecnico Amministrativo</h3>";
            {
              echo "<form method='get' action='aggiungi.php'>
              <b>Nome *</b>   <br><input type='text' name='nome_pta'required> <br>
              <b>Cognome *</b>   <br><input type='text' name='cognome_pta'required> <br>
              <b>Email *</b>   <br><input type='email' name='email_pta'required> <br>
              <b>Numero di Telefono</b>   <br><input type='tel' name='numero_di_telefono_pta'> <br>";
              $_SESSION['sessione'] = $session_user;
              $info7 = cerca_segreteria_biblioteca();
              echo "<b><br>Tipologia / Numero *<br></b><select id='ciao' name='tipologia_pta'required>";
              while ($row = $info7->fetch_assoc()) {
                echo "<option>" .$row['tipologia'] ." / ".$row['numero']."</option>";
              }
              echo "</select><br>";
              echo "<br><br><input type='submit' id='button' value='Aggiungi Personale Tecnico'></form></div>";
            }
        break;
        case 'Gestisci Lavori':
      			{
              showsegnalazioni();
              echo "<br><br>";
      			}
        break;
        default:
      	break;
    		}
    echo "</center>";
    echo "<p style='text-align: right; font-size: 15px;'>(*) Campo obbligatorio</p>";
    ?>

</body>
</html>
