package teamProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import util.DBManager;


public class UserDAO {
	private static UserDAO instance=new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	
	private Connection conn=null;
	private ResultSet rs=null;
	private PreparedStatement pstmt=null;
	
	
	public boolean addUser(UserDTO userDto) {

		conn = DBManager.getConnection("book");
		System.out.println( userDto.getUserId());
		try {
			String sql = String.format("insert into users(userId,userPw,`name`,mobile) values('%s','%s','%s','%s')", userDto.getUserId(), userDto.getUserPw(), userDto.getName(),userDto.getMobile());
			pstmt = conn.prepareStatement(sql);
			
			/*
			 * pstmt.setString(1, userDto.getUserId()); pstmt.setString(2,
			 * userDto.getUserPw()); pstmt.setString(3, userDto.getName());
			 * pstmt.setString(4, use2rDto.getMobile());
			 */
			
			pstmt.execute();
			System.out.println("insert done");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert fail");
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	return false;
	}
	public boolean updateUser(UserDTO userDto, int log) {

		conn = DBManager.getConnection("book");
		System.out.println( userDto.getUserId());
		try {
			String sql = String.format("update users set userPw='%s',`name` = '%s' ,mobile=%s where id=%d", userDto.getUserPw(), userDto.getName(),userDto.getMobile(), log);
			pstmt = conn.prepareStatement(sql);
			
			/*
			 * pstmt.setString(1, userDto.getUserId()); pstmt.setString(2,
			 * userDto.getUserPw()); pstmt.setString(3, userDto.getName());
			 * pstmt.setString(4, use2rDto.getMobile());
			 */
			
			pstmt.execute();
			System.out.println("insert done");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert fail");
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	return false;
	}
	
	
	public String getName(int log) {
		conn = DBManager.getConnection("book");
		String name="";
		try {
			String sql = String.format("select name from users where id = '%d' ;",log);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				name = rs.getString(1);
			}
			System.out.println("성공");
			return name;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		System.out.println("실패");
		return null;
	}
	
	public String getMobile(int log) {
		conn = DBManager.getConnection("book");
		String mobile="";
		try {
			String sql = String.format("select mobile from users where id = '%d';",log);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mobile = rs.getString(1);
			}
			System.out.println("성공");
			System.out.println(mobile);
			return mobile;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		System.out.println("실패");
		return null;
	}
	
	public String getUserId(int log) {
		conn = DBManager.getConnection("book");
		String userId="";
		try {
			String sql = String.format("select userId from users where id = '%d' ;",log);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userId = rs.getString(1);
			}
			System.out.println("성공");
			return userId;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		System.out.println("실패");
		return null;
	}
	
	public int getId(String id) {
		conn = DBManager.getConnection("book");
		
		int log = -1;
		try {
			String sql = String.format("select id from users where userId = '%s' ;",id);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				log = rs.getInt(1);
			}
			System.out.println("로그입력성공");
			return log;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		System.out.println("로그인 실패");
		return log;
	}
	
	
	public boolean loginCheck(UserDTO user) {
		/* UserDTO user = null; */
		conn = DBManager.getConnection("book");
		try {
			String sql = String.format("select count(*) from users where userId = '%s' and userPw='%s';",user.getUserId(),user.getUserPw());
			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1,id);
//			pstmt.setString(2,password);
			rs = pstmt.executeQuery();
			
//			if(rs.next()) {
//				return true;
//			}
			while(rs.next()) {
				if(rs.getInt(1)>0)
					return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return true;
	}
	
	public String getUserId() {
		String id = null;
		
		
		
		
		
		
		return null;
	}
	
	

}
