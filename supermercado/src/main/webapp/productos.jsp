<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="logica.GestionBD" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listado de Clientes</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 20px;
}

h1 {
	text-align: center;
	color: #333;
}

table {
	width: 80%;
	border-collapse: collapse;
	margin: 20px auto;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	overflow: hidden;
}

th, td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}

th {
	background-color: #007bff;
	color: white;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #e0e0e0;
}

a {
	display: inline-block;
	margin: 20px auto;
	padding: 10px 20px;
	text-decoration: none;
	color: #fff;
	background-color: #28a745;
	border-radius: 5px;
	text-align: center;
	transition: background-color 0.3s;
}

a:hover {
	background-color: #218838;
}
</style>
</head>
<body>

	<h1>Listado de Clientes</h1>

	<table>
		<tr>
			<th>Producto</th>
			<th>Categoria</th>
			<th>Medida</th>
			<th>Precio</th>
			<th>Stock</th>
		</tr>
		<%
			GestionBD gestionbd = new GestionBD();
			ResultSet rs = null;
			
			try {
				rs = gestionbd.obtenerProductos();
				while(rs != null && rs.next()){
					String producto = rs.getString("producto");
					String categoria = rs.getString("categoria");
					String medida = rs.getString("medida");
					String precio = rs.getString("precio");
					String stock = rs.getString("stock");
					
		%>
		<tr>
            <td><%= producto %></td>
            <td><%= categoria %></td>
            <td><%= medida %></td>
            <td><%= precio %></td>
            <td><%= stock %></td>           
        </tr>
		<%
				}
			} catch (SQLException e) {
				e.printStackTrace(); // Manejo de excepciones
			} finally {
				if (rs != null) {
					try {
						rs.close(); // Cerrar el ResultSet
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		%>
	</table>

	<a href="listas.jsp">Volver</a>

</body>
</html>
