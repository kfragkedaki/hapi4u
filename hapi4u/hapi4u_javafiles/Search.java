package hapi4u_javafiles;

import java.util.List;
import java.util.ArrayList;
import java.util.Date;
import java.sql.Time;

public class Search {

	private List<String> locations = new ArrayList<String>();
	private Date date = new Date();
	private Time time;

	/**
	 * Constructor
	 *
	 * @param location, List<String>
	 * @param date, Date
	 * @param time, Time
	 */

	public Search(List<String> locations, Date date, Time time) {

		this.locations = locations;
		this.date = date;
		this.time = time;
	}

	/*Getters and Setters*/


	public List<String> getLocations() {
		return locations;
	}

	public void setLocations(List<String> locations) {
		this.locations = locations;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Time getTime() {
		return time;
	}

	public void setTime(Time time) {
		this.time = time;
	}

} //End of class
