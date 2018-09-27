package hapi4u_javafiles;

public class MyFavourites {

	private int myfavourites_id;
	private int user_id;
	private int pharmacy_id;

	public MyFavourites(int myfavourites_id, int user_id, int pharmacy_id) {

		this.myfavourites_id = myfavourites_id;
		this.user_id = user_id;
		this.pharmacy_id = pharmacy_id;
	}

	/*Getters and Setters*/

	public int getMyfavouritesId() {
		return myfavourites_id;
	}

	public void setMyfavouritesId(int myfavourites_id) {
		this.myfavourites_id = myfavourites_id;
	}

	public int getUserId() {
		return user_id;
	}

	public void setUserId(int user_id) {
		this.user_id = user_id;
	}

	public int getPharmacyId() {
		return pharmacy_id;
	}

	public void setPharmacyId(int pharmacy_id) {
		this.pharmacy_id = pharmacy_id;
	}
} //End of class