package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Logout");
		HttpSession session = request.getSession();
		
		session.removeAttribute("employeeCD");
		session.removeAttribute("name");
		session.removeAttribute("storeCD");
		session.removeAttribute("isAdmin");
		session.removeAttribute("clockIn");
		session.removeAttribute("clockOut");
		session.removeAttribute("breakIn");
		session.removeAttribute("breakOut");
		session.removeAttribute("selectEmployee");
		session.removeAttribute("selectRetireEmployees");
		request.getRequestDispatcher("/Logout.jsp").forward(request, response);
	}

}
