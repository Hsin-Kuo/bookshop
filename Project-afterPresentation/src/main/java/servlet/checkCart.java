package servlet;

import java.io.IOException;
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
import JDBC.DbCart;

/**
 * Servlet implementation class addToCart
 */
@WebServlet("/checkCart")
public class checkCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		JSONArray cartJson = new JSONArray();	
		System.out.println("cart first length="+cartJson.length());
		if(memberId!=null) {
			try {
				cartJson = DbCart.generateJSON(memberId);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else {
			
			cartJson = (JSONArray) session.getAttribute("cartJson");
			System.out.println(cartJson.toString());
		}
		
		if(cartJson.length()>0) {
			//更新品名、價錢、照片
			for(int i=0; i<cartJson.length(); i++) {
				JSONObject item =(JSONObject) cartJson.get(i);
				try {
					item.put("price", DbCart.getPriceById(item.getString("productId")));
					item.put("img", DbCart.getImgById(item.getString("productId")));
					item.put("name", DbCart.getNameById(item.getString("productId")));
				} catch (JSONException | SQLException e) {
					e.printStackTrace();
				}
			}
		}
		

		response.setContentType("application/json;charset=UTF-8");
		System.out.println(cartJson.toString());
		response.getWriter().write(cartJson.toString());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	

}