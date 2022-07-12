package teamProject;

import java.sql.Timestamp;

public class MyLibraryDTO {
	
	private int id;
	private String isbn;
	private Timestamp modifiedAt;
	
	public MyLibraryDTO(int id, String isbn, Timestamp modifiedAt) {
		this.id = id;
		this.isbn = isbn;
		this.modifiedAt = modifiedAt;
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

	public Timestamp getModifiedAt() {
		return modifiedAt;
	}

	public void setModifiedAt(Timestamp modifiedAt) {
		this.modifiedAt = modifiedAt;
	}

	
}
