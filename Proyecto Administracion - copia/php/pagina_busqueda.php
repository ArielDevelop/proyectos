<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
	<?php 

		$busqueda= $_GET["buscar"];

		require("datos_conexion.php");

		$conexion= mysqli_connect($db_host, $db_usuario, $db_contra, $db_nombre);

		if (mysqli_connect_errno()) {
			echo "Error al conectar la base de datos";
			exit();
		}

		mysqli_set_charset($conexion, "utf8");

		$consulta="SELECT * FROM HOJA1 WHERE APELLIDO LIKE'%$busqueda'";

		$resultado= mysqli_query($conexion, $consulta);

		while ($fila=mysqli_fetch_array($resultado, MYSQLI_ASSOC)) {
			
			echo $fila['Nombre'] . " ";
			echo $fila['Apellido'] . " ";
			echo $fila['DNI'] . " ";
			echo "<br>";
			echo "<br>";
		}


		mysqli_close($conexion);
	?>
</body>
</html>