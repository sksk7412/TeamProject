package teamProject;

import java.sql.Timestamp;

public class MyLibraryDTO {
	
	private String title, thumbnail, isbn;
	private int id;
	private String authors, contents;
	private Timestamp modifiedAt;
	
	public MyLibraryDTO(String title, String thumbnail, String isbn, int id, String authors, String contents, Timestamp modifiedAt) {
		this.title = title;
		this.thumbnail = thumbnail;
		this.isbn = isbn;
		this.id = id;
		this.authors = authors;
		this.contents = contents;
		this.modifiedAt = modifiedAt;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAuthors() {
		return authors;
	}

	public void setAuthors(String authors) {
		this.authors = authors;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Timestamp getModifiedAt() {
		return modifiedAt;
	}

	public void setModifiedAt(Timestamp modifiedAt) {
		this.modifiedAt = modifiedAt;
	}
	
	

}
