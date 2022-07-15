package teamProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBManager;

public class BoardDAO {
	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;

	public boolean addReview(BoardDTO board) {
		conn = DBManager.getConnection("book");
		
		int log = board.getLog();
		int isbn = board.getIsbn();
		String contents = board.getContents();
		String createdAt = String.valueOf(board.getCreatedAt());
		String sql=String.format("insert into board(userId,isbn,contents,createdAt) values('%d','%s','%s','%s')",log,isbn,contents,createdAt);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.execute();
			
			return true;
		} catch (Exception e) { // TODO: handle exception } }
			e.printStackTrace();
			System.out.println("추가 실패");
		}finally {
			try {
				conn.close();
				pstmt.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return false;
	}
	
	public int getSize() {
		conn = DBManager.getConnection("book");
		String sql = "select count(*) from board";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			rs.next();
			int size = rs.getInt(1);
			
			System.out.println(size);
			return size;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return -1;
	}
	
	
}