package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
/**
 * Servlet Filter implementation class SessionFilter
 */
@WebFilter("/loginFilter")
public class loginFilter extends HttpFilter implements Filter {

	private static final long serialVersionUID = 1L;

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		System.out.println("enter filter");
		Object userId=req.getSession().getAttribute("memberId");
		if(userId!=null) {
			chain.doFilter(request, response);
			System.out.println("userId!=null");
		}else
			request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
