package servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JDBC.ConnDb;

/**
 * Servlet implementation class addNewProduct
 */
@WebServlet("/addNewProduct")
public class addNewProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String productId=request.getParameter("productId");
		String productName=request.getParameter("productName");
		String author=request.getParameter("author");
		String publisher=request.getParameter("publisher");
		String publicationDate=request.getParameter("publicationDate");
		String price=request.getParameter("price");
		String valuedPrice=request.getParameter("valuedPrice");
		String bookCate=request.getParameter("bookCate");
		String introduction=request.getParameter("introduction");
		String aboutAuthor=request.getParameter("aboutAuthor");
		String info=request.getParameter("info");
		StringBuffer images= new StringBuffer();
		int i=1;
		while(i<11) {
			String image = request.getParameter("img"+i);
			if(image!=null) {
				images.append(image+",");
				i++;
			}else {
				i=11;
			}
		}
		String sql="INSERT INTO product (productId, productName,author, publisher, publicationDate, price, valuedPrice, bookCate, introduction, aboutAuthor, info, img)"
				+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pre=new ConnDb().getCon().prepareStatement(sql);
			pre.setString(1, productId);
			pre.setString(2, productName);
			pre.setString(3, author);
			pre.setString(4, publisher);
			pre.setString(5, publicationDate);
			pre.setString(6, price);
			pre.setString(7, valuedPrice);
			pre.setString(8, bookCate);
			pre.setString(9, introduction);
			pre.setString(10, aboutAuthor);
			pre.setString(11, info);
			pre.setString(12, images.toString());
			
			pre.executeUpdate();
			pre.close();
			response.sendRedirect("manageProduct.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}