<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.SelectEmployeeBean" %>
<%
ArrayList<SelectEmployeeBean> selectEmployees = (ArrayList<SelectEmployeeBean>)session.getAttribute("selectEmployee");
ArrayList<SelectEmployeeBean> selectRetireEmployees = (ArrayList<SelectEmployeeBean>)session.getAttribute("selectRetireEmployees");
int isAdmin = (int)session.getAttribute("isAdmin"); 
System.out.println("isAdmin:" + isAdmin);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>従業員選択</title>
<link rel="stylesheet" href="css/checkboxSelected.css">
<link rel="stylesheet" href="css/selectEmployee.css">
</head>
<body>
<div class="sidebar">
	<% if(isAdmin == 1){ %>
		<jsp:include page="ManagerSideMenu.jsp" />
	<% }else{ %>
		<jsp:include page="EmployeeSideMenu.jsp" />
	<% } %>
</div>
<div class="contents">
	<div>
		<label><input type="checkbox" id="retireCheck" />退職済</label>
		
		<div id="employed" class="checkbox selected">
			<%  for(SelectEmployeeBean selectEmployee : selectEmployees){ %>
			<div class="current">
				<%= selectEmployee.getEmployeeCD() %>
				<%= selectEmployee.getName() %>
				<a href="DispShiftRegisterServlet?employeeCD=<%= selectEmployee.getEmployeeCD() %>">固定シフト登録</a>
				<a href="DispShiftChangeServlet?employeeCD=<%= selectEmployee.getEmployeeCD() %>">日時指定シフト変更</a>
				<a href="DispEditEmployeeInfoServlet?employeeCD=<%= selectEmployee.getEmployeeCD() %>">従業員情報変更</a>
				<a href="DispTimeRecordServlet?employeeCD=<%= selectEmployee.getEmployeeCD() %>&name=<%= selectEmployee.getName() %>">勤怠状況</a>
			</div>
			<% } %>
		</div>
	
		<div id="retired" class="checkbox">
			<%  for(SelectEmployeeBean selectRetireEmployee : selectRetireEmployees){ %>
			<div class="retire">
				<%= selectRetireEmployee.getEmployeeCD() %>
				<%= selectRetireEmployee.getName() %>
				<a href="DispEditEmployeeInfoServlet?employeeCD=<%= selectRetireEmployee.getEmployeeCD() %>">従業員情報変更</a>
				<div><a href="DispTimeRecordServlet?employeeCD=<%= selectRetireEmployee.getEmployeeCD() %>&name=<%= selectRetireEmployee.getName() %>">勤怠状況</a>
			</div>
			<% } %>
		</div>
	</div>	
</div>
<script type="module" src="js/selectEmployee.js" ></script>
</body>
</html>
