package hapi4u_javafiles;

public class Availability {

	private int availability_id;
	private String date;
	private String sunday;

	public Availability(int availability_id, String date, String sunday) {

		this.availability_id = availability_id;
		this.date = date;
		this.sunday = sunday;
	}

	/*Getters and Setters*/


	public int getAvailabilityId() {
		return availability_id;
	}

	public void setAvailabilityId(int availability_id) {
		this.availability_id = availability_id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getSunday() {
		return sunday;
	}

	public void setSunday(String sunday) {
		this.sunday = sunday;
	}

} //End of class
