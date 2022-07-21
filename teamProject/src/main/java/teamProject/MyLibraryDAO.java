package teamProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBManager;

import java.util.ArrayList;

public class MyLibraryDAO {
	
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private String database = "book";
	
	private MyLibraryDAO() {}
	private static MyLibraryDAO instance = new MyLibraryDAO();
	
	public static MyLibraryDAO getInstance() {
		return instance;
	}
	
	private ArrayList<MyLibraryDTO> lis;
	
	public boolean check(MyLibraryDTO LibraryDto) {
		conn = DBManager.getConnection(database);
		String sql = "select * from myLibrary where isbn = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, LibraryDto.getIsbn());
			rs = pstmt.executeQuery();
			
			String id= "";
			
			while(rs.next()) {
				id = rs.getString(2);
			}
			
					
			if(id.equals("")) {
				return false;
			}
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
		return true;
	}
	
	// DB 값 넣기
	public boolean addBook(MyLibraryDTO LibraryDto) {
		if(check(LibraryDto))
			return false;
		
		conn = DBManager.getConnection(database);
		String sql = "INSERT INTO myLibrary VALUES (?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, LibraryDto.getUserId());
			pstmt.setString(2, LibraryDto.getIsbn());
			pstmt.setInt(3, LibraryDto.getIsReviewed());
			
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
	public ArrayList<MyLibraryDTO> getLi(int log){
		lis = new ArrayList<>();
		String idForLog = getUserlog(log);
		
		conn = DBManager.getConnection(database);
		String sql = "select * from myLibrary where userId = ?";
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, idForLog);
			rs = pstmt.executeQuery();
			
			
			String userId, isbn;
			int isReviewed;
			
			
			while(rs.next()) {
				userId = rs.getString(1);
				isbn = rs.getString(2);
				isReviewed = rs.getInt(3);
				
				MyLibraryDTO myLibraryDto = new MyLibraryDTO(userId, isbn, isReviewed);
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
		String sql = String.format("select count(*) from myLibrary where userId = %d", log);
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
	
	public String getUserlog(int log) {
		String userId;
		conn = DBManager.getConnection("book");
		String sql = String.format("select * from users where id = '%d';",log);
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				userId = rs.getString(2);
				return userId;
			}
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
		return null;
	} 
	
	// 리뷰 작성 안된 애들 가져오기
	// DB 값 불러오기
	public ArrayList<MyLibraryDTO> getUnReviewed(int log){
		lis = new ArrayList<>();
		
		String userId = getUserlog(log);
		
		conn = DBManager.getConnection(database);
		String sql = "select * from myLibrary where isReviewed = ? and userId = ?";
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setString(2, userId);
			rs = pstmt.executeQuery();
			
			String isbn;
			int isReviewed;
			
			
			while(rs.next()) {
				userId = rs.getString(1);
				isbn = rs.getString(2);
				isReviewed = rs.getInt(3);
				
				MyLibraryDTO myLibraryDto = new MyLibraryDTO(userId, isbn, isReviewed);
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

}