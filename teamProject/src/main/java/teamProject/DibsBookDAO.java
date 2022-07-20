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
	Random ran = new Random();
	
	private ArrayList<DibsBookDTO> dibs;
	
	// DB값 넣기
	public boolean addWrite(DibsBookDTO BoardDto) {
		
		conn = DBManager.getConnection(database);
		System.out.println("conn: "+conn);	
		String SQL = "INSERT INTO dibsbook VALUES (?,?,?)";
		
		// 아이디 정보 찜 날짜~	
		try {

			System.out.println("code: "+BoardDto.getId());
			pstmt = conn.prepareStatement(SQL);
			
			conn = DBManager.getConnection(database);
			System.out.println("conn: "+ conn);	
					
			String sql = String.format("insert into dibsbook values('%s','%s','%s')", BoardDto.getId(), BoardDto.getIsbn(), BoardDto.getCreatedAt());
			pstmt.setInt(1, BoardDto.getId());
			pstmt.setString(2, BoardDto.getIsbn());
			pstmt.setTimestamp(3, BoardDto.getCreatedAt());
			pstmt.executeUpdate();
			return true;
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return false;
	}
	
	// DB값 삭제
	public boolean deleteBook(DibsBookDTO DibsDto) {
		
		conn = DBManager.getConnection(database);
		System.out.println( DibsDto.getIsbn());
		String[] isbn = DibsDto.getIsbn().split(",");
		String sql = String.format("DELETE FROM dibsbook where isbn = '%s'", isbn[0]);
		
		try {
			pstmt = conn.prepareStatement(sql);
			
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

	// DB값 불러오기
	public ArrayList<DibsBookDTO> getDibsBookDto(int log) {
		conn = DBManager.getConnection(database);
		
		dibs = new ArrayList<>();
		conn = DBManager.getConnection(database);
		String sql = String.format("select * from dibsbook where id = %d", log);
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
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
			System.out.println("딥스 북 오류");
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
		public int getSize(int log) {
			conn = DBManager.getConnection(database);
			
			String sql = String.format("select count(*) from dibsbook where id=%d", log);
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
			System.out.println(size);
			return size;
		}
		
		
		// 찜 확인 클래스
		public boolean getdibs(int log,String isbn) {
			conn = DBManager.getConnection(database);
		//	String sql = "select * from dibsbook where id=";
			String sql = String.format("select * from dibsbook where id ='%d' AND isbn = '%s';", log, isbn);
					
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					return true;
				}

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
			return false;
		}	
				
}


