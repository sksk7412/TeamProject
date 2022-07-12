package teamProject;

import java.sql.Timestamp;
import java.util.Date;

public class DibsBookDTO {
	
	private int id;
	private String isbn;
	private Timestamp createdAt;
	
	public DibsBookDTO(int id, String isbn, Timestamp createdAt) {
		this.id = id;
		this.isbn = isbn;
		this.createdAt = createdAt;

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}


}