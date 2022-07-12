package teamProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import util.DBManager;

public class BestBookDAO {
	private BestBookDAO() {}
	
	private static BestBookDAO instance = new BestBookDAO();
	
	public static BestBookDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private ArrayList<BestBookDTO> best_seller;
	private ArrayList<BestBookDTO> new_books;
	
	
	// best_seller isbn 불러오기
		public ArrayList<BestBookDTO> getBestBooks() {
			conn = DBManager.getConnection("book");
			String sql = "select * from best_book";
			
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				best_seller = new ArrayList<>();
				
				String isbn;
				
				while(rs.next()) {
					isbn = rs.getString(1);
					
					BestBookDTO dibsBookDto = new BestBookDTO(isbn);
					best_seller.add(dibsBookDto);
				}
				
				System.out.println("best executeQuery success");
				return best_seller;
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				System.out.println("best executeQuery fail");
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
		
		
		// new_books isbn 불러오기
		public ArrayList<BestBookDTO> getNewBooks() {
			conn = DBManager.getConnection("book");
			String sql = "select * from new_book";
			
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				new_books = new ArrayList<>();
				
				String isbn;
				
				while(rs.next()) {
					isbn = rs.getString(1);
					
					BestBookDTO dibsBookDto = new BestBookDTO(isbn);
					new_books.add(dibsBookDto);
				}
				
				System.out.println("new executeQuery success");
				return new_books;
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				System.out.println("new executeQuery fail");
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
}
