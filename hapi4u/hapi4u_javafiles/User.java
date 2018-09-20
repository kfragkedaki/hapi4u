package hapi4u_javafiles;

public class User {

	private String username;
	private String password;
	private String email;

	/**
	 * Constructor
	 *
	 * @param username, String
	 * @param password, String
	 * @param email, String
	 */
	public User(String email, String password) {
		this.password = password;
		this.email = email;
	}

	/*Getters and Setters*/


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

} //End of class
