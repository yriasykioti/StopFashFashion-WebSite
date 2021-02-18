
package omadiki;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Request {
	private int request_id;
	private String photo;
	private String category;
	private String description;
	
	public Request() {
		
	}
	
	public Request( String photo, String category, String description){
		this.setPhoto(photo);
		this.setCategory(category);
		this.setDescription(description);
		
	}
	public void addRequest(Request request, int purchaser_id, int ngo_id,String ngousername) throws Exception {
		DataBase db = new DataBase();
		Connection con = db.getConnection();
		PreparedStatement stmt4 = null;
		String sql4 = "INSERT INTO `Request` (`purchaser_id`,`ngo_id`,`photos`,`category`,`description`,`selectedNGO`) VALUES (?,?,?,?,?,?);";
		try {
			stmt4 = con.prepareStatement(sql4);
			stmt4.setInt(1, purchaser_id);
			stmt4.setInt(2, ngo_id);
			stmt4.setString(3, request.getPhoto());
			stmt4.setString(4, request.getCategory());
			stmt4.setString(5, request.getDescription());
			stmt4.setString(6,ngousername);
			
			stmt4.executeUpdate();
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			stmt4.close();
			con.close();
		}
	}
	
	public List<Request> getRequests(int ngo_id) throws Exception {
		List<Request> requests = new ArrayList<Request>();
		DataBase db = new DataBase();
		Connection con = db.getConnection();
		ResultSet rs=null;
		PreparedStatement stmt4 = null;
		String sql4 = "SELECT * FROM `Request` where ngo_id=?;";
		try {
			stmt4 = con.prepareStatement(sql4);
			stmt4.setInt(1, ngo_id);
			rs=stmt4.executeQuery();
			while (rs.next()) {
				Request req=new Request(rs.getString("photos"),rs.getString("category"),rs.getString("description"));
				req.setRequest_id(rs.getInt("request_id"));
				requests.add(req);
			}
			return requests;
				
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			stmt4.close();
			con.close();
		}
	}
	
	public List<Integer> getpurid(int ngo_id) throws Exception {
		List<Integer> purids = new ArrayList<Integer>();
		DataBase db = new DataBase();
		Connection con = db.getConnection();
		ResultSet rs=null;
		PreparedStatement stmt4 = null;
		String sql4 = "SELECT `purchaser_id` FROM `Request` where ngo_id=?;";
		try {
			stmt4 = con.prepareStatement(sql4);
			stmt4.setInt(1, ngo_id);
			rs=stmt4.executeQuery();
			int purid;
			while (rs.next()) {
				 purid=rs.getInt("purchaser_id");
				purids.add(purid);
			}
			return purids;
				
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			stmt4.close();
			con.close();
		}
	}
	
	public void deleteRequest(int request_id) throws Exception {
		DataBase db = new DataBase();
		Connection con = db.getConnection();
		PreparedStatement stmt4 = null;
		String sql4 = "delete FROM `Request` where request_id=?;";
		try {
			stmt4 = con.prepareStatement(sql4);
			stmt4.setInt(1, request_id);
			stmt4.executeUpdate();	
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			stmt4.close();
			con.close();
		}
	}
	
	
	


	public int getRequest_id() {
		return request_id;
	}

	public void setRequest_id(int request_id) {
		this.request_id = request_id;
	}


	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	

}
