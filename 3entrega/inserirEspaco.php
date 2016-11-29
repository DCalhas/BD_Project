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
			$sql = "INSERT INTO Alugavel VALUES('$morada', '$codigo', '$fotografia'); INSERT INTO Espaco VALUES('$morada', '$codigo');";

			echo("<p>$sql</p>");	
			$db->query($sql);
			
			$db = null;
		}
		catch (PDOException $e) {
			echo("<p>ERROR: {$e->getMessage()}</p>");
		}
		header('Location: ' . $_SERVER["HTTP_REFERER"] );
		exit;
		?>
	</body>
</html>