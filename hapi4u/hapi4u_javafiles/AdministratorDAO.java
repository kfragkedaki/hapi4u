package hapi4u_javafiles;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class AdministratorDAO {


	public List<Administrator> getAdministrators() throws Exception {

		Connection con = null;

		String sqlquery= "SELECT * FROM administrators;";

		DB db = new DB();
		List<Administrator> admin = new ArrayList<Administrator>();

		try {

			db.open(); //open connection

			con = db.getConnection(); //get Connection object

			PreparedStatement stmt = con.prepareStatement(sqlquery);

			ResultSet rs = stmt.executeQuery();

			while ( rs.next() ) {
				admin.add( new Administrator( rs.getInt("admin_id"), rs.getString("name"), rs.getString("img"), rs.getInt("user_id")));
			}

			rs.close(); //closing ResultSet
			stmt.close(); // closing PreparedStatement
			db.close(); // closing connection

			return admin;

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

			Administrator admin = new Administrator( rs.getInt("admin_id"), rs.getString("name"), rs.getString("img"), rs.getInt("user_id"));


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



	public AdministratorDAO() {

	}

}
