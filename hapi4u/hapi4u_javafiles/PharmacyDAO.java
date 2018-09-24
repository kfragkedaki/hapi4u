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
				pharmacies.add( new Pharmacy( rs.getInt("id"), rs.getString("name"), rs.getString("availability"), rs.getInt("location_id"), rs.getInt("user_id")  ) );
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

	public List<Pharmacy> findPharmacies(int location) throws Exception {

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
				pharmacies.add( new Pharmacy( rs.getInt("id"), rs.getString("name"), rs.getString("availability"),rs.getInt("location_id"), rs.getInt("user_id") ) );
			}

			if( !rs.next() ) {

				rs.close();
				stmt.close();
				db.close();

				throw new Exception("Not valide location");

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
				//no need to do anything...
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

			Pharmacy pharmacy = new Pharmacy( rs.getInt("id"), rs.getString("name"), rs.getString("availability"), rs.getInt("location_id"), rs.getInt("user_id"));


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
