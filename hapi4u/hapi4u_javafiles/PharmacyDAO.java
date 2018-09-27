package hapi4u_javafiles;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class PharmacyDAO {


	public List<Pharmacy> getPharmacies() throws Exception {

		Connection con = null;

		String sqlquery= "SELECT * FROM pharmacies;";

		DB db = new DB();
		List<Pharmacy> pharmacies = new ArrayList<Pharmacy>();

		try {

			db.open(); //open connection

			con = db.getConnection(); //get Connection object

			PreparedStatement stmt = con.prepareStatement(sqlquery);

			ResultSet rs = stmt.executeQuery();

			while ( rs.next() ) {
				pharmacies.add( new Pharmacy( rs.getInt("pharmacy_id"), rs.getString("name"), rs.getString("address"), rs.getString("image"), rs.getInt("location_id"), rs.getInt("user_id")  ) );
			}

			rs.close(); //closing ResultSet
			stmt.close(); // closing PreparedStatement
			db.close(); // closing connection

			return pharmacies;

		} catch (Exception e) {

			throw new Exception( e.getMessage() );

		} finally {

			try {
				db.close();
			} catch (Exception e) {
				//no need to do anything...
			}

		}

	}

	public List<Pharmacy> findPharmaciesByLocation(int location) throws Exception {

		Connection con = null;

		String sqlquery= "SELECT * FROM pharmacies WHERE location_id=?;";

		DB db = new DB();
		List<Pharmacy> pharmacies = new ArrayList<Pharmacy>();

		try {

			db.open();

			con = db.getConnection();

			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setInt( 1, location );

			ResultSet rs = stmt.executeQuery();

			while ( rs.next() ) {
				pharmacies.add( new Pharmacy( rs.getInt("pharmacy_id"), rs.getString("name"), rs.getString("address"), rs.getString("image"),rs.getInt("location_id"), rs.getInt("user_id") ) );
			}



			rs.close(); //closing ResultSet
			stmt.close(); // closing PreparedStatement
			db.close(); // closing connection

			return pharmacies;

		} catch (Exception e) {

			throw new Exception(e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {
				throw new Exception("No coonection!");
			}

		}

	}

		public Availability getAvailability(String date) throws Exception {

			Connection con = null;

			String sqlquery= "SELECT * FROM availability WHERE date=?;";

			DB db = new DB();

			try {

				db.open();

				con = db.getConnection();

				PreparedStatement stmt = con.prepareStatement(sqlquery);
				stmt.setString( 1, date );

				ResultSet rs = stmt.executeQuery();

				if( !rs.next() ) {

					rs.close();
					stmt.close();
					db.close();

					throw new Exception ("Not valid date!");

				}

				Availability availability= new Availability( rs.getInt("availability_id"), rs.getString("date"), rs.getString("sunday"));

				rs.close(); //closing ResultSet
				stmt.close(); // closing PreparedStatement
				db.close(); // closing connection

				return availability;

			} catch (Exception e) {

				throw new Exception(e.getMessage());

			} finally {

				try {
					db.close();
				} catch (Exception e) {
					throw new Exception("No coonection!");
				}

			}

	}

		public Integer findAvailablePharmacies(int pharmacy_id, int availability_id) throws Exception {

			Connection con = null;

			String sqlquery= "SELECT * FROM my_availability WHERE pharmacy_id=? AND availability_id=?;";

			DB db = new DB();
			List<Integer> availablePharmacies = new ArrayList<Integer>();


			try {

				db.open();

				con = db.getConnection();

				PreparedStatement stmt = con.prepareStatement(sqlquery);
				stmt.setInt( 1, pharmacy_id);
				stmt.setInt( 2, availability_id);

				ResultSet rs = stmt.executeQuery();

				if ( rs.next() ) {

					rs.close(); //closing ResultSet
					stmt.close(); // closing PreparedStatement
					db.close(); // closing connection

					return 1;
				}



				rs.close(); //closing ResultSet
				stmt.close(); // closing PreparedStatement
				db.close(); // closing connection

				return 0;

			} catch (Exception e) {

				throw new Exception(e.getMessage());

			} finally {

				try {
					db.close();
				} catch (Exception e) {
					throw new Exception("No coonection!");
				}

			}

	}

	public Pharmacy findPharmacyByUserId(int user_id) throws Exception {

		Connection con = null;

		String sqlquery= "SELECT * FROM pharmacies WHERE user_id=?;";

		DB db = new DB();

		try {

			db.open();

			con = db.getConnection();

			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setInt( 1, user_id );

			ResultSet rs = stmt.executeQuery();


			if( !rs.next() ) {

				rs.close();
				stmt.close();
				db.close();

				throw new Exception ("Not valid email!");

			}

			Pharmacy pharmacy = new Pharmacy( rs.getInt("pharmacy_id"), rs.getString("name"), rs.getString("address"), rs.getString("image"), rs.getInt("location_id"), rs.getInt("user_id"));


			rs.close(); //closing ResultSet
			stmt.close(); // closing PreparedStatement
			db.close(); // closing connection

			return pharmacy;

		} catch (Exception e) {

			throw new Exception(e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {
				//no need to do anything...
			}

		}

	}





	public PharmacyDAO() {

	}

}
