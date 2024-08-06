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
@WebServlet("/addToCart")
public class addToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String productId = request.getParameter("productId");
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		JSONArray cartJson = new JSONArray();	
		if(productId==null) {
			return;
		}
		
		
		if(memberId==null) {
			// 獲取臨時購物車 JSON 字符串
			cartJson = (JSONArray) session.getAttribute("cartJson");

			// 如果 session 中還沒有購物車，則創建一個新的購物車
			if (cartJson == null) {
			    cartJson = new JSONArray();
			}
			

			// 檢查購物車中是否已存在相同 productId 的商品
			boolean productExists = false;
			for (int i = 0; i < cartJson.length(); i++) {
			    JSONObject item = cartJson.getJSONObject(i);
			    String existingProductId = item.optString("productId");

			    if (existingProductId != null && existingProductId.equals(productId)) {
			        // 如果存在相同商品，更新數量而不是添加新項目
			        int existingQuantity = item.optInt("count", 0);
			        item.put("count", existingQuantity + 1);
			        productExists = true;
			        break;
			    }
			}

			// 如果購物車中沒有相同商品，則添加一個新的項目
			if (!productExists) {
			    JSONObject newItem = new JSONObject();
			    newItem.put("productId", productId);
			    newItem.put("count", 1);
			    
			    cartJson.put(newItem);
			}
			
			//更新品名、價錢、照片
			for(int i=0; i<cartJson.length(); i++) {
				JSONObject item =(JSONObject) cartJson.get(i);
				try {
					item.put("price", DbCart.getPriceById(item.getString("productId")));
					item.put("img", DbCart.getImgById(item.getString("productId")));
					item.put("name", DbCart.getNameById(item.getString("productId")));
				} catch (JSONException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			// 將更新後的購物車存回 session
			session.setAttribute("cartJson", cartJson);
			
			
		}else {
			Statement stm;
			System.out.println(memberId);
			try {
				stm = new ConnDb().getCon().createStatement();
			
			String sql = "SELECT * FROM cart WHERE email = '"+memberId+"' AND productId = '"+productId+"'";
			
			ResultSet res = stm.executeQuery(sql);
			
			if(res.next()) {
				sql = "UPDATE cart SET count = "+(res.getInt("count")+1)+" WHERE productId='"+productId+"'AND email='"+memberId+"'";					
			}else {
				sql = "INSERT INTO cart (email, productId, count) VALUES('"+memberId+"', '"+productId+"', 1)";
			}
			stm.executeUpdate(sql);
			
			//將更新後的購物車存成JSON
			cartJson = DbCart.generateJSON(memberId);
			System.out.println(cartJson.toString());
			
			session.setAttribute("cartJson", cartJson);
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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