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
import util.DBmanager;

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
	private String database = "book";
	private String user = "root";
	private String password = "root";
	Random ran = new Random();
	
	public int addWrite(DibsBookDTO BoardDto) {
		
		conn = DBmanager.getConnection(database);
		System.out.println("conn: "+conn);	
		String SQL = "INSERT INTO board VALUES (?,?,?,?,?,?,?,?)";
 	
		try {
			
			System.out.println("code: "+BoardDto.getId());
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, BoardDto.getTitle());
			pstmt.setString(2, BoardDto.getThumbnail());
			pstmt.setString(3, BoardDto.getIsbn());
			pstmt.setInt(4, log);
			pstmt.setString(5, BoardDto.getAuthors());
			Timestamp createAt = new Timestamp(System.currentTimeMillis());
			//pstmt.setString(4, createAt.toString());
			pstmt.setTimestamp(6, createAt);

				
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	// DB에서 값 불러오기
		public Map getMap() {
			Map<Integer, DibsBookDTO> bookData = new HashMap<>();
			
			conn = DBmanager.getConnection("book");
			String sql = "select * from dibsBook";
			pstmt = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				int id;
				String title, thumbnail, isbn, authors;
				Timestamp createAt;
				
				while(rs.next()) {
					title = rs.getString(1);
					thumbnail = rs.getString(2);
					isbn = rs.getString(3);
					id = rs.getInt(4);
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
