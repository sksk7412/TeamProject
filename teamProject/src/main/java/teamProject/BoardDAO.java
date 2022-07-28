package teamProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import util.DBManager;

public class BoardDAO {
	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private ArrayList<BoardDTO> reviewList;
	
	// 작성한 리뷰 db에 넣기
	public boolean addReview(BoardDTO board) {
		conn = DBManager.getConnection("book");
		
		String userId = findUserId(board.getLog());
		
		if(userId == null)
			return false;
		
		String isbn = board.getIsbn();
		String contents = board.getContents();
		String createdAt = String.valueOf(board.getCreatedAt());
		String sql = String.format("insert into board(userId,isbn,contents,createdAt) values('%s','%s','%s','%s')",userId,isbn,contents,createdAt);
		
		String update = String.format("update myLibrary set isReviewed = '1' where userId = '%s' and isbn = '%s'", userId, isbn);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.execute();
			pstmt = conn.prepareStatement(update);
			pstmt.execute();
			
			System.out.println("리뷰 작성");
			return true;
		} catch (Exception e) { // TODO: handle exception } }
			e.printStackTrace();
			System.out.println("리뷰작성 실패");
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
	
	// userId 찾기
	private String findUserId(int log) {
		conn = DBManager.getConnection("book");
		
		String sql = String.format("select * from users where id = %d", log);
		
		String userId = "";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				userId = rs.getString(2);
			}
			
			return userId;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("유저 아이디 찾기 실");
		}
		return null;
	}
	
		// DB값 불러오기
		public ArrayList<BoardDTO> getBoardDto(String isbn) {
			reviewList = new ArrayList<>();

			conn = DBManager.getConnection("book");
			String sql = String.format("select * from board where isbn ='%s'", isbn);
			
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				String userId;
				String contents;
				Timestamp createdAt;
				
				while(rs.next()) {
					userId = rs.getString(2);
					contents = rs.getString(4);
					createdAt = rs.getTimestamp(5);
					
					BoardDTO review = new BoardDTO(userId, contents, createdAt);
					reviewList.add(review);
				}
				
				System.out.println("리뷰 리스트 불러오기 성공");
				return reviewList;
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				System.out.println("리뷰 리스트 불러오기 실패");
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
		
		public void isReviewed() {
			
		}
		
		
}
