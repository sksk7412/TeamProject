package teamProject;

import java.sql.Connection;
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
	
	private DibsBookDAO() {
//		list = new ArrayList<UserDTO>();
	}
	private static DibsBookDAO instance = new DibsBookDAO();
	
	public static DibsBookDAO getInstance() {
		return instance;
	}
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private String log;
	private String url = "jdbc:mysql://localhost:3306/";
	private String database = "userdata";
	private String user = "root";
	private String password = "root";
	Random ran = new Random();
	
	// DB에서 값 불러오기
	public Map getMap() {
		Map<Integer, DibsBookDTO> bookData = new HashMap<>();
		
		conn = DBManager.getConnection("book");
		String sql = "select * from dibsBook";
		pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			int id;
			String title, thumbnail, isbn, authors;
			Timestamp createAt;
			
			while(rs.next()) {
				id = rs.getInt(1);
				title = rs.getString(2);
				thumbnail = rs.getString(3);
				isbn = rs.getString(4);
				authors = rs.getString(5);
				createAt = rs.getTimestamp(6);
				
				DibsBookDTO dibs = new DibsBookDTO(id, title, thumbnail, isbn, authors, createAt);
				
				bookData.put(id, dibs);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return bookData;
	}
	
	



}