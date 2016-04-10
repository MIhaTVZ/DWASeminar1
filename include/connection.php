<?php

try {
	$db_host = 'localhost';  //  hostname
	$db_name = 'krafna';  //  databasename
	$db_user = 'root';  //  username
	$user_pw = '';  //  password

	$conn = new PDO('mysql:host='.$db_host.'; dbname='.$db_name, $db_user, $user_pw);
	$conn->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
	$conn->exec("SET CHARACTER SET utf8");  //  return all sql requests as UTF-8
}
catch (PDOException $err) {
	echo "harmless error message if the connection fails";
	$err->getMessage() . "<br/>";
	file_put_contents('PDOErrors.txt',$err, FILE_APPEND);  // write some details to an error-log outside public_html
	die();  //  terminate connection
}

?>
