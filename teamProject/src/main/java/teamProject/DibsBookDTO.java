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

	public String getIsbn() {
		return isbn;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}


}