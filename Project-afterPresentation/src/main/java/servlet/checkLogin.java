package servlet;

import java.io.IOException;
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
import org.json.JSONObject;

import JDBC.ConnDb;

/**
 * Servlet implementation class checkLogin
 */
@WebServlet("/checkLogin")
public class checkLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		Statement stm = new ConnDb().getCon().createStatement();
		String id=request.getParameter("id");
		String pswd=request.getParameter("pswd");
		String pw=request.getParameter("pw");
		String sql = "SELECT * FROM member WHERE email='"+id+"' AND pswd='"+pswd+"';";
		ResultSet res = stm.executeQuery(sql);
		HttpSession session = request.getSession();
		
		//驗證通過
		if(res.next()){
			session.setAttribute("memberId", id);
			session.setAttribute("pswd", pswd);
			session.setAttribute("userName", res.getString("name"));
			//臨時購物車轉移至會員購物車
			toMemberCart(session, id);
			JSONArray cartJson =generateJSON(id);
			session.setAttribute("cartJson", cartJson);
			
			response.sendRedirect("showAllProduct.jsp");
		}else{
			response.sendRedirect("login.jsp?error=wrong_pswd");
		}
		}catch(SQLException e) {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	//之後再寫
	protected void toMemberCart(HttpSession session, String memberId) {
		JSONArray cartJson = (JSONArray) session.getAttribute("cartJson");
		if(cartJson!=null&&cartJson.length()>0) {
		Statement stm;
		
		try {
			stm = new ConnDb().getCon().createStatement();
			for(int i=0; i<cartJson.length(); i++) {
				JSONObject item = (JSONObject) cartJson.get(i);
				String productId = item.getString("productId");
				String sql = "SELECT * FROM cart WHERE email = '"+memberId+"' AND productId = '"+productId+"'";
				
				ResultSet res = stm.executeQuery(sql);
				
				if(res.next()) {
					sql = "UPDATE cart SET count = "+(res.getInt("count")+1)+" WHERE productId='"+productId+"'AND email='"+memberId+"'";					
				}else {
					sql = "INSERT INTO cart (email, productId, count) VALUES('"+memberId+"', '"+productId+"', 1)";
				}
				stm.executeUpdate(sql);
			}
			
		}catch(SQLException e) {
			
		}
			
		}
		
	}
	
	protected JSONArray generateJSON(String memberId) throws SQLException {
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
	
	protected int getPriceById(String productId) throws SQLException {
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
	
	protected String getImgById(String productId) throws SQLException {
		Statement stm = new ConnDb().getCon().createStatement();
		String sql = "SELECT img FROM product WHERE productId = '"+productId+"'";
		ResultSet res = stm.executeQuery(sql);
		if(res.next()) {
			return res.getString("img").substring(0, res.getString("img").indexOf(","));
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