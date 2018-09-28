package hapi4u_javafiles;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MyFavouritesDAO {

	public List<MyFavourites> getMyFavourites() throws Exception {

		Connection con = null;

		String sqlquery= "SELECT * FROM myfavourites;";
		List<MyFavourites> myfavourites = new ArrayList<MyFavourites>();

		DB db = new DB();
		try {

			db.open();

			con = db.getConnection();

			PreparedStatement stmt = con.prepareStatement(sqlquery);

			ResultSet rs = stmt.executeQuery();

			while( rs.next()){
				 myfavourites.add(new MyFavourites( rs.getInt("myfavourites_id"), rs.getInt("user_id"), rs.getInt("pharmacy_id") ));
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

	public List<Integer> getMyFavouritesByUserId(int user_id) throws Exception {

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

	public int getMyFavouritesId(int user_id, int pharmacy_id) throws Exception {

		Connection con = null;

		String sqlquery= "SELECT * FROM myfavourites WHERE user_id=? and pharmacy_id=?;";

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

				return -1;

			}

			int myfavourites_id = rs.getInt("myfavourites_id");

			rs.close(); //closing ResultSet
			stmt.close(); // closing PreparedStatement
			db.close(); // closing connection

			return myfavourites_id;

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

	public void saveMyFavourites ( int user_id, int pharmacy_id) throws Exception {

		Connection con = null;

		String sqlquery= "INSERT INTO myfavourites VALUES (?, ?, ?);";

		DB db = new DB();

		try {

			db.open();

			con = db.getConnection();

			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setInt( 1, getMyFavourites().size() + 1 );
			stmt.setInt( 2, user_id );
			stmt.setInt( 3, pharmacy_id );

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

	public void changeMyFavouritesIds ( int myfavourites_id) throws Exception {

		Connection con = null;

		String sqlquery= "UPDATE myfavourites SET myfavourites_id=? WHERE myfavourites_id=?;";

		DB db = new DB();

		try {

			db.open();

			con = db.getConnection();

			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setInt( 1, myfavourites_id -1);
			stmt.setInt( 2, myfavourites_id);

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

	public void deleteMyFavourites ( int user_id, int pharmacy_id) throws Exception {

		Connection con = null;

		String sqlquery= "DELETE FROM myfavourites WHERE user_id=? and pharmacy_id=?;";

		DB db = new DB();

		try {

			db.open();

			con = db.getConnection();

			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setInt( 1, user_id );
			stmt.setInt( 2, pharmacy_id );

			stmt.executeUpdate();

			stmt.close(); // closing PreparedStatement
			db.close(); // closing connection

			int myfavourites_id = getMyFavouritesId( user_id, pharmacy_id );
			int size = getMyFavourites().size() - myfavourites_id;
			for (int i=0; i < size ; i++) {
				myfavourites_id = myfavourites_id +1;
				changeMyFavouritesIds(myfavourites_id);
			}


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