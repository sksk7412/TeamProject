package util;

import java.sql.Connection;
import java.sql.DriverManager;

<<<<<<< HEAD
public class DBManager {

	// DBManager.getConnection();
	// ì™¸ë¶€ í´ëž˜ìŠ¤ì—ì„œ ë””ë¹„ ì—°ë™ì´ í•„ìš”í• ë•Œ ì‚¬ìš©ê°€ëŠ¥ Connectionì„ ì–»ì–´ê°„ë‹¤. 
	
	public static Connection getConnection(String database) { 
		 Connection conn = null;
		 String url = "jdbc:mysql://localhost:3306/";
		
		 String user = "root";
		 String password = "root";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url+database, user, password);
			System.out.println("DB ì—°ë™ ì„±ê³µ");
			return conn;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB ì—°ë™ ì‹¤íŒ¨");
			return null;
		}
	}

}

=======
public class DBManager {

	// DBManager.getConnection();
	// ¿ÜºÎ Å¬·¡½º¿¡¼­ µðºñ ¿¬µ¿ÀÌ ÇÊ¿äÇÒ¶§ »ç¿ë°¡´É ConnectionÀ» ¾ò¾î°£´Ù. 
	
	public static Connection getConnection(String database) { 
		 Connection conn = null;
		 String url = "jdbc:mysql://localhost:3306/";
		
		 String user = "root";
		 String password = "root";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url+database, user, password);
			System.out.println("DB ¿¬µ¿ ¼º°ø");
			return conn;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB ¿¬µ¿ ½ÇÆÐ");
			return null;
		}
	}
	
}
>>>>>>> refs/remotes/origin/#04_dongho
