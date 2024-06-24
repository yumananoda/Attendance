package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import models.SelectEmployeeBean;

/**
 * Servlet implementation class SelectEmployeeServlet
 */
@WebServlet("/SelectEmployeeServlet")
public class SelectEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		HttpSession session = request.getSession();
		String managerCD = (String)session.getAttribute("employeeCD");
		int managerCD2 = Integer.parseInt(managerCD);

		UserDao userDao = new UserDao();
		int storeCD = userDao.findStoreCD(managerCD2);
		
		ArrayList<SelectEmployeeBean> SelectEmployee = userDao.SelectEmployeeCDOfShiftRegister(storeCD);
		
		
	}

}
