package omadiki;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Ad {
	private int ad_id;
	private String productType;
	private double price;
	private String productDescription;
	private String photo;
	private int purchaser_id;
	
	public Ad() {
		
	}
	
	public Ad(String productType, double price, String productDescription, String photo){
		this.setProductType(productType);
		this.setPrice(price);
		this.setProductDescription(productDescription);
		this.setPhoto(photo);

	}
	
	
	
	public void addAd(Ad ad, int purchaser_id) throws Exception {
		DataBase db = new DataBase();
		Connection con = db.getConnection();
		PreparedStatement stmt4 = null;
		String sql4 = "INSERT INTO `Ad` (`purchaser_id`,`product_type`,`price`,`photo`,`product_description`) VALUES (?,?,?,?,?);";
		try {
			stmt4 = con.prepareStatement(sql4);
			stmt4.setInt(1, purchaser_id);
			stmt4.setString(2, ad.getProductType());
			stmt4.setDouble(3, ad.getPrice());
			stmt4.setString(4, ad.getPhoto());
			stmt4.setString(5, ad.getProductDescription());
			stmt4.executeUpdate();
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			stmt4.close();
			con.close();
		}
	}
	
	public List<Ad> getAds() throws Exception {
		List<Ad> ads = new ArrayList<Ad>();
		DataBase db = new DataBase();
		Connection con = db.getConnection();
		ResultSet rs=null;
		PreparedStatement stmt4 = null;
		String sql4 = "SELECT * FROM `Ad`;";
		try {
			stmt4 = con.prepareStatement(sql4);
			rs=stmt4.executeQuery();
			while (rs.next()) {
				Ad ad=new Ad(rs.getString("product_type"),rs.getDouble("price"),rs.getString("product_description"),rs.getString("photo"));
				ad.setAd_id(rs.getInt("ad_id"));
				ad.setPurchaser_id(rs.getInt("purchaser_id"));
				ads.add(ad);
			}
			return ads;
				
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			stmt4.close();
			con.close();
		}
	}
	

	public List<Ad> getCategoryAds(String category) throws Exception {
		List<Ad> ads = new ArrayList<Ad>();
		DataBase db = new DataBase();
		Connection con = db.getConnection();
		ResultSet rs=null;
		PreparedStatement stmt4 = null;
		String sql4 = "SELECT * FROM `Ad`where product_type=?;";
		try {
			stmt4 = con.prepareStatement(sql4);
			stmt4.setString(1, category);
			rs=stmt4.executeQuery();
			while (rs.next()) {
				Ad ad=new Ad(rs.getString("product_type"),rs.getDouble("price"),rs.getString("product_description"),rs.getString("photo"));
				ad.setAd_id(rs.getInt("ad_id"));
				ad.setPurchaser_id(rs.getInt("purchaser_id"));
				ads.add(ad);
			}
			return ads;
				
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			stmt4.close();
			con.close();
		}
	}
	
	public List<Ad> getPurchasersAds(int purchaser_id) throws Exception {
		List<Ad> ad = new ArrayList<Ad>();
		DataBase db = new DataBase();
		Connection con = db.getConnection();
		ResultSet rs=null;
		PreparedStatement stmt4 = null;
		String sql4 = "SELECT * FROM `Ad` where purchaser_id=?;";
		try {
			stmt4 = con.prepareStatement(sql4);
			stmt4.setInt(1, purchaser_id);
			rs=stmt4.executeQuery();
			while (rs.next()) {
				Ad ad1=new Ad(rs.getString("product_type"),rs.getInt("price"),rs.getString("product_description"), rs.getString("photo"));
				ad1.setAd_id(rs.getInt("ad_id"));
				ad.add(ad1);
			}
			return ad;
				
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			stmt4.close();
			con.close();
		}
	}
	
	public Ad getSpecificAd(int ad_id) throws Exception {
		DataBase db = new DataBase();
		Connection con = db.getConnection();
		ResultSet rs=null;
		List<Ad> ad = new ArrayList<Ad>();
		PreparedStatement stmt4 = null;
		String sql4 = "SELECT * FROM `Ad` where ad_id=?;";
		try {
			stmt4 = con.prepareStatement(sql4);
			stmt4.setInt(1, ad_id);
			rs=stmt4.executeQuery();
			if (rs.next()) {
				Ad ad2=new Ad(rs.getString("product_type"),rs.getInt("price"),rs.getString("product_description"), rs.getString("photo"));
				ad2.setAd_id(rs.getInt("ad_id"));
				ad.add(ad2);
			}
			return ad.get(0);
				
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			stmt4.close();
			con.close();
		}
	}
	
	public List<Integer> getPurchaserid() throws Exception{
		List<Integer> purchaserid=new ArrayList<Integer>();
		DataBase db=new DataBase();
		Connection con=db.getConnection();
		ResultSet rs=null;
		PreparedStatement stmt4 = null;
		String sql4 = "SELECT `purchaser_id` FROM `Ad`;";
		int purid;
		try {
			stmt4 = con.prepareStatement(sql4);
			rs=stmt4.executeQuery();
			while (rs.next()) {
				purid=rs.getInt("purchaser_id");
				purchaserid.add(purid);
			}
			return purchaserid;
		} catch (SQLException e) {
			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		} finally {
			stmt4.close();
			con.close();
		}
		
	}
	
	public void deleteAd(int adid) throws Exception {
		DataBase db = new DataBase();
		Connection con = db.getConnection();
		PreparedStatement stmt4 = null;
		String sql4 = "delete FROM `Ad` where ad_id=?;";
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

	
	
	
	public int getAd_id() {
		return ad_id;
	}

	public void setAd_id(int ad_id) {
		this.ad_id = ad_id;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getPurchaser_id() {
		return purchaser_id;
	}

	public void setPurchaser_id(int purchaser_id) {
		this.purchaser_id = purchaser_id;
	}
	

}
