package hapi4u_javafiles;

public class Location {

	private int id;
	private String city;
	private String area;
	private String zipcode;

	/**
	 * Constructor
	 *
	 */
	public Location(int id, String city, String area, String zipcode) {

		this.id = id;
		this.city = city;
		this.area = area;
		this.zipcode = zipcode;
	}

	/*Getters and Setters*/

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String Area) {
		this.area = area;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String Zipcode) {
		this.zipcode = zipcode;
	}

} //End of class
