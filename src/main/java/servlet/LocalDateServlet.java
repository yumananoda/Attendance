package servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LocalDateServlet")
public class LocalDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter d = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		System.out.println(now.format(d));
        request.setAttribute("date", now.format(d));
        
        DateTimeFormatter h = DateTimeFormatter.ofPattern("HH:mm:ss");
		System.out.println(now.format(h));
        request.setAttribute("time", now.format(h));
        
        request.getRequestDispatcher("/Login.jsp").forward(request, response);
	}



	//protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	doGet(request, response);
	//}

}
