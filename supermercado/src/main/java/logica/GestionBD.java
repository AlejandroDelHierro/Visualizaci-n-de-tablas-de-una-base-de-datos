package logica;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class GestionBD {

	private Connection conexion;
	
	public GestionBD() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/supermercado";
			String usuario = "root";
			String contraseña = "curso";
			this.conexion = DriverManager.getConnection(url, usuario, contraseña); // Inicializa la conexión
			System.out.println("Conexión establecida con la base de datos");
		} catch (ClassNotFoundException e) {
			System.out.println("No se ha podido establecer la conexión con la base de datos");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Error al conectar a la base de datos");
			e.printStackTrace();
		}
	}
	
	public Connection getConexion() {
		return this.conexion;
	}
	
	public ResultSet obtenerClientes() throws SQLException {
		String consultaSQL = "SELECT cia, contacto, cargo, direccion, ciudad, region, cp, pais, tlf, fax FROM cliente;";
		Statement statement = this.conexion.createStatement();
		return statement.executeQuery(consultaSQL);
	}
	
	public ResultSet obtenerProductos() throws SQLException {
		String consultaSQL = "SELECT p.nombre AS producto, c.categoria AS categoria, p.medida, p.precio, p.stock FROM categoria c JOIN producto p ON c.idcategoria = p.idcategoria;";
		Statement statement = this.conexion.createStatement();
		return statement.executeQuery(consultaSQL);
	}
	
	public ResultSet obtenerVentas() throws SQLException {
		String consultaSQL = "SELECT idpedido, nombre, medida, detalle.precio, unidades, detalle.precio * unidades AS subtotal "
				+ "FROM detalle INNER JOIN producto "
				+ "ON detalle.idproducto = producto.idproducto "
				+ "ORDER BY idpedido;";
		Statement statement = this.conexion.createStatement();
		return statement.executeQuery(consultaSQL);
	}
}
