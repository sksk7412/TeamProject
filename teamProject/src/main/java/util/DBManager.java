package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBManager {
	
	public static Connection getConnection(String dataBase) {
		Connection conn = null ;
		
		
		String url = "jdbc:mysql://database-3.ch9twdxhwbh6.ap-northeast-2.rds.amazonaws.com:3306/firstJsp?serverTimezone=UTC"; 
		String user = "admin"; 
		String password = "65IHY0&KYROa";  
		
		
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