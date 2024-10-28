<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("editEmp.Jsp");
	String employeeInfo = (String)request.getAttribute("employeeInfo");
	System.out.println("employeeInfo:" + employeeInfo);
	int isAdmin = (int)session.getAttribute("isAdmin"); 
	System.out.println("isAdmin:" + isAdmin);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>従業員情報変更</title>
<link rel="stylesheet" href="css/editEmployeeInfo.css" />
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
	<h1>従業員情報変更</h1>
	<p>以下の項目に変更したい情報をご入力の上、「変更」ボタンをクリックしてください。</p>
	<input type="hidden" id="employeeInfo" value=<%= employeeInfo %> />
	<form action="EditEmployeeInfoConfirmServlet" method="post" id="editForm">
		<table>
			<tr>
				<th>従業員番号</th>
				<td id="employeeCD"></td>
			</tr>
			<tr>
				<th>氏名</th>
				<td id="name"></td>
			</tr>
			<tr>
				<th>メールアドレス</th>
				<td id="email"></td>
			</tr>
			<tr>
				<th>店舗名</th>
				<td id="storeName"></td>
			</tr>
			<tr>
				<th>入社日</th>
				<td id="hireDate"></td>
			</tr>
			<tr>
				<th>役職</th>
				<td id="position"></td>
			</tr>
			<tr>
				<th>退職日</th>
				<td id="retire"></td>
			</tr>
		</table>
		<input type="submit" value="確認画面へ">
	</form>
	<%-- <form action="DispEmployeeRetireServlet" method="post">
		<input type="submit" value="退職手続き" />
		<input type="hidden" value=<%= employeeInfo.employeeCD %> />
	</form> --%>
	<button type="reset" id="resetBtn">リセット</button>
</div>
<script type="module" src="js/const.js" ></script>
<script type="module" src="js/editEmployeeInfo.js" ></script>
</body>
</html>