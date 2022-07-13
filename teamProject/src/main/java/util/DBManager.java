package util;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBManager {

	// DBManager.getConnection();
	// 외부 클래스에서 디비 연동이 필요할때 사용가능 Connection을 얻어간다. 
	
	public static Connection getConnection(String database) { 
		 Connection conn = null;
		 String url = String.format("jdbc:mysql://database-1.ckbmckfk9bod.ap-northeast-2.rds.amazonaws.com:3306/%s?serverTimezone=UTC", database);
		
		 String user = "admin";
		 String password = "8EFBM59z#qZq";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
<<<<<<< HEAD
			conn = DriverManager.getConnection(url+database, user, password);
			System.out.println("DB 연동 성공");
=======
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("DB ���� ����");
>>>>>>> refs/remotes/origin/#04_dongho
			return conn;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB 연동 실패");
			return null;
		}
	}

}



