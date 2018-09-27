package hapi4u_javafiles;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class AdministratorDAO {



	public Administrator findAdminByUserId(int user_id) throws Exception {

		Connection con = null;

		String sqlquery= "SELECT * FROM administrators WHERE user_id=?;";

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

				throw new Exception ("Not valid!");

			}

			Administrator admin = new Administrator( rs.getInt("pharmacy_id"), rs.getString("name"), rs.getString("image"), rs.getInt("user_id"));


			rs.close(); //closing ResultSet
			stmt.close(); // closing PreparedStatement
			db.close(); // closing connection

			return admin;

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

	public Boolean findUserIdInAdministrator(int user_id) throws Exception {

		Connection con = null;

		String sqlquery= "SELECT * FROM administrators WHERE user_id=?;";

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

				return false;
			}else{

				rs.close();
				stmt.close();
				db.close();

				return true;
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


	public AdministratorDAO() {

	}

}
