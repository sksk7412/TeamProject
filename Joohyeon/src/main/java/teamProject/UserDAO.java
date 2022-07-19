package teamProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBManager;



public class UserDAO {
	private static UserDAO instance=new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	
	private Connection conn=null;
	private ResultSet rs=null;
	private PreparedStatement pstmt=null;
	ArrayList<UserDTO> users;
	
	
	public boolean addUser(UserDTO userDto) {

		conn = DBManager.getConnection("book");
		try {
			String sql = "insert into users(userId,userPw,name,mobile) values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userDto.getUserId());
			pstmt.setString(2, userDto.getUserPw());
			pstmt.setString(3, userDto.getName());
			pstmt.setString(4, userDto.getMobile());
			
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
		System.out.println("로그입력실패");
		return log;
	}
	
	public ArrayList<UserDTO> getUsers(){
		users = new ArrayList<>();
		try {
			conn = DBManager.getConnection("book");
			String sql = "select * from users";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			String id = "";
			while(rs.next()) {
				id = rs.getString(2);
				UserDTO temp = new UserDTO(id);
				users.add(temp);
			}
			return users;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println("중복있음");
		return null;
	}
	
	public boolean userCheck(UserDTO user) {
		/* UserDTO user = null; */
		conn = DBManager.getConnection("book");
		try {
			String sql = String.format("select userId from users where userId = '%s';",user.getUserId());
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			

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
	
	
}
