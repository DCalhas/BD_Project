<html>
<body>
	<?php
		$numero = $_REQUEST['numero'];
		$metodo = $_REQUEST['metodo'];
		date_default_timezone_get();
		$data = date('y/m/d h:i:s a', time());
		try {
			$host = "db.ist.utl.pt";
			$user ="ist180980";
			$password = "ifwa8001";
			$dbname = $user;
			

			echo($max_number);
			$db = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);
			$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$sql = "INSERT INTO estado VALUES('$numero', '$data', 'Paga'); INSERT INTO paga VALUES('$numero', '$data', '$metodo');";

			echo("<p>$sql</p>");	
			$db->query($sql);
			
			$db = null;
		}
		catch (PDOException $e) {
			echo("<p>ERROR: {$e->getMessage()}</p>");
		}
		?>
	</body>
</html>