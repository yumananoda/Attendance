<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.SelectEmployeeBean" %>
<% ArrayList<SelectEmployeeBean> selectEmployees = (ArrayList<SelectEmployeeBean>)session.getAttribute("selectEmployee"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EndUser and FlontEnd</title>
</head>
<body>
	<div>
		<table>
			<%  for(SelectEmployeeBean selectEmployee : selectEmployees){ %>
				<tr>
					<td><%= selectEmployee.getEmployeeCD() %></td>
					<td><%= selectEmployee.getName() %></td>
					<td><a href="ShowShiftRegisterServlet?employeeCD=<%= selectEmployee.getEmployeeCD() %>">遷移</a></td>
				</tr>
			<% } %>
		</table>
	</div>
	
</body>
</html>