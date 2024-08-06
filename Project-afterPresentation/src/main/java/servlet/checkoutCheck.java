package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Servlet implementation class checkoutCheck
 */
@WebServlet("/checkoutCheck")
public class checkoutCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String shippingMethod = request.getParameter("shippingMethod");
		String paymentMethod = request.getParameter("paymentMethod");
		System.out.println("checkoutCheck");
		String cart = request.getParameter("cart");
		String totalPrice = request.getParameter("total");
		JSONArray cartArray = new JSONArray(cart);
		
        JSONObject orderInfo = new JSONObject();
        orderInfo.put("cart", cartArray);
        orderInfo.put("shippingMethod", shippingMethod);
        orderInfo.put("paymentMethod", paymentMethod);
        orderInfo.put("totalPrice", totalPrice);
        
        session.setAttribute("checkoutInfo", orderInfo);
        System.out.println(orderInfo.toString());
        response.sendRedirect("checkoutInfo.jsp");
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}