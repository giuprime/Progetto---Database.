<html lang="it">
  <head>
    <meta>
    <title>SEGNALAZIONE</title>
    <link rel="stylesheet" type="text/css" href="grafica.css">
  </head>
  <body>
<?php
    include ('config.php');
    session_start();
    #INSERIMENTO NUOVA SEGNALAZIONE ALL'INTERNO DELLA TABELLA PROBLEMA, AGGIUNTA DATI IN CASO DI UTENTE NUOVO E VERIFICA EMAIL IN CASO DI DOCENTE.
    if ((isset($_GET['nome_u']))&&(isset($_GET['cognome_u']))&&(isset($_GET['email_u']))&&(isset($_GET['numero_u']))&&(isset($_GET['problema_u']))
    &&(isset($_GET['priorita_u']))&&(isset($_GET['categoria_u']))&&(isset($_GET['dipartimento_u']))&&(isset($_GET['tipologia_u'])))
    {
      $nome_u = @$_GET['nome_u'];
      $cognome_u = @$_GET['cognome_u'];
      $email_u = @$_GET['email_u'];
      $numero_u = @$_GET['numero_u'];
      $problema_u = @$_GET['problema_u'];
      $priorita_u = @$_GET['priorita_u'];
      $categoria_u = @$_GET['categoria_u'];
      $dipartimento_u = @$_GET['dipartimento_u'];
      $tipologia_u = @$_GET['tipologia_u'];
      connetti();
      utentedocente(addslashes($nome_u),addslashes($cognome_u), addslashes($email_u), addslashes($numero_u),addslashes($problema_u), addslashes($priorita_u), addslashes($dipartimento_u), $categoria_u,addslashes($tipologia_u));
    }
/*  #------------------AGGIUNTA NUOVO DIRETTORE------------------
    if (isset($_GET['nome_dir']) && isset($_GET['cognome_dir']) && isset($_GET['email_dir']) && isset($_GET['numero_di_telefono_dir']) )
    {
      $nome_dir               = @$_GET['nome_dir'];
      $cognome_dir            = @$_GET['cognome_dir'];
      $email_dir              = @$_GET['email_dir'];
      $numero_di_telefono_dir = @$_GET['numero_di_telefono_dir'];
      $inizio_dir             = @$_GET['inizio_dir'];
      $fine_dir               = @$_GET['fine_dir'];
      connetti();
      inseriscidirettore($nome_dir, $cognome_dir, $email_dir, $numero_di_telefono_dir, $inizio_dir, $fine_dir);
    }
    #------------------AGGIUNTA NUOVO DIPARTIMENTO------------------
    if ((isset($_GET['Nome_dip']))&&(isset($_GET['CAP_dip']))&&(isset($_GET['numero_civico_dip']))&&(isset($_GET['via_dip']))&&(isset($_GET['citta_dip']))&&(isset($_GET['provincia_dip'])))
    {
      $Nome_dip = @$_GET['Nome_dip'];
      $CAP_dip = @$_GET['CAP_dip'];
      $numero_civico_dip = @$_GET['numero_civico_dip'];
      $via_dip = @$_GET['via_dip'];
      $citta_dip = @$_GET['citta_dip'];
      $provincia_dip = @$_GET['provincia_dip'];
      connetti();
      inserisciDipartimento(addslashes($Nome_dip), addslashes($CAP_dip), addslashes($numero_civico_dip), addslashes($via_dip), addslashes($citta_dip), addslashes($provincia_dip));
    }
*/
    #INSERIMENTO NUOVO CORSO LAUREA
    if ((isset($_GET['nome_corso']))&& (isset($_SESSION['sessione'])) )
    {
      $nome_corso = @$_GET['nome_corso'];
      $sessione = @$_SESSION['sessione'];
      connetti();
      inserisciCorsoLaurea(addslashes($nome_corso),addslashes($sessione));
    }
    #INSERIMENTO NUOVO TECNICO
    if ((isset($_GET['nome_t']))&&(isset($_GET['cognome_t']))&&(isset($_GET['email_t']))&&(isset($_GET['numero_di_telefono_t']))&&(isset($_GET['inizio_t']))&&(isset($_GET['fine_t']))&&
    (isset($_GET['specializzazione_t']))&&(isset($_SESSION['sessione'])))
    {
      $nome_t = @$_GET['nome_t'];
      $cognome_t = @$_GET['cognome_t'];
      $email_t = @$_GET['email_t'];
      $numero_di_telefono_t = @$_GET['numero_di_telefono_t'];
      $inizio_t = @$_GET['inizio_t'];
      $fine_t = @$_GET['fine_t'];
      $specializzazione_t = @$_GET['specializzazione_t'];
      $sessione = @$_SESSION['sessione'];
      connetti();
      inseriscitecnico(addslashes($nome_t),addslashes($cognome_t), addslashes($email_t), addslashes($numero_di_telefono_t),addslashes($inizio_t),addslashes($fine_t), addslashes($specializzazione_t), addslashes($sessione));
    }
    #INSERIMENTO NUOVO DOCENTE
    if ((isset($_GET['nome_pd']))&&(isset($_GET['cognome_pd']))&&(isset($_GET['email_pd']))&&(isset($_GET['numero_di_telefono_pd']))&&(isset($_GET['tipologia_pd']))&&(isset($_SESSION['sessione'])))
    {
      $nome_pd = @$_GET['nome_pd'];
      $cognome_pd = @$_GET['cognome_pd'];
      $email_pd = @$_GET['email_pd'];
      $numero_di_telefono_pd = @$_GET['numero_di_telefono_pd'];
      $tipologia_pd = @$_GET['tipologia_pd'];
      $sessione = @$_SESSION['sessione'];
      connetti();
      inseriscipdocente(addslashes($nome_pd),addslashes($cognome_pd), addslashes($email_pd), addslashes($numero_di_telefono_pd), addslashes($tipologia_pd), addslashes($sessione));
    }
    #INSERIMENTO NUOVO PERSONALE TECNICO AMMINISTRATIVO
    if ((isset($_GET['nome_pta']))&&(isset($_GET['cognome_pta']))&&(isset($_GET['email_pta']))&&(isset($_GET['numero_di_telefono_pta']))&&(isset($_GET['tipologia_pta']))&&(isset($_SESSION['sessione'])))
    {
      $nome_pta = @$_GET['nome_pta'];
      $cognome_pta = @$_GET['cognome_pta'];
      $email_pta = @$_GET['email_pta'];
      $numero_di_telefono_pta = @$_GET['numero_di_telefono_pta'];
      $tipologia_pta = @$_GET['tipologia_pta'];
      $sessione = @$_SESSION['sessione'];
      connetti();
      inserisciptecnico(addslashes($nome_pta),addslashes($cognome_pta), addslashes($email_pta), addslashes($numero_di_telefono_pta), addslashes($tipologia_pta), addslashes($sessione));
    }
    #INSERIMENTO NUOVO CATEGORIA
    if ((isset($_GET['classificazione_c'])))
    {
      $classificazione = @$_GET['classificazione_c'];
      connetti();
      inseriscicategoria(addslashes($classificazione));
    }
    #PROBLEMI NON ASSEGNATI
    if ((isset($_GET['problemi_nonassegnati']))&&(isset($_GET['tecnici_disponibili'])))
    {
      $problemi_nonassegnati = @$_GET['problemi_nonassegnati'];
      $tecnici_disponibili = @$_GET['tecnici_disponibili'];
      connetti();
      assegnaproblema(addslashes($problemi_nonassegnati),addslashes($tecnici_disponibili));
    }
    #INSERIMENTO COMPLETATO IN TABELLA PROBLEMA
    if ((isset($_GET['problemi_darisolvere'])))
    {
      $problemi_darisolvere = @$_GET['problemi_darisolvere'];
      connetti();
      risolviproblema(addslashes($problemi_darisolvere));
    }
?>
  </body>
</html>
