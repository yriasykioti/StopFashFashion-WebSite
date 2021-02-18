package omadiki;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Message {
	private int message_id;
	private int sender;
	private int receiver;
	private String description;
	private String photo;
	
	public Message() {
		
	}
	
	public Message(int sender,int receiver, String description, String photo) {
		this.setSender(sender);
		this.setReceiver(receiver);
		this.setDescription(description);
		this.setPhoto(photo);
	}
	
	public void addMessage(int sender,int receiver,String description,String photo) throws Exception {
		DataBase db = new DataBase();
		Connection con = db.getConnection();
		PreparedStatement stmt4 = null;
		String sql4 = "INSERT INTO `Message` (`sender`,`receiver`,`description`,`photo`) VALUES (?,?,?,?);";
		try {
			stmt4 = con.prepareStatement(sql4);
			stmt4.setInt(1, sender);
			stmt4.setInt(2, receiver);
			stmt4.setString(3, description);
			stmt4.setString(4, photo);
			stmt4.executeUpdate();
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			stmt4.close();
			con.close();
		}
	}
	
	public List<Message> getMessages(int purchaser_id) throws Exception {
		List<Message> messages = new ArrayList<Message>();
		DataBase db = new DataBase();
		Connection con = db.getConnection();
		ResultSet rs=null;
		PreparedStatement stmt4 = null;
		String sql4 = "SELECT * FROM `Message` where receiver=?;";
		try {
			stmt4 = con.prepareStatement(sql4);
			stmt4.setInt(1, purchaser_id);
			rs=stmt4.executeQuery();
			while (rs.next()) {
				Message message=new Message(rs.getInt("sender"),rs.getInt("receiver"),rs.getString("description"),rs.getString("photo"));
				message.setMessage_id(rs.getInt("message_id"));
				messages.add(message);
			}
			return messages;
				
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			stmt4.close();
			con.close();
		}
	}
	
	public void deleteMessage(int messageid) throws Exception {
		DataBase db = new DataBase();
		Connection con = db.getConnection();
		PreparedStatement stmt4 = null;
		String sql4 = "delete FROM `Message` where message_id=?;";
		try {
			stmt4 = con.prepareStatement(sql4);
			stmt4.setInt(1, messageid);
			stmt4.executeUpdate();	
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			stmt4.close();
			con.close();
		}
	}
	

	public int getSender() {
		return sender;
	}

	public void setSender(int sender) {
		this.sender = sender;
	}

	public int getReceiver() {
		return receiver;
	}

	public void setReceiver(int receiver) {
		this.receiver = receiver;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getMessage_id() {
		return message_id;
	}

	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}


}
