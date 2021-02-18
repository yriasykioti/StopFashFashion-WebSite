package omadiki;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Wishlist {
	private int purchaser_id;
	private int ad_id;
	
	public Wishlist() {}
	
	public Wishlist(int purchaser_id, int ad_id) {
		this.setAd_id(ad_id);
		this.setPurchaser_id(purchaser_id);
	}
	
	
	public void addWishlist(int adid,int purchaserid) throws Exception {
		DataBase db = new DataBase();
		Connection con = db.getConnection();
		PreparedStatement stmt4 = null;
		String sql4 = "INSERT INTO `Wishlist` (`purchaser_id`,`ad_id`) VALUES (?,?);";
		try {
			stmt4 = con.prepareStatement(sql4);
			stmt4.setInt(1, purchaserid);
			stmt4.setInt(2, adid);
			stmt4.executeUpdate();
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			stmt4.close();
			con.close();
		}
	}
	
	public void deleteWishlist(int adid) throws Exception {
		DataBase db = new DataBase();
		Connection con = db.getConnection();
		PreparedStatement stmt4 = null;
		String sql4 = "delete FROM `Wishlist` where ad_id=?;";
		try {
			stmt4 = con.prepareStatement(sql4);
			stmt4.setInt(1, adid);
			stmt4.executeUpdate();	
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			stmt4.close();
			con.close();
		}
	}
	
	public List<Integer> getWishlist(int purchaserid) throws Exception {
		List<Integer> adids = new ArrayList<Integer>();
		DataBase db = new DataBase();
		Connection con = db.getConnection();
		ResultSet rs=null;
		PreparedStatement stmt4 = null;
		String sql4 = "SELECT ad_id FROM `Wishlist` where purchaser_id=?;";
		try {
			stmt4 = con.prepareStatement(sql4);
			stmt4.setInt(1, purchaserid);
			rs=stmt4.executeQuery();
			while (rs.next()) {
				int adid=rs.getInt("ad_id");
				adids.add(adid);
			}
			return adids;
				
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			stmt4.close();
			con.close();
		}
	}
	
	

	public int getPurchaser_id() {
		return purchaser_id;
	}

	public void setPurchaser_id(int purchaser_id) {
		this.purchaser_id = purchaser_id;
	}

	public int getAd_id() {
		return ad_id;
	}

	public void setAd_id(int ad_id) {
		this.ad_id = ad_id;
	}
}
