<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Supermercado</title>
    <style>
        body {
            font-family: Arial, sans-serif; /* Fuente para el texto */
            background-color: #f4f4f4; /* Color de fondo */
            margin: 0; /* Sin márgenes */
            padding: 20px; /* Relleno alrededor del contenido */
        }

        h1 {
            text-align: center; /* Centrar el título */
            color: #333; /* Color del texto del título */
        }

        a {
            display: inline-block; /* Mostrar enlaces como bloques */
            margin: 10px; /* Espacio entre enlaces */
            padding: 10px 20px; /* Relleno dentro de los enlaces */
            text-decoration: none; /* Sin subrayado */
            color: #fff; /* Color del texto */
            background-color: #007bff; /* Color de fondo del enlace */
            border-radius: 5px; /* Bordes redondeados */
            transition: background-color 0.3s; /* Transición para el efecto hover */
        }

        a:hover {
            background-color: #0056b3; /* Color de fondo al pasar el ratón */
        }

        .container {
            max-width: 800px; /* Ancho máximo de la caja */
            margin: 0 auto; /* Centrar la caja */
            background-color: #fff; /* Color de fondo de la caja */
            padding: 20px; /* Relleno dentro de la caja */
            border-radius: 10px; /* Bordes redondeados */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Sombra */
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Listados de supermercado</h1>

        <a href="clientes.jsp">Listado de clientes</a><br>

        <a href="productos.jsp">Listado de productos</a><br>

        <a href="ventas.jsp">Listado de ventas</a><br>

    </div>

</body>
</html>
