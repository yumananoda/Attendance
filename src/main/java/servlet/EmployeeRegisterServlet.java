package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import models.UserBean;

/**
 * Servlet implementation class EmployeeRegisterServlet
 */
@WebServlet("/EmployeeRegisterServlet")
public class EmployeeRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeRegisterServlet() {
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
		ArrayList<UserBean> EmployeeRegisterList = new ArrayList<>();
		StringBuilder sb = new StringBuilder();
		BufferedReader reader = request.getReader();
		System.out.println(reader);
		String line;
		while ((line = reader.readLine()) != null) {
			System.out.println(line);
		}
		String requestBody = sb.toString();
		System.out.println("ここ0");
		
		ObjectMapper objectMapper = new ObjectMapper();
		System.out.println("ここ１");
		List<Map<String, Object>> dataList = objectMapper.readValue(requestBody, List.class);
		
		for(Map<String, Object> data: dataList) {
			String name = (String) data.get("name");
			String email = (String) data.get("email");
			int position = (int)data.get("position");
			String hire_date = (String) data.get("hire_date");
			LocalDate localDate = LocalDate.parse(hire_date);
			Date sqlDate = Date.valueOf(localDate);
			System.out.println("ここ１");
//			int storeCD = 2;
//			
//			GeneratorPassword generatorPassword = new GeneratorPassword();
//			String password = generatorPassword.generate();
//			int employeeCD=2;
//			System.out.println("ここ3");
//			
//			UserBean EmployeeRegisterRequest = new UserBean(employeeCD, storeCD, position, name, password, email, sqlDate);
//			EmployeeRegisterList.add(EmployeeRegisterRequest);
		}
		
	}

}
