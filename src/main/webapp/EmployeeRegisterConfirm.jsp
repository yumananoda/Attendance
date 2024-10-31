<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int isAdmin = (int)session.getAttribute("isAdmin"); 
System.out.println("isAdmin:" + isAdmin);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>従業員登録確認画面</title>
<link rel="stylesheet" href="css/employeeRegisterConf.css" />
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
	<p>以下の内容で登録します。よろしいですか？</p>
	<div id="employeeArea"></div>
	<form id="registerForm">
	<button type="submit" class="btn">登録</button>
	</form>
</div>
<script type="module" src="js/EmployeeRegisterConfirm.js" ></script>
</body>
</html>