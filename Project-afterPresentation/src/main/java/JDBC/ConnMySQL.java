package JDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ResourceBundle;

public class ConnMySQL {
	Connection con= null;
	public Connection getCon() {
		ResourceBundle resBundl= ResourceBundle.getBundle("mysql");
		
		final String JDBC_DRIVER= resBundl.getString("db.driver");
		final String DB_URL= resBundl.getString("db.url");
		final String USER_NAME= resBundl.getString("db.username");
		final String PASSWORD= resBundl.getString("db.password");
		try{
			//載入jdbc驅動程式
			Class.forName(JDBC_DRIVER);
			try{
				con = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
				if(con!=null){
					System.out.print("success!");
				}
			}catch(Exception e){
				System.out.println(e);
			}
		}catch(Exception e){
			System.out.println(e);
		}
		return con;
	}
	

}
