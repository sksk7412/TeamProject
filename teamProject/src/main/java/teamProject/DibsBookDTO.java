package teamProject;

import java.sql.Timestamp;
import java.util.Date;

public class DibsBookDTO {
	
	private int id;
	private String title, thumbnail, isbn, authors;
	private Timestamp createdAt;
	
	public DibsBookDTO(String title, String thumbnail, String isbn, int id, String authors, Timestamp createdAt) {
		this.title = title;
		this.thumbnail = thumbnail;
		this.isbn = isbn;
		this.id = id;
		this.authors = authors;
		this.createdAt = createdAt;

	}

	public int getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}


	public String getThumbnail() {
		return thumbnail;
	}


	public String getIsbn() {
		return isbn;
	}


	public String getAuthors() {
		return authors;
	}


	public Timestamp getCreatedAt() {
		return createdAt;
	}

}