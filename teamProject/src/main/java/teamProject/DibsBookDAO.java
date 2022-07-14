package teamProject;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import util.DBManager;

public class DibsBookDAO {
	
	private DibsBookDAO() {}
	private static DibsBookDAO instance = new DibsBookDAO();
	
	public static DibsBookDAO getInstance() {
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
	Random ran = new Random();
	
	private ArrayList<DibsBookDTO> dibs = new ArrayList<>();
	
	// DB값 넣기
	public boolean addWrite(DibsBookDTO BoardDto) { 
		
		conn = DBManager.getConnection(database);
		System.out.println("conn: "+conn);	
		String SQL = "INSERT INTO dibsBook VALUES (?,?,?)";
		
		// 아이디 정보 찜 날짜~	
		try {

			System.out.println("code: "+BoardDto.getId());
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, BoardDto.getId());
			pstmt.setString(2, BoardDto.getIsbn());
			pstmt.setTimestamp(3, BoardDto.getCreatedAt());
			
			return true;
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deletebook(DibsBookDTO DibsDto) {
		
		conn = DBManager.getConnection(database);
		String sql = "DELETE FROM dibsBook where isbn=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, DibsDto.getId());
			pstmt.setString(2, DibsDto.getIsbn());
			pstmt.setTimestamp(3, DibsDto.getCreatedAt());
			
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
	public int deleteBook(DibsBookDTO DibsDto) {
		
		conn = DBManager.getConnection(database);
		String sql = "DELETE FROM dibsBook where isbn=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, DibsDto.getId());
			pstmt.setString(2, DibsDto.getIsbn());
			Timestamp createAt = new Timestamp(System.currentTimeMillis());
			pstmt.setTimestamp(3, createAt);
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return -1;
	}

	// DB값 불러오기
	public ArrayList<DibsBookDTO> getDibsBookDto() {
		conn = DBManager.getConnection("book");
		String sql = "select * from dibsBook";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println(rs);
			int id;
			String isbn;
			Timestamp createAt;
			
			while(rs.next()) {
				id = rs.getInt(1);
				isbn = rs.getString(2);
				createAt = rs.getTimestamp(3);
				
				DibsBookDTO dibsBookDto = new DibsBookDTO(id, isbn, createAt);
				dibs.add(dibsBookDto);
			}
			
			return dibs;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
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
	
	// 책 불러올떄
		public int getSize() {
			conn = DBManager.getConnection("book");
			String sql = "select count(*) from dibsBook";
			
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				rs.next();
				int size = rs.getInt(1);
				
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
			return -1;
		}

}