package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class dao {
	public static Connection getConnection() {
		String connectionURL = "jdbc:mysql://localhost:3306/demo";
		String user = "root";
		String pass = "root";
 
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(connectionURL, user, pass);
		    
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	public static List<bean> getImageIds(){
		Connection con = null;
		String sql = null;
		List<bean> imageList = new ArrayList<bean>();
		try {
			con = dao.getConnection();
			sql = "SELECT id,name FROM demo.Image_Table";
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rs =  pst.executeQuery();
			while(rs.next()) {
				bean image = new bean();
				image.setImageName(rs.getString("name"));
				image.setId(rs.getInt("id"));
				imageList.add(image);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return imageList;
	}
}
