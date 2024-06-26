package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.ShiftRegisterDao;
import models.ShiftRegisterBean;

/**
 * Servlet implementation class ShiftRegisterServlet
 */
@WebServlet("/ShiftRegisterServlet")
public class ShiftRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShiftRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		System.out.println("called");
		ArrayList<ShiftRegisterBean> ShiftRegisterList = new ArrayList<>();
		ShiftRegisterDao shiftDao = new ShiftRegisterDao();
//		HttpSession session = request.getSession();
//		System.out.println(session);
//		String managerCD = (String)session.getAttribute("employeeCD");
//		int managerCD2 = Integer.parseInt(managerCD);
//		System.out.println(managerCD2);

		StringBuilder sb = new StringBuilder();
		String line;
		BufferedReader reader = request.getReader();
		line = reader.readLine();
		System.out.println(line);
		while (line != null) {
			sb.append(line);
			line = reader.readLine();
		}
		System.out.println("line:");
		System.out.println(line);

		String requestBody = sb.toString();
		ObjectMapper objectMapper = new ObjectMapper();
		System.out.println("requestBody:");
		System.out.println(requestBody);
		List<Map<String, Object>> dataList = objectMapper.readValue(requestBody, List.class);
		System.out.println("dataList:");
		System.out.println(dataList);
		for(Map<String, Object> data: dataList) {
			int employeeCD = (int) data.get("employeeCD");
			int shift_day = (int) data.get("shift_day");
			
			String start_time = (String) data.get("start_time");
			Time start_time2 = Time.valueOf(start_time + ":00");
			
			String end_time = (String) data.get("end_time");
			Time end_time2 = Time.valueOf(end_time + ":00");
			
			ShiftRegisterBean ShiftRegisterRequest = new ShiftRegisterBean(employeeCD, shift_day, start_time2, end_time2);
			ShiftRegisterList.add(ShiftRegisterRequest);
		}
		for(ShiftRegisterBean ShiftRegisterRequest : ShiftRegisterList) {
			shiftDao.shiftRegister(ShiftRegisterRequest);
		}
	}

}
