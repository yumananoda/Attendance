/** ログイン */
package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import models.UserBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String employeeCD = request.getParameter("employeeCD");
		String password = request.getParameter("password");
		System.out.println(employeeCD);
		System.out.println(password);
		int employeeCD2 =Integer.parseInt(employeeCD);
		
		//アカウント検索
		UserDao dao = new UserDao();
		UserBean user = dao.findUser(employeeCD2, password);
		System.out.println(user);
		
		//画面遷移
		if(user != null) {
			System.out.print("ログイン成功");
			session.setAttribute("employeeCD", String.valueOf(user.getEmployeeCD()));
			
			request.getRequestDispatcher("/Attendance.jsp").forward(request, response);
		}else {
			System.out.print("ログイン失敗");
			request.setAttribute("message", "従業員コードかパスワードが違います。");
			request.getRequestDispatcher("/Login.jsp").forward(request, response);
		}
	}

}
