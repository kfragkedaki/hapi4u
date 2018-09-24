package hapi4u_javafiles;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * UserDAO provides all the necessary methods for "handling" user's data.
 * In further lessons we will change all the code of the body of the methods and use
 * JDBC API in order to handle (real) user's data from a database.
 *
 * @author sofos@aueb.gr
 *
 */
public class UserDAO {

	/**
	 * This method returns a List with all Users
	 *
	 * @return List<User>
	 */
/*	public List<User> getUsers() {

		List<User> users = new ArrayList<User>();

		// adding some users for the sake of the example
		users.add(new User("phoebe_buffay@gmail.com", "1111"));
		users.add(new User("rachel_green@gmail.com", "2222"));
		users.add(new User("ross_geller@gmail.com", "3333"));
		users.add(new User("chadler_bing@gmail.com", "4444"));
		users.add(new User("joey_tribbiani@gmail.com", "5555"));
		users.add(new User("monica_geller@gmail.com", "6666"));
		users.add(new User("pharmacy_haimalis@gmail.com", "7777"));


		return users;

	} */
	public List<User> getUsers() throws Exception {

		Connection con = null;

		String sqlquery= "SELECT * FROM users;";

		DB db = new DB();
		List<User> users = new ArrayList<User>();

		try {

			db.open(); //open connection

			con = db.getConnection(); //get Connection object

			PreparedStatement stmt = con.prepareStatement(sqlquery);

			ResultSet rs = stmt.executeQuery();

			while ( rs.next() ) {
				users.add( new User( rs.getInt("user_id"), rs.getString("email"), rs.getString("password"), rs.getString("pharmacy"), rs.getString("administrator") ) );
			}

			rs.close(); //closing ResultSet
			stmt.close(); // closing PreparedStatement
			db.close(); // closing connection

			return users;

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
	/**
	 * Search user by username
	 *
	 * @param username, String
	 * @return User, the User object
	 * @throws Exception, if user not found
	 */
/*	public User findUser(String email) throws Exception {

		List<User> users = getUsers();

		for (User user : users) {

			if ( user.getEmail().equals(email) ) {
				return user;
			}

		}

		throw new Exception("User with username: " + email + " does not exist");
	} */
	public User findUser(String email) throws Exception {

		Connection con = null;

		String sqlquery= "SELECT * FROM users WHERE email=?;";


		DB db = new DB();


		try {

			db.open();

			con = db.getConnection();

			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setString( 1, email );

			ResultSet rs = stmt.executeQuery();
			if( !rs.next() ) {

				rs.close();
				stmt.close();
				db.close();

				throw new Exception ("Not valid email");

			}
			User user = new User( rs.getInt("user_id"), rs.getString("email"), rs.getString("password"), rs.getString("pharmacy"), rs.getString("administrator") );

			rs.close(); //closing ResultSet
			stmt.close(); // closing PreparedStatement
			db.close(); // closing connection

			return user;

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

	/**
	 * Checks if the credentials are valid.
	 *
	 * @param username
	 * @param password
	 * @throws Exception, if the credentials are not valid
	 */
/*	public void authenticate(String email, String password) throws Exception {

		List<User> users = getUsers();

		for (User user : users) {

			if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
				return; // credentials are valid, so do nothing (return)
			}

		}

		throw new Exception("Wrong email or password");
	}*/

	public void authenticateUser(String email, String password) throws Exception {

		Connection con = null;

		String sqlquery= "SELECT * FROM users WHERE email=? AND password=?;";

		DB db = new DB();
		try {

			db.open();

			con = db.getConnection();

			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setString( 1, email );
			stmt.setString( 2, password );

			ResultSet rs = stmt.executeQuery();


			if(!rs.next() ) {
				rs.close();
				stmt.close();
				db.close();
				throw new Exception("Wrong username or password");
			}

			rs.close();
			stmt.close();
			db.close();

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


	public void saveUser(User user) throws Exception {

		Connection con = null;

		String sqlquery= "INSERT INTO users VALUES (?, ?, ? ,? , ?);";

		DB db = new DB();

		try {

			db.open();

			con = db.getConnection();

			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setInt( 1, user.getUserId() );
			stmt.setString( 2, user.getEmail() );
			stmt.setString( 3, user.getPassword() );
			stmt.setString( 4, user.getIfPharmacy() );
			stmt.setString( 5, user.getIfAdministrator() );

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

	} //End of saveUser

	public UserDAO() {

	}

}
