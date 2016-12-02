<html>
<body>
	<?php
		$morada = $_REQUEST['morada'];
		try {
			$host = "db.ist.utl.pt";
			$user ="ist180980";
			$password = "ifwa8001";
			$dbname = $user;
			
			$db = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);
			$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$sql = "SELECT sum(total_realizado_por_espaco) as montante_edificio, morada
					from(SELECT sum(montante_total) as total_realizado_por_espaco, morada, codigo 
						FROM (SELECT *
								from ((select *
										from (
											(select sum(montante_pago_posto) as montante_total, morada, codigo_espaco as codigo
											from (
												select tarifa * timestampdiff(day, data_inicio, data_fim) as montante_pago_posto, morada, codigo, codigo_espaco 
												from aluga natural join oferta 
															natural join posto 
												group by morada, codigo, codigo_espaco) as montante_postos)
										union
											(select tarifa * timestampdiff(day, data_inicio, data_fim) as montante_total, morada, codigo 
											from aluga natural join espaco
														natural join (
															select distinct morada, codigo, data_fim, tarifa
															from oferta) as oferta_personalized
															group by morada, codigo)) as union_aux)
										union
											(select 0 as montante_total, morada, codigo
											from espaco)) as zeros_table) as union_for_zeros
						group by morada, codigo) as principal_table
					where morada = '$morada';";
	
			$result = $db->query($sql);

			echo("<h3>Edificio</h3>\n");
			echo("<table border=\"0\">\n");
			echo("<tr><td>morada</td><td>montante_total</td></tr>\n");
			foreach($result as $row) {
				echo("<tr><td>");
				echo($row['morada']);
				echo("</td><td>");
				echo($row['montante_edificio']);
				echo("</td><td>");
				echo("\n\n<a href=\"http://web.ist.utl.pt/ist180980/5alinea.php\">Voltar</a>");
				echo("</td></tr>\n");
			}
			$db = null;
		}
		catch (PDOException $e) {
			echo("<p>ERROR: {$e->getMessage()}</p>");
		}
		header( "refresh:5;url=5alinea.php" );
		?>
	</body>
</html>