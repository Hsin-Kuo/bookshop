package JDBC;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnDb {
	
	
	final String JDBC_DRIVER="com.mysql.cj.jdbc.Driver";
	final String DB_URL="jdbc:mysql://localhost:8888/test";
	final String USER_NAME="root";
	final String PASSWORD="00000000";
	Connection con= null;
	
	public Connection getCon() {
		try{
			//載入jdbc驅動程式
			Class.forName(JDBC_DRIVER);
			try{
				con = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
				if(con!=null){
//					System.out.print("success!");
				}
			}catch(Exception e){
				System.out.println(e);
			}
		}catch(Exception e){
			System.out.println(e);
		}
		return con;
	}
	
	public void setCon(Connection con) {
		this.con = con;
	}
	

}
