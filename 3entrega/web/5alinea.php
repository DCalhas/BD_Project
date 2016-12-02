<html>
<body>
	<?php
		try {
			$host = "db.ist.utl.pt";
			$user ="ist180980";
			$password = "ifwa8001";
			$dbname = $user;
			


			$db = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);
			$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$sql = "SELECT morada FROM edificio;";
			$result = $db->query($sql);
			echo("<h2>Mostrar Total Realizado</h2>\n"); 	


			echo("<h3></h3>");
			echo("<form action=\"mostrarTotalRealizado.php\" method=\"post\">\n");
			echo("<p>	Morada: <input type=\"text\" name=\"morada\"/></p>\n");
			echo("<p><input type=\"submit\" value=\"Submit\"/></p>\n");
			echo("</form>\n");	


			echo("<h3>Edificios</h3>\n");
			echo("<table border=\"0\">\n");
			foreach($result as $row) {
				echo("<tr><td>");
				echo($row['morada']);
				echo("</td></tr>\n");
			}
			echo("</table>\n");

			$db = null;
		}
		catch (PDOException $e) {
			echo("<p>ERROR: {$e->getMessage()}</p>");
		}
		?>
	</body>
</html>