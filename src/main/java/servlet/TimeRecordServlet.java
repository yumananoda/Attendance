package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.TimeRecordDao;
import models.TimeRecordsBean;

/**
 * Servlet implementation class TimeRecordServlet
 */
@WebServlet("/TimeRecordServlet")
public class TimeRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TimeRecordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String employeeCD = request.getParameter("employeeCD");
		//int employeeCD2 = Integer.parseInt(employeeCD);
		int employeeCD2=2;
		TimeRecordDao status = new TimeRecordDao();
		ArrayList<TimeRecordsBean> timeRecords = status.getStatus(employeeCD2);
		System.out.println(timeRecords);
		
		ObjectMapper mapper = new ObjectMapper();
		System.out.println(mapper);
		String json = mapper.writeValueAsString(timeRecords);
		System.out.println(json);
		
		HttpSession session = request.getSession();
		session.setAttribute("timeRecords", json);
		request.getRequestDispatcher("/TimeRecord.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			
	}

}
