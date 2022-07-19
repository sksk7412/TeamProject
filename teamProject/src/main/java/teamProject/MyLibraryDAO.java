package teamProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Random;
import util.DBManager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class MyLibraryDAO {
	
	private MyLibraryDAO() {}
	private static MyLibraryDAO instance = new MyLibraryDAO();
	
	public static MyLibraryDAO getInstance() {
		return instance;
	}
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private String log;
	private String url = "jdbc:mysql://localhost:3306/";
	private String database = "book";
	private String user = "root";
	private String password = "root";
	private Random ran = new Random();
	
	
	private ArrayList<MyLibraryDTO> lis;
	
	// DB Í∞í ÎÑ£Í∏∞
	public boolean addBook(MyLibraryDTO LibraryDto) {
		
		conn = DBManager.getConnection(database);
		String sql = "INSERT INTO myLibrary VALUES (?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, LibraryDto.getId());
			pstmt.setString(2, LibraryDto.getIsbn());
			pstmt.setTimestamp(3, LibraryDto.getModifiedAt());
			
			pstmt.executeUpdate();
			
			return true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return false;
	}
	
<<<<<<< HEAD
<<<<<<< HEAD
	// DBÔøΩÔøΩÔøΩÔøΩ ÔøΩÔøΩ ÔøΩ“∑ÔøΩÔøΩÔøΩÔøΩÔøΩ
	public ArrayList<MyLibraryDTO> getMyLibraryDTO(int log){
=======
	// DB Í∞í ÏÇ≠Ï†ú
	public boolean deleteBook(MyLibraryDTO LibraryDto) {
		conn = DBManager.getConnection(database);
		String[] isbn = LibraryDto.getIsbn().split(",");
		String sql = String.format("DELETE FROM myLibrary where isbn = '%s'", isbn[0]);
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.executeUpdate();
			
			return true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return false;
	}
	
	// DB Í∞í Î∂àÎü¨Ïò§Í∏∞
	public ArrayList<MyLibraryDTO> getMyLibraryDto(int log){
>>>>>>> refs/remotes/origin/nnnayeon
		lis = new ArrayList<>();
<<<<<<< HEAD
=======
	// DB ∞™ ªË¡¶
	public int deleteBook(MyLibraryDTO LiDto) {
		
		conn = DBManager.getConnection(database);
		String sql = "DELETE FROM myLibrary where isbn = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, 1);
			pstmt.setString(2, LiDto.getIsbn());
			Timestamp modifiedAt = new Timestamp(System.currentTimeMillis());
			pstmt.setTimestamp(3, modifiedAt);
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return -1;
		
	}
	
	// DBø°º≠ ∞™ ∫“∑Øø¿±‚
	public ArrayList<MyLibraryDTO> getMyLibraryDto(){
>>>>>>> refs/remotes/origin/#02-NaYeon
		conn = DBManager.getConnection("book");
=======
		conn = DBManager.getConnection(database);
		System.out.println("log: " + log);
>>>>>>> refs/remotes/origin/nnnayeon
		String sql = String.format("select * from myLibrary where id = %d", log);
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			int id;
			String isbn;
			Timestamp modifiedAt;
			
			while(rs.next()) {
				id = rs.getInt(1);
				isbn = rs.getString(2);
				modifiedAt = rs.getTimestamp(3);
				
				MyLibraryDTO myLibraryDto = new MyLibraryDTO(id, isbn, modifiedAt);
				lis.add(myLibraryDto);
			}
			
			return lis;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("ÎùºÏù¥Î∏åÎü¨Î¶¨ Ïò§Î•ò");
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return null;
	}
	
	public int getSize(int log) {
		conn = DBManager.getConnection(database);
		String sql = String.format("select count(*) from myLibrary where id = %d", log);
		int size = -1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			size = rs.getInt(1);
			
			return size;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return size;
	}
	
	

}
