package teamProject;

import java.sql.Timestamp;

public class BoardDTO {
	
	private int log;
	private int isbn;
	private String contents;
	private Timestamp createdAt;
	
	public BoardDTO(int log, int isbn, String contents, Timestamp createdAt) {
		this.log = log;
		this.isbn = isbn;
		this.contents = contents;
		this.createdAt = createdAt;
	}
	public BoardDTO(int log, String contents, Timestamp createdAt) {
		this.log = log;
		this.contents = contents;
		this.createdAt = createdAt;
	}

	public int getLog() {
		return log;
	}

	public void setLog(int log) {
		this.log = log;
	}

	public int getIsbn() {
		return isbn;
	}

	public void setIsbn(int isbn) {
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