package teamProject;

import java.sql.Timestamp;

public class BoardDTO {
	private int log;
	private String userId;
	private String isbn;
	private String contents;
	private Timestamp createdAt;
	
	public BoardDTO(String userId, String isbn, String contents, Timestamp createdAt) {
		this.userId = userId;
		this.isbn = isbn;
		this.contents = contents;
		this.createdAt = createdAt;
	}
	
	public BoardDTO(String userId, String contents, Timestamp createdAt) {
		this.userId = userId;
		this.contents = contents;
		this.createdAt = createdAt;
	}
	
	public BoardDTO(int log, String isbn, String contents, Timestamp createdAt) {
		this.log = log;
		this.isbn = isbn;
		this.contents = contents;
		this.createdAt = createdAt;
	}
	
	public int getLog() {
		return log;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	
}