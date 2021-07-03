package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnectionBanco {
	
	private static String banco = "jdbc:postgresql://localhost:5432/curso_jsp_2?autoReconnect=true";
	private static String user = "postgres";
	private static String senha = "admin";
	private static Connection connection = null;
	
	public static Connection getConnection() {
		return connection;
	}
	
	static {
		conectar();
	}
	
	/*quando tiver uma instancia vai conectar*/
	public SingleConnectionBanco() {
		conectar();
	}
	
	private static void conectar() {
		try {
			if(connection == null) {
				Class.forName("org.postgresql.Driver"); /*carrega o driver de conex�o do banco*/
				connection = DriverManager.getConnection(banco, user, senha);
				connection.setAutoCommit(false); /*para n�o efetuar altera��es no banco sem nosso comando*/
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
