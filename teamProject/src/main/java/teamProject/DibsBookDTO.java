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
<<<<<<< HEAD

=======
>>>>>>> refs/remotes/origin/#02-NaYeon
=======
>>>>>>> refs/remotes/origin/nnnayeon
	public String getIsbn() {
		return isbn;
	}

<<<<<<< HEAD
<<<<<<< HEAD


=======
>>>>>>> refs/remotes/origin/#02-NaYeon
=======
>>>>>>> refs/remotes/origin/nnnayeon
	public Timestamp getCreatedAt() {
		return createdAt;
	}
<<<<<<< HEAD


<<<<<<< HEAD

=======
>>>>>>> refs/remotes/origin/#02-NaYeon
=======
>>>>>>> refs/remotes/origin/nnnayeon
}