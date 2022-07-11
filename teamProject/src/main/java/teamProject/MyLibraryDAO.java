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
	Random ran = new Random();
	
	// DB에서 값 불러오기
	public Map getMap() {
		Map<Integer, MyLibraryDTO> myBook = new HashMap<>();
		
		conn = DBManager.getConnection("book");
		String sql = "select * from myLibrary";
		pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			String title, thumbnail, isbn;
			int id;
			String authors, contents;
			Timestamp modifiedAt;
			
			while(rs.next()) {
				title = rs.getString(1);
				thumbnail = rs.getString(2);
				isbn = rs.getString(3);
				id = rs.getInt(4);
				authors = rs.getString(5);
				contents = rs.getString(6);
				modifiedAt = rs.getTimestamp(7);
				
				MyLibraryDTO li = new MyLibraryDTO(title, thumbnail, isbn, id, authors, contents, modifiedAt); 
				
				myBook.put(id, li);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return myBook;
	}
	
	// DB에 값 넣기
	public int addBook(MyLibraryDTO LibraryDto) {
		conn = DBManager.getConnection(database);
		System.out.println("conn: " + conn);
		String SQL = "INSERT INTO board VALUES (?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, LibraryDto.getTitle());
			pstmt.setString(2, LibraryDto.getThumbnail());
			pstmt.setString(3, LibraryDto.getIsbn());
			pstmt.setInt(5, LibraryDto.getId());
			pstmt.setString(6, LibraryDto.getAuthors());
			pstmt.setString(7, LibraryDto.getContents());
			Timestamp modifiedAt = new Timestamp(System.currentTimeMillis());
			pstmt.setTimestamp(8, modifiedAt);
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return -1;
	}

}
