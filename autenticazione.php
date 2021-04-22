<html lang="it">
	<head>
		<meta charset="utf-8">
		<title>AREA RISERVATA</title>
		<link rel="stylesheet" type="text/css" href="grafica.css">
	</head>
	<body>

<?php
session_start();
include ('config.php');

$email = $_POST['email'];
if (empty(sexion($email))) {
	if(isset($_SESSION['session_id'])) {
		header('Location: panel.php');
		exit;
	}
}else{
	if(isset($_SESSION['session_id'])) {
		header('Location: pannellotecnico.php');
		exit;
	}
}

if(isset($_POST['login'])) {
	$email = $_POST['email'] ?? '';
	$password = $_POST['pass'] ?? '';
	if(empty($email) || empty($password)) {
    $msg = 'Inserisci email e password %s';
  }else{
    $check = autenticazione($email);
    $user = $check->fetch_assoc();
		$pwd = $user['password'];
	  if(!$user || !(md5($password) == $pwd)) {
      $msg = 'Credenziali utente errate %s';
	  }else{
      session_regenerate_id();
      $_SESSION['session_id'] = session_id();
			if($user['id_tecnico'] != null) {
				$_SESSION['session_user'] = $user['id_tecnico'];
				header('Location: pannellotecnico.php');
				exit;
			}else{
        $_SESSION['session_user'] = $user['id_direttore'];
				header('Location: panel.php');
				exit;
      }
  	}
  }
  printf($msg, '<a href="index.html">torna indietro</a>');
}
?>

</body>
</html>
