package JDBC;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.json.JSONArray;
import org.json.JSONObject;

public class DbCart {
	
	public static JSONArray generateJSON(String memberId) throws SQLException {
		Statement stm = new ConnDb().getCon().createStatement();
		String sql = "SELECT * FROM cart WHERE email = '"+memberId+"'";
		ResultSet res = stm.executeQuery(sql);
		JSONArray cartJson = new JSONArray();
		while(res.next()) {
			JSONObject item = new JSONObject();
			item.put("productId", res.getString("productId"));
			item.put("count", res.getString("count"));
			item.put("price", getPriceById(item.getString("productId")));
			item.put("img", getImgById(item.getString("productId")));
			item.put("name", getNameById(item.getString("productId")));
			cartJson.put(item);
		}
		return cartJson;
	}
	
	public static int getPriceById(String productId) throws SQLException {
		Statement stm = new ConnDb().getCon().createStatement();
		String sql = "SELECT price, valuedPrice FROM product WHERE productId = '"+productId+"'";
		ResultSet res = stm.executeQuery(sql);
		if(res.next()) {
		if(res.getInt("valuedPrice")!=0) {
			return res.getInt("valuedPrice");
		}
		return res.getInt("price");
		}
		return -1;
	}
	
	public static String getImgById(String productId) throws SQLException {
		Statement stm = new ConnDb().getCon().createStatement();
		String sql = "SELECT img FROM product WHERE productId = '"+productId+"'";
		ResultSet res = stm.executeQuery(sql);
		if(res.next()) {
			return res.getString("img").substring(0, res.getString("img").indexOf(","));
		}
		return "";
	}
	public static String getNameById(String productId) throws SQLException {
		Statement stm = new ConnDb().getCon().createStatement();
		String sql = "SELECT productName FROM product WHERE productId = '"+productId+"'";
		ResultSet res = stm.executeQuery(sql);
		if(res.next()) {
			return res.getString("productName");
		}
		return "";
	}

}
