package servlet;

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
@WebServlet("/orderHistory")
public class orderHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("getOrderHistory");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		JSONArray ordersJson = new JSONArray();
		try {
			ordersJson = generateJSON(memberId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		

		response.setContentType("application/json;charset=UTF-8");
		System.out.println(ordersJson.toString());
		response.getWriter().write(ordersJson.toString());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
	protected JSONArray generateJSON(String memberId) throws SQLException {
		String sql = "SELECT * FROM orders WHERE userId = ?";
		PreparedStatement pre = new ConnDb().getCon().prepareStatement(sql);
		pre.setString(1, memberId);
		ResultSet res = pre.executeQuery();
		JSONArray orderJson = new JSONArray();
		while(res.next()) {
			JSONObject item = new JSONObject();
			item.put("autoId", res.getString("autoId"));
			item.put("paymentMethod", res.getString("paymentMethod"));
			item.put("totalPrice", res.getString("totalPrice"));
			item.put("orderTime", res.getString("orderTime"));
			orderJson.put(item);
			System.out.println(res.getString("totalPrice"));
			
		}
		return orderJson;
	}

}