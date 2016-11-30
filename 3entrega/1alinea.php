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
			echo("<h2>Edificios</h2>\n");


			echo("<h3>Adicionar Edificio</h3>");
			echo("<form action=\"inserirEdificio.php\" method=\"post\">\n");
			echo("<p>	Morada: <input type=\"text\" name=\"morada\"/></p>\n");
			echo("<p><input type=\"submit\" value=\"Submit\"/></p>\n");
			echo("</form>\n");	


			echo("<table border=\"0\">\n");
			echo("<tr><td>morada</td></tr>\n");
			foreach($result as $row) {
				echo("<tr><td>");
				echo($row['morada']);
				echo("</td><td><a href=\"removerEdificio.php?morada={$row['morada']}\">Remover</a>");
				echo("</td></tr>\n");
			}
			echo("</table>\n");

			$sql = "SELECT morada, codigo FROM Espaco;";
			$result = $db->query($sql);
			echo("<h2>Espacos</h2>\n");

			echo("<h3>Adicionar Espaco</h3>");
			echo("<form action=\"inserirEspaco.php\" method=\"post\">\n");
			echo("<p>Morada: <input type=\"text\" name=\"morada\"/></p>\n");
			echo("<p>Codigo: <input type=\"text\" name=\"codigo\"/></p>\n");
			echo("<p>Fotografia: <input type=\"text\" name=\"fotografia\"/></p>\n");
			echo("<p><input type=\"submit\" value=\"Submit\"/></p>\n");
			echo("</form>\n");	


			echo("<table border=\"0\">\n");	
			echo("<tr><td>morada</td><td>codigo</td></tr>\n");
			foreach($result as $row) {
				echo("<tr><td>");
				echo($row['morada']);
				echo("</td><td>");
				echo($row['codigo']);
				echo("</td><td><a href=\"removerEspaco.php?morada={$row['morada']}&codigo={$row['codigo']}\">Remover</a>");
				echo("</td></tr>\n");
			}
			echo("</table>\n");

			$sql = "SELECT morada, codigo, codigo_espaco FROM Posto;";
			$result = $db->query($sql);
			echo("<h2>Postos</h2>\n");

			echo("<h3>Adicionar Posto</h3>");
			echo("<form action=\"inserirPosto.php\" method=\"post\">\n");
			echo("<p>Morada: <input type=\"text\" name=\"morada\"/></p>\n");
			echo("<p>Codigo: <input type=\"text\" name=\"codigo\"/></p>\n");
			echo("<p>Codigo do Espaco: <input type=\"text\" name=\"codigo_espaco\"/></p>\n");
			echo("<p>Fotografia: <input type=\"text\" name=\"fotografia\"/></p>\n");
			echo("<p><input type=\"submit\" value=\"Submit\"/></p>\n");
			echo("</form>\n");


			echo("<table border=\"0\">\n");	
			echo("<tr><td>morada</td><td>codigo</td><td>codigo_espaco</td></tr>\n");
			foreach($result as $row) {
				echo("<tr><td>");
				echo($row['morada']);
				echo("</td><td>");
				echo($row['codigo']);
				echo("</td><td>");
				echo($row['codigo_espaco']);
				echo("</td><td><a href=\"removerPosto.php?morada={$row['morada']}&codigo={$row['codigo']}\">Remover</a>");
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