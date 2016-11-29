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
			$sql = "SELECT morada, codigo, data_inicio, data_fim, tarifa FROM Oferta;";
			$result = $db->query($sql);
			echo("<h2>Ofertas</h2>\n");


			echo("<h3>Adicionar Oferta</h3>");
			echo("<form action=\"inserirOferta.php\" method=\"post\">\n");
			echo("<p>	Morada: <input type=\"text\" name=\"morada\"/></p>\n");
			echo("<p>	Codigo: <input type=\"text\" name=\"codigo\"/></p>\n");
			echo("<p>	Data de inicio: <input type=\"text\" name=\"data_inicio\"/></p>\n");
			echo("<p>	Data de fim: <input type=\"text\" name=\"data_fim\"/></p>\n");
			echo("<p>	Tarifa: <input type=\"text\" name=\"tarifa\"/></p>\n");
			echo("<p><input type=\"submit\" value=\"Submit\"/></p>\n");
			echo("</form>\n");	


			echo("<table border=\"0\">\n");
			echo("<tr><td>morada</td></tr>\n");
			foreach($result as $row) {
				echo("<tr><td>");
				echo($row['morada']);
				echo("</td><td><a href=\"removerOferta.php?morada={$row['morada']}\">Remover</a>");
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