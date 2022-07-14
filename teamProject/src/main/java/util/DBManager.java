package util;

import java.sql.Connection;
import java.sql.DriverManager;


<<<<<<< HEAD
=======
public class DBManager {
>>>>>>> refs/heads/master

	// DBManager.getConnection();
	// 외부 클래스에서 디비 연동이 필요할때 사용가능 Connection을 얻어간다. 
<<<<<<< HEAD
public class DBManager {
=======

>>>>>>> refs/heads/master
	
	public static Connection getConnection(String database) { 
		 Connection conn = null;
<<<<<<< HEAD
		 String url = String.format("jdbc:mysql://database-1.ckbmckfk9bod.ap-northeast-2.rds.amazonaws.com:3306/%s?serverTimezone=UTC", database);
		
=======

>>>>>>> refs/heads/master
			/*
			 * String url =
			 * "jdbc:mysql://database-1.ckbmckfk9bod.ap-northeast-2.rds.amazonaws.com:3306/firstJsp?serverTimezone=UTC"
			 */;
<<<<<<< HEAD
=======
		 String url = String.format("jdbc:mysql://database-1.ckbmckfk9bod.ap-northeast-2.rds.amazonaws.com:3306/%s?serverTimezone=UTC", database);

		
>>>>>>> refs/heads/master
		 String user = "admin";
		 String password = "8EFBM59z#qZq";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("DB 연동 성공");
			return conn;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB 연동 실패");
			return null;
		}
<<<<<<< HEAD
	}

}

=======

	}
}


>>>>>>> refs/heads/master
