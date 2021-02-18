package omadiki;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserNGO extends User {
	private int ngo_id;
	private String ngo_name;
	private String address;
	private String description;
	private String afm;
	private String link;
	
	public UserNGO() {
		super();
	}

	public UserNGO(String name, String surname, String email, String phone, String username, String password,
			String photo,String usertype, String ngo_name,String address, String description, String afm,String link) {
		super(name, surname, email, phone, username, password, photo,usertype);
		this.setNgo_name(ngo_name);
		this.address = address;
		this.description = description;
		this.afm = afm;
		this.link=link;
	}

	public int getNgo_id() {
		return ngo_id;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAfm() {
		return afm;
	}

	public void setAfm(String afm) {
		this.afm = afm;
	}
	
	public void registerUser(String ngo_name,String name, String surname, String email,String phone, String username, String password, String photo,String usertype,UserNGO ngo) throws Exception {
		DataBase db=new DataBase();
		Connection con=db.getConnection();
		PreparedStatement stmt4=null;
		String sql4="INSERT INTO `NGO` (`NGO_username`,`description`,`afm`,`address`,`link`,`ngo_name`) VALUES (?,?,?,?,?,?);";
		try {
			super.registerUser(name,surname,email,phone,username,password,photo,usertype);
			stmt4=con.prepareStatement(sql4);
			stmt4.setString(1, ngo.getUsername());
			stmt4.setString(2, ngo.getDescription());
			stmt4.setString(3, ngo.getAfm());
			stmt4.setString(4, ngo.getAddress());
			stmt4.setString(5, ngo.getLink());
			stmt4.setString(6, ngo.getNgo_name());
			stmt4.executeUpdate();
			stmt4.close();
		}catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			stmt4.close();
			con.close();
		}	
		
		
	}//end of register
	

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
	
	public List<UserNGO> getNGO() throws Exception {
		List<UserNGO> ngo = new ArrayList<UserNGO>();
		DataBase db = new DataBase();
		Connection con = db.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql1 = "SELECT * FROM users, NGO where username=NGO_username;";
		try {
			stmt = con.prepareStatement(sql1);
			rs = stmt.executeQuery();
			while (rs.next()) {
				ngo.add(new UserNGO(rs.getString("name"), rs.getString("surname"), rs.getString("email"),
						rs.getString("phone"),rs.getString("username"), rs.getString("password"), rs.getString("photo"),rs.getString("usertype"),rs.getString("address"), rs.getString("ngo_name"),
						rs.getString("description"),rs.getString("afm"),rs.getString("link")));
			}
			return ngo;
		} catch (SQLException e) {
		
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			rs.close();
			stmt.close();
			con.close();
		}
}
	public int ngoid(String username) throws Exception{
		DataBase db=new DataBase();
		Connection con=db.getConnection();
		PreparedStatement stmt1=null;
		ResultSet rs=null;
		String sql="SELECT ngo_id FROM NGO WHERE NGO_username=?;";
		try {
			stmt1= con.prepareStatement(sql);
			stmt1.setString(1, username);
			rs=stmt1.executeQuery();
			int ngoid=-1;
			while (rs.next()) {
			ngoid=rs.getInt("ngo_id");
			}
			rs.close();
			stmt1.close();
			return ngoid;
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			con.close();
		}
	}
	
	public String ngoname(String username) throws Exception{
		DataBase db=new DataBase();
		Connection con=db.getConnection();
		PreparedStatement stmt1=null;
		ResultSet rs=null;
		String sql="SELECT ngo_name FROM NGO WHERE NGO_username=?;";
		try {
			stmt1= con.prepareStatement(sql);
			stmt1.setString(1, username);
			rs=stmt1.executeQuery();
			String ngoname=null;
			while (rs.next()) {
			ngoname=rs.getString("ngo_name");
			}
			rs.close();
			stmt1.close();
			return ngoname;
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			con.close();
		}
	}
	
	public String ngo_name(int ngo_id) throws Exception{
		DataBase db=new DataBase();
		Connection con=db.getConnection();
		PreparedStatement stmt1=null;
		ResultSet rs=null;
		String sql="SELECT ngo_name FROM NGO WHERE ngo_id=?;";
		try {
			stmt1= con.prepareStatement(sql);
			stmt1.setInt(1, ngo_id);
			rs=stmt1.executeQuery();
			String ngoname=null;
			while (rs.next()) {
			ngoname=rs.getString("ngo_name");
			}
			rs.close();
			stmt1.close();
			return ngoname;
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			con.close();
		}
	}
	
	
	

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getNgo_name() {
		return ngo_name;
	}

	public void setNgo_name(String ngo_name) {
		this.ngo_name = ngo_name;
	}
}
