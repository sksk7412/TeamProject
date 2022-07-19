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
	// Ïô∏Î∂Ä ÌÅ¥ÎûòÏä§ÏóêÏÑú ÎîîÎπÑ Ïó∞ÎèôÏù¥ ÌïÑÏöîÌï†Îïå ÏÇ¨Ïö©Í∞ÄÎä• ConnectionÏùÑ ÏñªÏñ¥Í∞ÑÎã§. 
<<<<<<< HEAD
=======
	// ø‹∫Œ ≈¨∑°Ω∫ø°º≠ µ∫Ò ø¨µø¿Ã « ø‰«“∂ß ªÁøÎ∞°¥… Connection¿ª æÚæÓ∞£¥Ÿ. 
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
			System.out.println("DB Ïó∞Îèô ÏÑ±Í≥µ");
=======
			System.out.println("DB ø¨µø º∫∞¯");
>>>>>>> refs/remotes/origin/#02-NaYeon
			return conn;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB Ïó∞Îèô Ïã§Ìå®");
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
