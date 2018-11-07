package hapi4u_javafiles;

public class Message {

	private int message_id;
	private String title;
	private String name;
	private String email;
	private String message;
	private int user_id;
	private String date;


	/**
	 * Constructor
	 *
	 * @param username, String
	 * @param password, String
	 * @param email, String
	 */
	public Message( int message_id,String title, String name, String email, String message ,String date, int user_id) {

		this.message_id = message_id;
		this.title = title;
		this.name = name;
	    this.email = email;
		this.message = message;
		this.user_id = user_id;
		this.date = date;
	}

	/*Getters and Setters*/


	public int getMessageId() {
		return message_id;
	}

	public void setMessageId(int message_id) {
		this.message_id = message_id;
	}


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

	public int getUserId() {
		return user_id;
	}

	public void setUserId(int user_id) {
		this.user_id = user_id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}



} //End of class
