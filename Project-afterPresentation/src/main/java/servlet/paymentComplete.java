package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import JDBC.ConnDb;

/**
 * Servlet implementation class paymentComplete
 */
@WebServlet("/paymentComplete")
public class paymentComplete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("paymentComplete");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		JSONObject checkoutInfo = (JSONObject) session.getAttribute("checkoutInfo");
		System.out.println(checkoutInfo.toString());
		String memberId = (String) session.getAttribute("memberId");
		int orderId;
		
		
		int totalPrice= checkoutInfo.getInt("totalPrice");
		String shippingMethod= checkoutInfo.getString("shippingMethod");
		String paymentMethod= checkoutInfo.getString("paymentMethod");
		JSONArray cart = checkoutInfo.getJSONArray("cart");
		Connection conn = null;
		
		String sql = "INSERT INTO orders (userId, totalPrice, shippingMethod, paymentMethod) VALUES(?,?,?,?)";
		try {
			conn = new ConnDb().getCon();
			//transition模式
			conn.setAutoCommit(false);
			
			PreparedStatement pre = conn.prepareStatement(sql);
			pre.setString(1, memberId);
			pre.setLong(2, totalPrice);
			pre.setString(3, shippingMethod);
			pre.setString(4, paymentMethod);
			pre.executeUpdate();
			System.out.println("prepareStatement");
			Statement stm = conn.createStatement();
			sql = "SELECT LAST_INSERT_ID();";
			ResultSet res =  stm.executeQuery(sql);
			res.next();
			orderId = res.getInt(1);
			
			sql = "INSERT INTO orderdetails (orderId, productId, count, price)VALUES(?,?,?,?)";
			for(int i=0; i<cart.length(); i++) {
				JSONObject item =(JSONObject) cart.get(i);
				pre = conn.prepareStatement(sql);
				
				pre.setLong(1, orderId);
				pre.setString(2, item.getString("productId"));
				pre.setLong(3, item.getInt("count"));
				pre.setLong(4, item.getInt("price"));
				pre.executeUpdate();
			}
			conn.commit();
			System.out.println("sql success");
			sql = "DELETE FROM cart WHERE email = ?";
			pre = new ConnDb().getCon().prepareStatement(sql);
			pre.setString(1, memberId);
			pre.executeUpdate();
			session.removeAttribute("cartJson");
			session.removeAttribute("checkoutInfo");
			
			request.getRequestDispatcher("memberPage.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
			if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException rollbackException) {
                    rollbackException.printStackTrace();
                }
            }

            //轉發到結帳失敗頁面
            request.getRequestDispatcher("checkoutError.jsp").forward(request, response);
		}
		
		
		
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}