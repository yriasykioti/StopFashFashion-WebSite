package omadiki;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Purchaser extends User {
	private int purchaser_id;
	private String age;
	public Purchaser() {
		super();
	}

	public Purchaser(String name, String surname, String email, String phone, String username, String password,
			String photo, String usertype, String age) {
		super(name, surname, email, phone, username, password, photo, usertype);
		this.age = age;
	}

	public int getPurchaser_id() {
		return purchaser_id;
	}
	
	public void setPurchaser_id(int purchaser_id) {
		this.purchaser_id=purchaser_id;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	

	public void updatePurchaser(String email, String phone, String password, String photo, int purchaser_id)
			throws Exception {
		DataBase db = new DataBase();
		Connection con = db.getConnection();
		PreparedStatement stmt4 = null;
		String sql4 = "UPDATE purchasers SET email = ?, phone= ?, password= ?, photo= ? WHERE id = ? ";

		try {
			stmt4 = con.prepareStatement(sql4);
			stmt4.setString(1, email);
			stmt4.setString(2, phone);
			stmt4.setString(3, password);
			stmt4.setString(4, photo);
			stmt4.setInt(5, purchaser_id);
			stmt4.executeUpdate();

		} catch (Exception e) {

			throw new SQLException("Could not update the user: " + e.getMessage());
		} finally {
			stmt4.close();
			con.close();
		}

	} // end of updateUser

	public void registerUser(String name, String surname, String email,String phone, String username, String password, String photo,String usertype, Purchaser purchaser) throws Exception {
		DataBase db = new DataBase();
		Connection con = db.getConnection();
		PreparedStatement stmt4 = null;
		String sql4 = "INSERT INTO `purchasers` (`purchaser_username`,`age`) VALUES (?,?);";
		try {
			super.registerUser(name,surname,email,phone,username,password,photo,usertype);
			stmt4 = con.prepareStatement(sql4);
			stmt4.setString(1, purchaser.getUsername());
			stmt4.setString(2, purchaser.getAge());
			stmt4.executeUpdate();
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			stmt4.close();
			con.close();
		}
	}
	
	public int purchaserid(String username) throws Exception{
		DataBase db=new DataBase();
		Connection con=db.getConnection();
		PreparedStatement stmt1=null;
		ResultSet rs=null;
		String sql="SELECT purchaser_id FROM purchasers WHERE purchaser_username=?;";
		try {
			stmt1= con.prepareStatement(sql);
			stmt1.setString(1, username);
			rs=stmt1.executeQuery();
			int purid=-1;
			while (rs.next()) {
			purid=rs.getInt("purchaser_id");
			}
			rs.close();
			stmt1.close();
			return purid;
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			con.close();
		}
	}
	
	public String purchaserusername(int purchaserid) throws Exception{
		DataBase db=new DataBase();
		Connection con=db.getConnection();
		PreparedStatement stmt1=null;
		ResultSet rs=null;
		String sql="SELECT purchaser_username FROM purchasers WHERE purchaser_id=?;";
		try {
			stmt1= con.prepareStatement(sql);
			stmt1.setInt(1, purchaserid);
			rs=stmt1.executeQuery();
			String username=null;
			while (rs.next()) {
			username=rs.getString("purchaser_username");
			}
			rs.close();
			stmt1.close();
			return username;
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			con.close();
		}
	}
	

	
	public Purchaser findUser(String username) throws Exception {
		DataBase db=new DataBase();
		Connection con=db.getConnection();
		PreparedStatement stmt1=null;
		ResultSet rs=null;
		String sql="SELECT * FROM purchasers WHERE username=?;";
		try {
			User user=super.findUser(username);
			stmt1= con.prepareStatement(sql);
			stmt1.setString(1, username);
			rs=stmt1.executeQuery();
			if (rs.next()==false) {
				return null;
			} else {
				Purchaser pur =new Purchaser(user.getName(), user.getSurname(), user.getEmail(),
						user.getPhone(),user.getUsername(), user.getPassword(), user.getPhoto(),user.getUsertype(),rs.getString("age"));
				pur.setPurchaser_id(rs.getInt("purchaser_id"));
				return pur;	
			}
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			rs.close();
			stmt1.close();
			con.close();
		}
		
		
		
	} //End of findUser

}
