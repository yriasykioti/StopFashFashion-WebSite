package omadiki;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;


public class UserDAO {

	public List<Purchaser> getPurchaser() throws Exception {
		List<Purchaser> purchasers = new ArrayList<Purchaser>();
		DataBase db = new DataBase();
		Connection con = db.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql1 = "SELECT * FROM purchasers;";
		try {
			stmt = con.prepareStatement(sql1);
			rs = stmt.executeQuery();
			while (rs.next()) {
				purchasers.add(new Purchaser(rs.getString("name"), rs.getString("surname"), rs.getString("email"),
						rs.getString("phone"),rs.getString("username"), rs.getString("password"), rs.getString("photo"),rs.getString("usertype"),rs.getInt("purchaser_id"),rs.getDate("age")));
			}
			return purchasers;
		} catch (SQLException e) {
		
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			rs.close();
			stmt.close();
			con.close();
		}
	}
		
		public List<UserNGO> getNGO() throws Exception {
			List<UserNGO> ngo = new ArrayList<UserNGO>();
			DataBase db = new DataBase();
			Connection con = db.getConnection();
			PreparedStatement stmt = null;
			ResultSet rs = null;
			String sql1 = "SELECT * FROM NGO;";
			try {
				stmt = con.prepareStatement(sql1);
				rs = stmt.executeQuery();
				while (rs.next()) {
					ngo.add(new UserNGO(rs.getString("name"), rs.getString("surname"), rs.getString("email"),
							rs.getString("phone"),rs.getString("username"), rs.getString("password"), rs.getString("photo"),rs.getString("usertype"),rs.getInt("ngo_id"),rs.getString("address"),
							rs.getString("description"),rs.getString("afm")));
				}
				return ngo;
			} catch (SQLException e) {
			
				throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
			} finally {
				rs.close();
				stmt.close();
				con.close();
			}
			


		
		
	} //End of getUsers

	public User findUser(String username) throws Exception {
		DataBase db=new DataBase();
		Connection con=db.getConnection();
		PreparedStatement stmt1=null;
		ResultSet rs=null;
		String sql2="SELECT * FROM users WHERE username=?;";
		try {
			stmt1= con.prepareStatement(sql2);
			stmt1.setString(1, username);
			rs=stmt1.executeQuery();
			if (rs.next() == false) {
				return null;
			} else {
				User user1=new User(rs.getString("name"), rs.getString("surname"), rs.getString("email"),
						rs.getString("phone"),rs.getString("username"), rs.getString("password"), rs.getString("photo"),rs.getString("usertype"));
				return user1;	
			}
			
			
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			rs.close();
			stmt1.close();
			con.close();
		}
		
		
		
	} //End of findUser

	/**
	 * This method is used to authenticate a user.
	 * 
	 * @param username, String
	 * @param password, String
	 * @return User, the User object
	 * @throws Exception, if the credentials are not valid
	 */
	public User authenticate(String username, String password) throws Exception {
		DataBase db=new DataBase();
		Connection con=db.getConnection();
		PreparedStatement stmt2=null;
		ResultSet rs=null;
		String sql3="SELECT * FROM users WHERE username=?;";
		try {
			stmt2=con.prepareStatement(sql3);
			stmt2.setString(1, username);
			rs=stmt2.executeQuery();
				try{
					if (rs.next() != false){
						User user2=new User(rs.getString("name"), rs.getString("surname"), rs.getString("email"),
								rs.getString("phone"),rs.getString("username"), rs.getString("password"), rs.getString("photo"),rs.getString("usertype"));
						return user2;	
					}else{
						throw new Exception();
					}
				}catch(Exception  e){
					System.out.println(e + "Wrong username or password");
					return null;
				}
		}catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			rs.close();
			stmt2.close();
			con.close();
		}
			
				
		
	} //End of authenticate
	
	/**
	 * Register/create new User.
	 * 
	 * @param user, User
	 * @throws Exception, if encounter any error.
	 */
	public void registerPurchaser(Purchaser purchaser) throws Exception {
		DataBase db=new DataBase();
		Connection con=db.getConnection();
		PreparedStatement stmt4=null;
		String sql4="INSERT INTO `purchasers` (`username`,`name`,`surname`,`email`,`password`,`photo`,`phone`,`usertype`,`purchaser_id`,`age`,) VALUES (?,?,?,?,?,?,?,?,?,?);";
		try {
			stmt4=con.prepareStatement(sql4);
			stmt4.setString(1, purchaser.getUsername());
			stmt4.setString(2, purchaser.getName());
			stmt4.setString(3, purchaser.getSurname());
			stmt4.setString(4, purchaser.getEmail());
			stmt4.setString(5, purchaser.getPassword());
			stmt4.setString(6, purchaser.getPhoto());
			stmt4.setString(7, purchaser.getPhone());
			stmt4.setString(8, purchaser.getUsertype());
			stmt4.setInt(9, purchaser.getPurchaser_id());
			stmt4.setDate(10, purchaser.getAge());
			stmt4.executeUpdate();
		}catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			stmt4.close();
			con.close();
		}
	}
		
		public void updatePurchaser(String email, String phone, String password, String photo, int purchaser_id) throws Exception {
			DataBase db=new DataBase();
			Connection con=db.getConnection();
			PreparedStatement stmt4=null;
			String sql4="UPDATE purchasers SET email = ?, phone= ?, password= ?, photo= ? WHERE id = ? ";

			try {
				stmt4=con.prepareStatement(sql4);
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

		} //end of deleteUser
		
		public void updateNGO(String description, String link, String address, String phone, String email, String password,String photo, int ngo_id) throws Exception {
			DataBase db=new DataBase();
			Connection con=db.getConnection();
			PreparedStatement stmt4=null;
			String sql4="UPDATE purchasers SET description = ?, link= ?, address= ?, phone= ?, email=?, password=? , photo=? WHERE id = ? ";

			try {
				stmt4=con.prepareStatement(sql4);
				stmt4.setString(1, description);
				stmt4.setString(2, link);
				stmt4.setString(3, address);
				stmt4.setString(4, phone);
				stmt4.setString(5, email);
				stmt4.setString(6, password);
				stmt4.setString(7, photo);
				stmt4.setInt(8, ngo_id);
				stmt4.executeUpdate();


				} catch (Exception e) {

					throw new SQLException("Could not update the user: " + e.getMessage());
				} finally {
					stmt4.close();
					con.close();
				}

		} //end of deleteUser
		
		public void deletePurchaser(int purchaser_id) throws Exception {
			DataBase db=new DataBase();
			Connection con=db.getConnection();
			PreparedStatement stmt4=null;
			String sql4="DELETE * FROM users,Ad, Wishlist, Message,Request where=?";
			

			try {
				stmt4=con.prepareStatement(sql4);
				stmt4.setInt(1, purchaser_id);
				stmt4.executeUpdate();


				} catch (Exception e) {

					throw new SQLException("Could not update the user: " + e.getMessage());
				} finally {
					stmt4.close();
					con.close();
				}

		} //end of deleteUser
		
		public void deleteNGO(int ngo_id) throws Exception {
			DataBase db=new DataBase();
			Connection con=db.getConnection();
			PreparedStatement stmt4=null;
			String sql4="DELETE * FROM users,Message,Request where=?";
			

			try {
				stmt4=con.prepareStatement(sql4);
				stmt4.setInt(1, ngo_id);
				stmt4.executeUpdate();


				} catch (Exception e) {

					throw new SQLException("Could not update the user: " + e.getMessage());
				} finally {
					stmt4.close();
					con.close();
				}

		} //end of deleteUser
		
		
	
	
	public void registerNGO(UserNGO ngo) throws Exception {
		DataBase db=new DataBase();
		Connection con=db.getConnection();
		PreparedStatement stmt4=null;
		String sql4="INSERT INTO `NGO` (`username`,`name`,`surname`,`email`,`password`,`photo`,`phone`,`usertype`,`ngo_id`,`description`,`afm`,`address`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?);";
		try {
			stmt4=con.prepareStatement(sql4);
			stmt4.setString(1, ngo.getUsername());
			stmt4.setString(2, ngo.getName());
			stmt4.setString(3, ngo.getSurname());
			stmt4.setString(4, ngo.getEmail());
			stmt4.setString(5, ngo.getPassword());
			stmt4.setString(6, ngo.getPhoto());
			stmt4.setString(7, ngo.getPhone());
			stmt4.setString(8, ngo.getUsertype());
			stmt4.setInt(9, ngo.getNgo_id());
			stmt4.setString(10, ngo.getDescription());
			stmt4.setString(11, ngo.getAfm());
			stmt4.setString(12, ngo.getAddress());
			stmt4.executeUpdate();
		}catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			stmt4.close();
			con.close();
		}	
		
		
	}//end of register
}
