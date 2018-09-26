package hapi4u_javafiles;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class LocationDAO {


	public List<Location> getLocations(String city, String region) throws Exception {

		Connection con = null;

		String sqlquery= "SELECT * FROM locations WHERE city=? AND region=?;";

		DB db = new DB();
		List<Location> locations = new ArrayList<Location>();

		try {

			db.open(); //open connection

			con = db.getConnection(); //get Connection object

			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setString( 1, city );
			stmt.setString( 2, region );

			ResultSet rs = stmt.executeQuery();

			while ( rs.next() ) {
				locations.add( new Location( rs.getInt("location_id"), rs.getString("area"), rs.getString("city"), rs.getString("region"), rs.getInt("postalcode") ));
			}

			rs.close(); //closing ResultSet
			stmt.close(); // closing PreparedStatement
			db.close(); // closing connection

			return locations;

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

	public Location getLocationByID(int location_id) throws Exception {

		Connection con = null;

		String sqlquery= "SELECT * FROM locations WHERE location_id=?;";

		DB db = new DB();

		try {

			db.open();

			con = db.getConnection();

			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setInt( 1, location_id );

			ResultSet rs = stmt.executeQuery();


			if( !rs.next() ) {

				rs.close();
				stmt.close();
				db.close();

				throw new Exception ("Not valid email!");

			}

			Location location = new Location( rs.getInt("location_id"), rs.getString("area"), rs.getString("city"), rs.getString("region"), rs.getInt("postalcode"));


			rs.close(); //closing ResultSet
			stmt.close(); // closing PreparedStatement
			db.close(); // closing connection

			return location;

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

	public LocationDAO() {

	}

}