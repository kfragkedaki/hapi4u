package hapi4u_javafiles;

public class User {

	private int user_id;
	private String password;
	private String email;
	private String pharmacy;
	private String administrator;


	/**
	 * Constructor
	 *
	 * @param username, String
	 * @param password, String
	 * @param email, String
	 */
	public User(int user_id, String email, String password, String pharmacy, String administrator) {

		this.user_id = user_id;
		this.email = email;
		this.password = password;
	    this.pharmacy = pharmacy;
		this.administrator = administrator;
	}

	/*Getters and Setters*/


	public int getUserId() {
		return user_id;
	}

	public void setUserId(int user_id) {
		this.user_id = user_id;
	}

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
	public String getIfPharmacy() {
		return pharmacy;
	}
	public void setIfPharmacy(String pharmacy){
		this.pharmacy = pharmacy;
	}
	public String getIfAdministrator(){
		return administrator;
	}
	public void setIfAdministrator(){
		this.administrator = administrator;
	}

} //End of class
