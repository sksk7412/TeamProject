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
	
	// DB 값 넣기
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
	
	// DB 값 삭제
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
	
	// DB 값 불러오기
	public ArrayList<MyLibraryDTO> getMyLibraryDto(int log){
		lis = new ArrayList<>();
		conn = DBManager.getConnection(database);
		System.out.println("log: " + log);
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
			System.out.println("라이브러리 오류");
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
