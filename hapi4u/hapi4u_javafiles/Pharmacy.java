package hapi4u_javafiles;

public class Pharmacy {

	private int id;
	private String name;
	private String availability;
	private String email;
	private String password;
	private int location_id;

	/**
	 * Constructor
	 *
	 */
	public Pharmacy(int id, String name, String availability, String email, String password, int location_id ) {

		this.id = id ;
		this.name = name;
		this.availability = availability;
		this.email = email;
		this.password = password;
		this.location_id = location_id;
	}

	public Pharmacy(){}
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

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
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

	public int getLocationId() {
		return location_id;
	}

	public void setLocationId() {
		this.location_id = location_id;
	}

} //End of class
