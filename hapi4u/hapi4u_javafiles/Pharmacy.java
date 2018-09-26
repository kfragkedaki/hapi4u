package hapi4u_javafiles;

import java.net.URL;

public class Pharmacy {

	private int id;
	private String name;
	private String address;
	private String img;
	private int location_id;
	private int user_id;

	/**
	 * Constructor
	 *
	 */
	public Pharmacy(int id, String name, String address, String img, int location_id, int user_id ) {

		this.id = id ;
		this.name = name;
		this.address = address;
		this.img = img;
		this.location_id = location_id;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}


	public int getLocationId() {
		return location_id;
	}

	public void setLocationId() {
		this.location_id = location_id;
	}

	public String getImage() {
		return img;
	}

	public void setImage() {
		this.img = img;
	}

} //End of class
