package hapi4u_javafiles;

public class Message {

	private String title;
	private String name;
	private String email;
	private String message;
	private int pharmacy_id;
	private int admin_id;
	private boolean checked;


	/**
	 * Constructor
	 *
	 * @param username, String
	 * @param password, String
	 * @param email, String
	 */
	public Message( String title, String name, String email, String message, int pharmacy_id, int admin_id, boolean checked) {

		this.title = title;
		this.name = name;
	    this.email = email;
		this.message = message;
		this.pharmacy_id = pharmacy_id;
		this.admin_id = admin_id;
		this.checked = checked;
	}

	/*Getters and Setters*/


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name){
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message){
		this.message = message;
	}

	public int getPharmacyId() {
		return pharmacy_id;
	}

	public void setPharmacyId(int pharmacy_id) {
		this.pharmacy_id = pharmacy_id;
	}

	public int getAdminId() {
		return admin_id;
	}

	public void setAdminId(int admin_id) {
		this.admin_id = admin_id;
	}

	public boolean getIfChecked(){
		return checked;
	}

	public void setIfChecked(boolean checked){
		this.checked = checked;
	}



} //End of class
