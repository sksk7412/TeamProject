package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBManager {
	
	public static Connection getConnection(String dataBase) {
		Connection conn = null ;
		
		
		String url = "jdbc:mysql://localhost:3306/"; 
		String user = "root"; 
		String password = "root";  
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			conn = DriverManager.getConnection(url+dataBase, user, password);
			System.out.println("DB 연동 성공");
			return conn; 
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB 연동 실패");
		}
		return null; 
	}
}