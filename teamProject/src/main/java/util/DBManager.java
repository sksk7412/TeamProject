package util;

import java.sql.Connection;
import java.sql.DriverManager;

<<<<<<< HEAD
<<<<<<< HEAD

=======

>>>>>>> refs/remotes/origin/#02-NaYeon
=======

>>>>>>> refs/remotes/origin/nnnayeon
public class DBManager {

	// DBManager.getConnection();
<<<<<<< HEAD
	// 외부 클래스에서 디비 연동이 필요할때 사용가능 Connection을 얻어간다. 
<<<<<<< HEAD
=======
	// �ܺ� Ŭ�������� ��� ������ �ʿ��Ҷ� ��밡�� Connection�� ����. 
=======
>>>>>>> refs/remotes/origin/nnnayeon

	
>>>>>>> refs/remotes/origin/#02-NaYeon
	public static Connection getConnection(String database) { 
		 Connection conn = null;
<<<<<<< HEAD
<<<<<<< HEAD

=======

>>>>>>> refs/remotes/origin/nnnayeon
			/*
			 * String url =
			 * "jdbc:mysql://database-1.ckbmckfk9bod.ap-northeast-2.rds.amazonaws.com:3306/firstJsp?serverTimezone=UTC"
			 */;
		 String url = String.format("jdbc:mysql://database-1.ckbmckfk9bod.ap-northeast-2.rds.amazonaws.com:3306/%s?serverTimezone=UTC", database);

<<<<<<< HEAD
=======

			/*
			 * String url =
			 * "jdbc:mysql://database-1.ckbmckfk9bod.ap-northeast-2.rds.amazonaws.com:3306/firstJsp?serverTimezone=UTC"
			 */;
		 String url = String.format("jdbc:mysql://database-1.ckbmckfk9bod.ap-northeast-2.rds.amazonaws.com:3306/%s?serverTimezone=UTC", database);

		
>>>>>>> refs/remotes/origin/#02-NaYeon
=======
		
>>>>>>> refs/remotes/origin/nnnayeon
		 String user = "admin";
		 String password = "8EFBM59z#qZq";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
<<<<<<< HEAD
			System.out.println("DB 연동 성공");
=======
			System.out.println("DB ���� ����");
>>>>>>> refs/remotes/origin/#02-NaYeon
			return conn;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB 연동 실패");
			return null;
		}
<<<<<<< HEAD
<<<<<<< HEAD
	}
}
=======

	}
}

>>>>>>> refs/remotes/origin/#02-NaYeon
=======

	}
}
>>>>>>> refs/remotes/origin/nnnayeon
