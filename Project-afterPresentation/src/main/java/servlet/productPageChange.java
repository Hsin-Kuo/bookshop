package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

//import javax.json.Json;
//import javax.json.JsonArray;
//import javax.json.JsonArrayBuilder;
//import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import org.json.JSONArray;

import JDBC.ConnDb;

/**
 * Servlet implementation class productPageChange
 */
@WebServlet("/productPageChange")
public class productPageChange extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int itemsPerPage = Integer.parseInt(request.getParameter("itemsPerPage"));
		//Integer.parseInt(request.getParameter("itemsPerPage"));
		int pageNum = Integer.parseInt(request.getParameter("page"));
		Statement stm;
		try {
			stm = new ConnDb().getCon().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			String sql = "SELECT * FROM product";
			ResultSet res = stm.executeQuery(sql);
			res.last();		// 指標移到最後一筆資料
			int totalRow=res.getRow();	// 取得最後一筆資料的編號
			int totalPage = (int)Math.ceil((double)totalRow/itemsPerPage);
			System.out.println(itemsPerPage);
			System.out.println(totalRow);
			System.out.println(totalPage);
			res.absolute(pageNum*itemsPerPage-itemsPerPage);
			
			JSONArray bookdatas = new JSONArray();
//			JsonArrayBuilder arrayBuilder = Json.createArrayBuilder();
//			StringBuilder Jsons = new StringBuilder();
			for(int i=0;i<itemsPerPage; i++){
//				HashMap<String, Object> bookdata = new HashMap<String, Object>();
				if(res.next()){
					String firstImg = res.getString(13);
					firstImg = firstImg.substring(0,firstImg.indexOf(","));
					
					JSONObject bookdata = new JSONObject();
					bookdata.put("productId", res.getString(2));
					bookdata.put("name", res.getString(3));
			        bookdata.put("author", res.getString(4));
			        bookdata.put("publisher", res.getString(5));
			        
			        bookdata.put("price", res.getInt(7));
			        bookdata.put("valuedPrice", res.getInt(8));
			        bookdata.put("date", res.getString(6));
			        bookdata.put("introduction", res.getString(10));
			        bookdata.put("img", firstImg);

			        bookdatas.put(bookdata);

//					String makeJson = "{\"name\": \""+res.getString(2)+"\","
//			        		+ " \"author\": \""+res.getString(4)+"\","
//	        				+ " \"publisher\": \""+res.getString(5)+"\","
//    						+ " \"author\": \""+res.getString(7)+"\","
//			        		+ " \"price\": \""+res.getString(8)+"\","
//	        				+ " \"valuedPrice\": \""+res.getString(6)+"\","
//    						+ " \"date\": \""+res.getString(10)+"\","
//			        		+ " \"img\": \""+firstImg+"\" }";
//					Jsons.append(makeJson);
//					Jsons.append(",");

					//					JsonObject json = Json.createObjectBuilder()
//							.add("name", res.getString(2))
//							.add("author", res.getString(4))
//							.add("publisher", res.getString(5))
//							.add("price", res.getString(7))
//							.add("valuedPrice", res.getString(8))
//							.add("date", res.getString(6))
//							.add("introduction", res.getString(10))
//							.add("img", firstImg)
//							.build();
//					arrayBuilder.add(json);
					
				}
				
				
			}
			
			JSONObject addPage = new JSONObject();
			
			addPage.put("totalPage", totalPage);
			addPage.put("bookdatas", bookdatas);
//			JsonArray bookdatas = arrayBuilder.build();
			String jsonString = addPage.toString();
			response.setContentType("application/json;charset=UTF-8");
	        response.getWriter().write(addPage.toString());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}