package hapi4u_javafiles;

public class Location {

	private int location_id;
	private String area;
	private String city;
	private String region;
	private int postalcode;

	/**
	 * Constructor
	 *
	 */
	public Location(int location_id, String area, String city, String region, int postalcode) {

		this.location_id = location_id;
		this.area = area;
		this.city = city;
		this.region = region;
		this.postalcode = postalcode;
	}

	/*Getters and Setters*/

	public int getLocationId() {
		return location_id;
	}

	public void setLocationId(int id) {
		this.location_id = location_id;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public int getPostalcode() {
		return postalcode;
	}

	public void setPostalcode(int postalcode) {
		this.postalcode = postalcode;
	}

} //End of class
