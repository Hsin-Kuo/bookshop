package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import JDBC.ConnDb;

/**
 * Servlet implementation class addToCart
 */
@WebServlet("/orderDetail")
public class orderDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("getOrderDetail");
		request.setCharacterEncoding("utf-8");
		
		BufferedReader reader = request.getReader();
	    StringBuilder requestBody = new StringBuilder();
	    String line;

	    while ((line = reader.readLine()) != null) {
	        requestBody.append(line);
	    }

	    // 解析 JSON 數據
	    JSONObject jsonRequest = new JSONObject(requestBody.toString());
	    int orderId = jsonRequest.getInt("orderId");
	    
		System.out.println("getOrderid: "+orderId);
		JSONArray detailsJson = new JSONArray();
		try {
			detailsJson = generateJSON(orderId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		

		response.setContentType("application/json;charset=UTF-8");
		System.out.println(detailsJson.toString());
		response.getWriter().write(detailsJson.toString());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
	protected JSONArray generateJSON(int orderId) throws SQLException {
		String sql = "SELECT * FROM orderdetails WHERE orderId = ?";
		PreparedStatement pre = new ConnDb().getCon().prepareStatement(sql);
		pre.setInt(1, orderId);
		ResultSet res = pre.executeQuery();
		JSONArray detailJson = new JSONArray();
		while(res.next()) {
			System.out.println("res.next()");
			JSONObject item = new JSONObject();
			item.put("autoId", res.getString("autoId"));
			item.put("productId", res.getString("productId"));
			item.put("name", getNameById(item.getString("productId")));
			String img = getImgById(item.getString("productId"));
			
			item.put("img", img.substring(0, img.indexOf(",")));
			item.put("count", res.getInt("count"));
			item.put("price", res.getString("price"));
			detailJson.put(item);
			
		}
		return detailJson;
	}
	
	protected String getImgById(String productId) throws SQLException {
		Statement stm = new ConnDb().getCon().createStatement();
		String sql = "SELECT img FROM product WHERE productId = '"+productId+"'";
		ResultSet res = stm.executeQuery(sql);
		if(res.next()) {
			return res.getString("img");
		}
		return "";
	}

	protected String getNameById(String productId) throws SQLException {
		Statement stm = new ConnDb().getCon().createStatement();
		String sql = "SELECT productName FROM product WHERE productId = '"+productId+"'";
		ResultSet res = stm.executeQuery(sql);
		if(res.next()) {
			return res.getString("productName");
		}
		return "";
	}
}