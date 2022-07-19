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
	private ArrayList<BoardDTO> dibs = new ArrayList<>();
	
	
	public boolean addReview(BoardDTO board) {
		conn = DBManager.getConnection("book");
		
		int log = board.getLog();
		String isbn = board.getIsbn();
		String contents = board.getContents();
		String createdAt = String.valueOf(board.getCreatedAt());
		String sql = String.format("insert into board(userId,isbn,contents,createdAt) values('%d','%s','%s','%s')",log,isbn,contents,createdAt);
		
		String update = String.format("update myLibrary set isReviewed = '1' where id = %d and isbn = '%s'", log, isbn);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.execute();
			pstmt = conn.prepareStatement(update);
			pstmt.execute();
			System.out.println("리뷰 작성");
			return true;
		} catch (Exception e) { // TODO: handle exception } }
			e.printStackTrace();
			System.out.println("리뷰작성 시ㄹ패");
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
	
		// DB값 불러오기
		public ArrayList<BoardDTO> getBoardDto(int lsbn) {
			
			conn = DBManager.getConnection("book");
			String sql = "select * from Board";
			
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				System.out.println(rs);
				
				int id;
				String contents;
				Timestamp createAt;
				
				while(rs.next()) {
					id = rs.getInt(1);
					contents = rs.getString(3);
					createAt = rs.getTimestamp(4);
					
					BoardDTO dibsBookDto = new BoardDTO(id, contents, createAt);
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