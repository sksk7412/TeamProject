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

<<<<<<< HEAD

=======
>>>>>>> refs/remotes/origin/#02-NaYeon
	public String getIsbn() {
		return isbn;
	}

<<<<<<< HEAD


=======
>>>>>>> refs/remotes/origin/#02-NaYeon
	public Timestamp getCreatedAt() {
		return createdAt;
	}
<<<<<<< HEAD



=======
>>>>>>> refs/remotes/origin/#02-NaYeon
}