package hapi4u_javafiles;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * messageDAO provides all the necessary methods for "handling" message's data.
 */
public class MessageDAO {

	/**
	 * This method returns a List with all Messages
	 *
	 * @return List<User>
	 */
	public List<Message> getMessagesByPharmacyId(int pharmacy_id) throws Exception {

		Connection con = null;

		String sqlquery= "SELECT * FROM messages WHERE pharmacy_id=?;";

		DB db = new DB();
		List<Message> messages = new ArrayList<Message>();

		try {

			db.open(); //open connection

			con = db.getConnection(); //get Connection object

			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setInt( 1, pharmacy_id );

			ResultSet rs = stmt.executeQuery();

			while ( rs.next() ) {
				messages.add( new Message( rs.getInt("message_id"),rs.getString("title"), rs.getString("name"), rs.getString("email"), rs.getString("message"), rs.getString("date"), rs.getInt("pharmacy_id"), rs.getInt("admin_id") ) );
			}

			rs.close(); //closing ResultSet
			stmt.close(); // closing PreparedStatement
			db.close(); // closing connection

			return messages;

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

	public List<Message> getMessagesByAdminId(int admin_id) throws Exception {

		Connection con = null;

		String sqlquery= "SELECT * FROM messages WHERE admin_id=?;";

		DB db = new DB();
		List<Message> messages = new ArrayList<Message>();

		try {

			db.open(); //open connection

			con = db.getConnection(); //get Connection object

			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setInt( 1, admin_id );

			ResultSet rs = stmt.executeQuery();

			while ( rs.next() ) {
				messages.add( new Message( rs.getInt("message_id"),rs.getString("title"), rs.getString("name"), rs.getString("email"), rs.getString("message"), rs.getString("date"), rs.getInt("pharmacy_id"), rs.getInt("admin_id") ) );
			}

			rs.close(); //closing ResultSet
			stmt.close(); // closing PreparedStatement
			db.close(); // closing connection

			return messages;

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

	public List<Message> getMessages() throws Exception {

		Connection con = null;

		String sqlquery= "SELECT * FROM messages;";

		DB db = new DB();
		List<Message> messages = new ArrayList<Message>();

		try {

			db.open(); //open connection

			con = db.getConnection(); //get Connection object

			PreparedStatement stmt = con.prepareStatement(sqlquery);

			ResultSet rs = stmt.executeQuery();

			while ( rs.next() ) {
				messages.add( new Message( rs.getInt("message_id"),rs.getString("title"), rs.getString("name"), rs.getString("email"), rs.getString("message"), rs.getString("date"), rs.getInt("pharmacy_id"), rs.getInt("admin_id") ) );
			}

			rs.close(); //closing ResultSet
			stmt.close(); // closing PreparedStatement
			db.close(); // closing connection

			return messages;

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

		Connection con = null;

		String sqlquery= "INSERT INTO messages (title,name,email,message , date, pharmacy_id,admin_id) VALUES (?, ?, ? ,? , ?, ?, ?, ?);";

		DB db = new DB();

		try {

			db.open();

			con = db.getConnection();

			PreparedStatement stmt = con.prepareStatement(sqlquery);

			stmt.setString( 1, message.getTitle() );
			stmt.setString( 2, message.getName() );
			stmt.setString( 3, message.getEmail() );
			stmt.setString( 4, message.getMessage() );
			stmt.setString(5,message.getDate() );
			if (message.getPharmacyId() == 0){
				stmt.setNull(6,java.sql.Types.INTEGER);
			}else{
				stmt.setInt( 6, message.getPharmacyId() );
			}
			if (message.getAdminId() == 0){
				stmt.setNull(7,java.sql.Types.INTEGER);
			}else{
				stmt.setInt( 7, message.getAdminId() );
			}


			stmt.executeUpdate();

			stmt.close(); // closing PreparedStatement
			db.close(); // closing connection


	 	} catch (Exception e) {

			System.out.println("The message is not saved!");

		} finally {

			try {
				db.close();
			} catch (Exception e) {
				//no need to do anything...
			}

		}

	} //End of saveMessage



	public void deleteMessageById(int message_id) throws Exception {

		Connection con = null;

		String sqlquery= "DELETE FROM messages WHERE message_id=?";

		DB db = new DB();

		try {

			db.open(); //open connection

			con = db.getConnection(); //get Connection object

			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setInt( 1, message_id );

			stmt.executeUpdate();

			stmt.close(); // closing PreparedStatement
			db.close(); // closing connection

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


	public MessageDAO() {

	}

}
