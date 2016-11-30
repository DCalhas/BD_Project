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
			$sql = "SELECT morada, codigo, data_inicio, data_fim, tarifa FROM oferta;";
			$result = $db->query($sql);
			echo("<h2>Ofertas</h2>\n"); 	

			echo("<h3>Realizar Reserva</h3>");
			echo("<form action=\"criarReserva.php\" method=\"post\">\n");
			echo("<p>	Morada: <input type=\"text\" name=\"morada\"/></p>\n");
			echo("<p>	Codigo: <input type=\"text\" name=\"codigo\"/></p>\n");
			echo("<p>	Nif: <input type=\"text\" name=\"nif\"/></p>\n");
			echo("<p>	Numero: <input type=\"text\" name=\"numero\"/></p>\n");
			echo("<p><input type=\"submit\" value=\"Submit\"/></p>\n");
			echo("</form>\n");	

			echo("<h3>Ofertas</h3>\n");
			echo("<table border=\"0\">\n");
			echo("<tr><td>morada</td><td>codigo</td><td>data_inicio</td><td>data_fim</td><td>tarifa</td></tr>\n");
			foreach($result as $row) {
				echo("<tr><td>");
				echo($row['morada']);
				echo("</td><td>");
				echo($row['codigo']);
				echo("</td><td>");
				echo($row['data_inicio']);
				echo("</td><td>");
				echo($row['data_fim']);
				echo("</td><td>");
				echo($row['tarifa']);
				echo("</td></tr>\n");
			}
			echo("</table>\n");

			$sql = "SELECT numero, time_stamp, estado FROM estado;";
			$result = $db->query($sql);
			echo("<h2>Reservas Existentes</h2>\n");

			echo("<table border=\"0\">\n");
			echo("<tr><td>numero</td><td>time_stamp</td><td>estado</td></tr>\n");
			foreach($result as $row) {
				echo("<tr><td>");
				echo($row['numero']);
				echo("</td><td>");
				echo($row['time_stamp']);
				echo("</td><td>");
				echo($row['estado']);	
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