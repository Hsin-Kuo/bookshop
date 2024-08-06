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

import org.json.JSONArray;
import org.json.JSONObject;

import JDBC.ConnDb;

/**
 * Servlet implementation class showProduct
 */
@WebServlet("/showProduct")
public class showProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productId = request.getParameter("productId");

		Statement stm;
		try {
			stm = new ConnDb().getCon().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			String sql = "SELECT * FROM product WHERE productId = '"+productId+"'";
			ResultSet res = stm.executeQuery(sql);
			
			
//			JSONArray bookdatas = new JSONArray();
//			JsonArrayBuilder arrayBuilder = Json.createArrayBuilder();
//			StringBuilder Jsons = new StringBuilder();
//			for(int i=0;i<itemsPerPage; i++){
//				HashMap<String, Object> bookdata = new HashMap<String, Object>();
			JSONObject bookdata = new JSONObject();	
			if(res.next()){
					String firstImg = res.getString(13);
//					int index;
//					if((index=firstImg.indexOf(","))!=-1)
//						firstImg = firstImg.substring(0,index);
					
					
					bookdata.put("productId", res.getString(2));
					bookdata.put("name", res.getString(3));
			        bookdata.put("author", res.getString(4));
			        bookdata.put("publisher", res.getString(5));
			        
			        bookdata.put("price", res.getInt(7));
			        bookdata.put("valuedPrice", res.getInt(8));
			        bookdata.put("date", res.getString(6));
			        bookdata.put("introduction", res.getString(10));
			        bookdata.put("aboutAuthor", res.getString(11));
			        bookdata.put("info", res.getString(12));
			        bookdata.put("img", firstImg);


				}
//			String jsonString = bookdatas.toString();
			response.setContentType("application/json;charset=UTF-8");
	        response.getWriter().write(bookdata.toString());
				
			
//			JsonArray bookdatas = arrayBuilder.build();
//			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}