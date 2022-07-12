package teamProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Random;
import util.DBManager;
import java.util.HashMap;
import java.util.Map;

public class MyLibraryDAO {
	
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private String log;
	private String url = "jdbc:mysql://localhost:3306/";
	private String database = "book";
	private String user = "root";
	private String password = "root";
	private Random ran = new Random();
	
	private MyLibraryDAO() {}
	private static MyLibraryDAO instance = new MyLibraryDAO();
	
	public static MyLibraryDAO getInstance() {
		return instance;
	}
	
	// DB에서 값 불러오기
	public Map getMap() {
		Map<Integer, MyLibraryDTO> myBook = new HashMap<>();
		
		conn = DBManager.getConnection("book");
		String sql = "select * from myLibrary";
		pstmt = null;
		
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
				
				MyLibraryDTO li = new MyLibraryDTO(id, isbn, modifiedAt);
				myBook.put(Integer.parseInt(isbn), li);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return myBook;
	}
	
	// DB에 값 넣기
//	public int addBook(MyLibraryDTO LibraryDto) {
//		conn = DBManager.getConnection(database);
//		System.out.println("conn: " + conn);
//		String SQL = "INSERT INTO board VALUES (?,?,?,?,?,?,?)";
//		
//		try {
//			pstmt = conn.prepareStatement(SQL);
//			
//			pstmt.setString(1, LibraryDto.getTitle());
//			pstmt.setString(2, LibraryDto.getThumbnail());
//			pstmt.setString(3, LibraryDto.getIsbn());
//			pstmt.setInt(5, LibraryDto.getId());
//			pstmt.setString(6, LibraryDto.getAuthors());
//			pstmt.setString(7, LibraryDto.getContents());
//			Timestamp modifiedAt = new Timestamp(System.currentTimeMillis());
//			pstmt.setTimestamp(8, modifiedAt);
//			
//			return pstmt.executeUpdate();
//			
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//		return -1;
//	}

}
