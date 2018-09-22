package hapi4u_javafiles;

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
	public List<User> getUsers() {

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

	}

	/**
	 * Search user by username
	 *
	 * @param username, String
	 * @return User, the User object
	 * @throws Exception, if user not found
	 */
	public User findUser(String email) throws Exception {

		List<User> users = getUsers();

		for (User user : users) {

			if ( user.getEmail().equals(email) ) {
				return user;
			}

		}

		throw new Exception("User with username: " + email + " does not exist");
	}

	/**
	 * Checks if the credentials are valid.
	 *
	 * @param username
	 * @param password
	 * @throws Exception, if the credentials are not valid
	 */
	public void authenticate(String email, String password) throws Exception {

		List<User> users = getUsers();

		for (User user : users) {

			if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
				return; // credentials are valid, so do nothing (return)
			}

		}

		throw new Exception("Wrong email or password");
	}

	public UserDAO() {

	}

}
