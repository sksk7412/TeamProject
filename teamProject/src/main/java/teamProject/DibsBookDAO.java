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
	private String database = "userdata";
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
			
			pstmt.setInt(1, BoardDto.getNo());
			pstmt.setInt(2, BoardDto.getCode());
			pstmt.setString(3, BoardDto.getTitle());
			pstmt.setString(4, BoardDto.getContents());
			pstmt.setInt(5, BoardDto.getViewCnt());
			pstmt.setInt(6, BoardDto.getLikeCnt());
			Timestamp createAt = new Timestamp(System.currentTimeMillis());
			//pstmt.setString(4, createAt.toString());
			pstmt.setTimestamp(7, createAt);
			pstmt.setTimestamp(8, null);
				
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}



}
