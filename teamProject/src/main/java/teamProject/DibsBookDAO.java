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
	
	private ArrayList<DibsBookDTO> dibs;
	
<<<<<<< HEAD
<<<<<<< HEAD
	// DB媛� �꽔湲�
		public boolean addWrite(DibsBookDTO BoardDto) { 
=======
	// DB값 넣기
	public boolean addWrite(DibsBookDTO BoardDto) {
		
		conn = DBManager.getConnection(database);
		System.out.println("conn: "+conn);	
		String SQL = "INSERT INTO dibsBook VALUES (?,?,?)";
		
		// 아이디 정보 찜 날짜~	
		try {

			System.out.println("code: "+BoardDto.getId());
			pstmt = conn.prepareStatement(SQL);
>>>>>>> refs/remotes/origin/nnnayeon
			
<<<<<<< HEAD
			conn = DBManager.getConnection(database);
			System.out.println("conn: "+conn);	
		//	String sql = "INSERT INTO dibsBook VALUES (?,?,?)";
					
			String sql = String.format("insert into dibsBook values('%s','%s','%s')", BoardDto.getId(), BoardDto.getIsbn(), BoardDto.getCreatedAt());
=======
	// DB값 넣기
	public boolean addWrite(DibsBookDTO BoardDto) { 
		
		conn = DBManager.getConnection(database);
		System.out.println("conn: "+conn);	
		String SQL = "INSERT INTO dibsBook VALUES (?,?,?)";
		
		// 아이디 정보 찜 날짜~	
		try {

			System.out.println("code: "+BoardDto.getId());
			pstmt = conn.prepareStatement(SQL);
>>>>>>> refs/remotes/origin/#02-NaYeon
=======
			pstmt.setInt(1, BoardDto.getId());
			pstmt.setString(2, BoardDto.getIsbn());
			pstmt.setTimestamp(3, BoardDto.getCreatedAt());
			pstmt.executeUpdate();
			return true;
>>>>>>> refs/remotes/origin/nnnayeon
			
<<<<<<< HEAD
<<<<<<< HEAD
			// �븘�씠�뵒 �젙蹂� 李� �궇吏�~	
=======
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
>>>>>>> refs/remotes/origin/nnnayeon
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
<<<<<<< HEAD
			return false;
=======
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
>>>>>>> refs/remotes/origin/#02-NaYeon
=======
>>>>>>> refs/remotes/origin/nnnayeon
		}
		return false;
	}
	
	// DB값 삭제
	public boolean deleteBook(DibsBookDTO DibsDto) {
		
		conn = DBManager.getConnection(database);
		System.out.println( DibsDto.getIsbn());
		String[] isbn = DibsDto.getIsbn().split(",");
		String sql = String.format("DELETE FROM dibsBook where isbn = '%s'", isbn[0]);
		
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

<<<<<<< HEAD
	// DB媛� 遺덈윭�삤湲�
	public ArrayList<DibsBookDTO> getDibsBookDto(int log) {
<<<<<<< HEAD
=======
	// DB값 불러오기
	public ArrayList<DibsBookDTO> getDibsBookDto() {
>>>>>>> refs/remotes/origin/#02-NaYeon
		conn = DBManager.getConnection("book");
		String sql = "select * from dibsBook";
=======
		dibs = new ArrayList<>();
		conn = DBManager.getConnection(database);
		String sql = String.format("select * from dibsBook where id = %d", log);
>>>>>>> refs/remotes/origin/nnnayeon
		
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
	
<<<<<<< HEAD
	// 梨� 遺덈윭�삱�뻹
		public int getSize(int log) {
<<<<<<< HEAD
=======
	// 책 불러올떄
		public int getSize() {
>>>>>>> refs/remotes/origin/#02-NaYeon
			conn = DBManager.getConnection("book");
			String sql = "select count(*) from dibsBook";
			
=======
			conn = DBManager.getConnection(database);
			String sql = String.format("select count(*) from dibsBook where id=%d", log);
			int size = -1;
>>>>>>> refs/remotes/origin/nnnayeon
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

}