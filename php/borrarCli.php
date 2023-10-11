<?php
$Nombre = $_POST['Nombre'];



$mysqli_link = mysqli_connect("localhost", "root", "", "proyecto");
if (mysqli_connect_errno())
{
    printf("MySQL connection failed with the error: %s", mysqli_connect_error());
    exit;
}
$delete_query = "DELETE FROM cliente WHERE `Nombre` = '$Nombre'";

// Ejecuta la consulta de eliminación
if (mysqli_query($mysqli_link, $delete_query)) {
    echo 'Eliminado correctamente';
} else {
    echo 'Error al eliminar el registro: ' . mysqli_error($mysqli_link);
}
// Cierra la conexión a la base de datos
mysqli_close($mysqli_link);
?>