package hapi4u_javafiles;

import java.net.URL;

public class Administrator {

	private int id;
	private String name;
	private String img;
	private int user_id;

	/**
	 * Constructor
	 *
	 */
	public Administrator(int id, String name, String img, int user_id ) {

		this.id = id ;
		this.name = name;
		this.img = img;
		this.user_id = user_id;
	}

	/*Getters and Setters*/

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}


	public String getImage() {
		return img;
	}

	public void setImage() {
		this.img = img;
	}

} //End of class
