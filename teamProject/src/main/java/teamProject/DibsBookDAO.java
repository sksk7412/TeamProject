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
	private String database = "book";
	Random ran = new Random();
	
	private ArrayList<DibsBookDTO> dibs = new ArrayList<>();
	
	// DB값 넣기
	public boolean addWrite(DibsBookDTO BoardDto) { 
		
		conn = DBManager.getConnection(database);
		System.out.println("conn: "+conn);	
	//	String sql = "INSERT INTO dibsBook VALUES (?,?,?)";
				
		String sql = String.format("insert into dibsBook values('%s','%s','%s')", BoardDto.getId(), BoardDto.getIsbn(), BoardDto.getCreatedAt());
		
		// 아이디 정보 찜 날짜~	
		try {
			
			System.out.println("code: "+BoardDto.getId());
			pstmt = conn.prepareStatement(sql);
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

	// DB값 불러오기
	public ArrayList<DibsBookDTO> getDibsBookDto(int log) {
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
		public int getSize(int log) {
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