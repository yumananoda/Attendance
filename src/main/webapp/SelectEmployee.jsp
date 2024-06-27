<%@ pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.SelectEmployeeBean" %>
<% ArrayList<SelectEmployeeBean> selectEmployees = (ArrayList<SelectEmployeeBean>)session.getAttribute("selectEmployee"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>従業員選択</title>
</head>
<body>

	<div>
		<table>
            <tr>
                <th>従業員コード</th>
                <th>氏名</th>
                <th></th>
            </tr>
			<%  for(SelectEmployeeBean selectEmployee : selectEmployees){ %>
				<tr>
					<td><%= selectEmployee.getEmployeeCD() %></td>
					<td><%= selectEmployee.getName() %></td>
					<td><a href="DispShiftRegisterServlet?employeeCD=<%= selectEmployee.getEmployeeCD() %>">遷移</a></td>
				</tr>
			<% } %>
		</table>
	</div>	
</body>
</html>
