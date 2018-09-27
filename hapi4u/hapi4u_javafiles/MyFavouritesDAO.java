package hapi4u_javafiles;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MyFavouritesDAO {

	public List<Integer> getMyFavourites(int user_id) throws Exception {

		Connection con = null;

		String sqlquery= "SELECT * FROM myfavourites WHERE user_id=?;";
		List<Integer> myfavourites = new ArrayList<Integer>();

		DB db = new DB();


		try {

			db.open();

			con = db.getConnection();

			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setInt( 1, user_id );

			ResultSet rs = stmt.executeQuery();

			while( rs.next()){
				 myfavourites.add(rs.getInt("pharmacy_id"));
			}

			rs.close(); //closing ResultSet
			stmt.close(); // closing PreparedStatement
			db.close(); // closing connection

			return myfavourites;

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

	public void saveMyFavourites (MyFavourites myfavourites) throws Exception {

		Connection con = null;

		String sqlquery= "INSERT INTO myfavourites VALUES (?, ?, ?);";

		DB db = new DB();

		try {

			db.open();

			con = db.getConnection();

			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setInt( 1, myfavourites.getMyfavouritesId() );
			stmt.setInt( 2, myfavourites.getUserId() );
			stmt.setInt( 3, myfavourites.getPharmacyId() );

			stmt.executeUpdate();

			stmt.close(); // closing PreparedStatement
			db.close(); // closing connection


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

}