<html>
<body>
	<?php
		$morada = $_REQUEST['morada'];
		$codigo = $_REQUEST['codigo'];
		$fotografia = $_REQUEST['fotografia'];
		try {
			$host = "db.ist.utl.pt";
			$user ="ist180980";
			$password = "ifwa8001";
			$dbname = $user;
			


			$db = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);
			$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$sql = "INSERT INTO alugavel VALUES('$morada', '$codigo', '$fotografia'); INSERT INTO espaco VALUES('$morada', '$codigo');";

			echo("<p>$sql</p>");	
			$db->query($sql);
			
			$db = null;
		}
		catch (PDOException $e) {
			echo("<p>ERROR: {$e->getMessage()}</p>");
		}
		header( "refresh:5;url=1alinea.php" );		?>
	</body>
</html>