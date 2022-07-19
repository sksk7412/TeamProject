package teamProject;

public class UserDTO {
	private int id;
	private String userId, userPw, name, mobile;
	
	public UserDTO(String userId, String userPw, String name, String mobile) {
		this.userId = userId;
		this.userPw = userPw;
		this.name = name;
		this.mobile = mobile;
	}
	 
	
	public UserDTO(String userId, String userPw) {
		this.userId = userId;
		this.userPw = userPw;
	}

	public UserDTO(String userId) {
		this.userId = userId;
	}

	public int getId() {
		return id;
	}


	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

}

