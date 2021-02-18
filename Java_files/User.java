package omadiki;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class User {
	private String name;
	private String surname;
	private String email;
	private String phone;
	private String username;
	private String password;
	private String photo;
	private String usertype;

	public User() {
		
	}

	public User(String name, String surname, String email,String phone, String username, String password, String photo,String usertype) {

		this.name = name;
		this.surname = surname;
		this.email = email;
		this.phone=phone;
		this.username = username;
		this.password = password;
		this.photo= photo;
		this.usertype= usertype;
	}

	/* Getters & Setters */

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username
	 *            the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the surname
	 */
	public String getSurname() {
		return surname;
	}

	/**
	 * @param surname
	 *            the surname to set
	 */
	public void setSurname(String surname) {
		this.surname = surname;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email
	 *            the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPhone() {
		return phone;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhoto() {
		return photo;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public String getUsertype() {
		return usertype;
	}

	/**
	 * @param username
	 *            the username to set
	 */
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}


	@Override
	public String toString() {
		return "User [username=" + username + ", name=" + name + ", surname=" + surname + ", email=" + email + "]";
	}
	
	public User authenticate(String username, String password) throws Exception {
		DataBase db=new DataBase();
		Connection con=null;
		PreparedStatement stmt2=null;
		ResultSet rs=null;
		String sql3="SELECT * FROM users WHERE username=? and password=?;";
		try {
			con=db.getConnection();
			stmt2=con.prepareStatement(sql3);
			stmt2.setString(1, username);
			stmt2.setString(2, password);
			rs=stmt2.executeQuery();
				try{
					if ( !rs.next() ) {
						throw new Exception("Department not found.");
					} 
					User user2=new User(rs.getString("name"), rs.getString("surname"), rs.getString("email"),rs.getString("phone"),rs.getString("username"),rs.getString("password"),
							rs.getString("photo"), rs.getString("usertype"));
					rs.close();
					stmt2.close();
					db.close();
					return user2;	
				}catch(Exception  e){
					System.out.println(e + "Wrong username or password");
					return null;
				}
		}catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			if( con!=null) {
				con.close();
			}
			
		}
	}
		
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
			
		public void registerUser(String name, String surname, String email,String phone, String username, String password, String photo,String usertype) throws Exception {
			DataBase db = new DataBase();
			Connection con = db.getConnection();
			PreparedStatement stmt4 = null;
			String sql4 = "INSERT INTO `users` (`username`,`name`,`surname`,`email`,`password`,`photo`,`phone`,`usertype`) VALUES (?,?,?,?,?,?,?,?);";
			try {
				stmt4 = con.prepareStatement(sql4);
				stmt4.setString(1, username);
				stmt4.setString(2, name);
				stmt4.setString(3, surname);
				stmt4.setString(4, email);
				stmt4.setString(5, password);
				stmt4.setString(6, photo);
				stmt4.setString(7, phone);
				stmt4.setString(8, usertype);
				stmt4.executeUpdate();
			} catch (SQLException e) {
				throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
			} finally {
				stmt4.close();
				con.close();
			}
		}
		
		public List<User> getUsers() throws Exception {
			List<User> users = new ArrayList<User>();
			DataBase db = new DataBase();
			Connection con = db.getConnection();
			PreparedStatement stmt = null;
			ResultSet rs = null;
			String sql1 = "SELECT * FROM users;";
			try {
				stmt = con.prepareStatement(sql1);
				rs = stmt.executeQuery();
				while (rs.next()) {
					users.add(new User(rs.getString("name"), rs.getString("surname"), rs.getString("email"),
							rs.getString("phone"), rs.getString("username"), rs.getString("password"),
							rs.getString("photo"), rs.getString("usertype")));
				}
				return users;
			} catch (SQLException e) {

				throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
			} finally {
				rs.close();
				stmt.close();
				con.close();
			}
		}
		
		public List<ResultSet> getUser(String username) throws Exception {
			DataBase db=new DataBase();
			Connection conn=db.getConnection();
			PreparedStatement stmt1=null;
			ResultSet rs1=null;
			PreparedStatement stmtx=null;
			ResultSet rsx=null;
			String sql="select * from users where username = ? ;";
			String sql1="select * from purchasers where purchaser_username = ?;";
			String sql2="select * from NGO where NGO_username=?;";
			
			List<ResultSet> y = new ArrayList();

			try {

				stmt1 = conn.prepareStatement(sql);
				stmt1.setString(1, username);
				rs1 = stmt1.executeQuery();
				rs1.next();

				y.add(rs1);


				if((rs1.getString("usertype")).equals("purchaser")) {

					stmtx = conn.prepareStatement(sql1);
					stmtx.setString(1, rs1.getString("username"));
					rsx = stmtx.executeQuery();
				} else {
					stmtx = conn.prepareStatement(sql2);
					stmtx.setString(1, rs1.getString("username"));
					rsx = stmtx.executeQuery();
				}

				rsx.next();
				y.add(rsx);
				conn.close();
				return y;



			} catch (Exception e1) {
				throw new Exception(e1.getMessage());

			}

		}//getPerson ends


		
	} 

