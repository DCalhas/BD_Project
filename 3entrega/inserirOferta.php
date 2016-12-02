<html>
<body>
	<?php
		$morada = $_REQUEST['morada'];
		$codigo = $_REQUEST['codigo'];
		$data_inicio = $_REQUEST['data_inicio'];
		$data_fim = $_REQUEST['data_fim'];
		$tarifa = $_REQUEST['tarifa'];
		try {
			$host = "db.ist.utl.pt";
			$user ="ist180980";
			$password = "ifwa8001";
			$dbname = $user;
			


			$db = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);
			$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$sql = "INSERT INTO oferta VALUES('$morada', '$codigo', '$data_inicio', '$data_fim', '$tarifa');";

			echo("<p>$sql</p>");	
			$db->query($sql);
			
			$db = null;
		}
		catch (PDOException $e) {
			echo("<p>ERROR: {$e->getMessage()}</p>");
		}
		header( "refresh:5;url=2alinea.php" );
		?>
	</body>
</html>