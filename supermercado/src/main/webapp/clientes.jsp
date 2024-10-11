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
			<th>CIA</th>
			<th>Contacto</th>
			<th>Cargo</th>
			<th>Dirección</th>
			<th>Ciudad</th>
			<th>Región</th>
			<th>CP</th>
			<th>País</th>
			<th>Tlf</th>
			<th>Fax</th>
		</tr>
		<%
			GestionBD gestionbd = new GestionBD();
			ResultSet rs = null;
			
			try {
				rs = gestionbd.obtenerClientes();
				while(rs != null && rs.next()){
					String cia = rs.getString("cia");
					String contacto = rs.getString("contacto");
					String cargo = rs.getString("cargo");
					String direccion = rs.getString("direccion");
					String ciudad = rs.getString("ciudad");
					String region = rs.getString("region");
					String cp = rs.getString("cp");
					String pais = rs.getString("pais");
					String tlf = rs.getString("tlf");
					String fax = rs.getString("fax");
		%>
		<tr>
            <td><%= cia %></td>
            <td><%= contacto %></td>
            <td><%= cargo %></td>
            <td><%= direccion %></td>
            <td><%= ciudad %></td>
            <td><%= region %></td>
            <td><%= cp %></td>
            <td><%= pais %></td>
            <td><%= tlf %></td>
            <td><%= fax %></td>
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
