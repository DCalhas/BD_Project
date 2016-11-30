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
			$sql = "SELECT numero FROM reserva;";
			$result = $db->query($sql);
			echo("<h2>Reservas</h2>\n");


			echo("<h3>Pagar Reserva</h3>");
			echo("<form action=\"pagarReserva.php\" method=\"post\">\n");
			echo("<p>	Numero: <input type=\"text\" name=\"numero\"/></p>\n");
			echo("<p>	Metodo: <input type=\"text\" name=\"metodo\"/></p>\n");
			echo("<p><input type=\"submit\" value=\"Submit\"/></p>\n");
			echo("</form>\n");	


			echo("<table border=\"0\">\n");
			echo("<tr><td>Numero</td></tr>\n");
			foreach($result as $row) {
				echo("<tr><td>");
				echo($row['tarifa']);
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