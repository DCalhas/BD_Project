<html>
<body>
	<?php
		$morada = $_REQUEST['morada'];
		$codigo = $_REQUEST['codigo'];
		$codigo_espaco = $_REQUEST['codigo_espaco'];
		$fotografia = $_REQUEST['fotografia'];
		try {
			$host = "db.ist.utl.pt";
			$user ="ist180980";
			$password = "ifwa8001";
			$dbname = $user;
			


			$db = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);
			$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$sql = "INSERT INTO alugavel VALUES('$morada', '$codigo', '$fotografia'); INSERT INTO posto VALUES('$morada', '$codigo', '$codigo_espaco');";

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