<html>
<body>
	<?php
		$morada = $_REQUEST['morada'];
		$codigo = $_REQUEST['codigo'];
		try {
			$host = "db.ist.utl.pt";
			$user ="ist180980";
			$password = "ifwa8001";
			$dbname = $user;
			


			$db = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);
			$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$sql = "DELETE FROM Espaco WHERE morada = '$morada' and codigo = '$codigo';";

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