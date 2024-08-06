package servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import JDBC.ConnDb;

/**
 * Servlet implementation class addNewMember
 */
@WebServlet("/addNewMember")
public class addNewMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		String email=request.getParameter("email");
		String pswd=request.getParameter("pswd");
		String familyName=request.getParameter("familyName");
		String name=request.getParameter("name");
		String birth=request.getParameter("birth");
		String mobile=request.getParameter("mobile");
		String address=request.getParameter("address");
		String getNews=request.getParameter("getNews");
		if(getNews==null){
			getNews="0";
		}else {
			getNews="1";
		}
		
		String sql="INSERT INTO member (email, pswd, familyName, name, birth, mobile, address, getNews)"
				+ "VALUES (?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pre=new ConnDb().getCon().prepareStatement(sql);
			pre.setString(1, email);
			pre.setString(2, pswd);
			pre.setString(3, familyName);
			pre.setString(4, name);
			pre.setString(5, birth);
			pre.setString(6, mobile);
			pre.setString(7, address);
			pre.setString(8, getNews);

			
			pre.executeUpdate();
			pre.close();
			session.setAttribute("memberId", email);
			response.sendRedirect("showAllProduct.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}