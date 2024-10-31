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
	<button id="cross" class="cross"><span class="icon"><ion-icon name="close-outline"></ion-icon></span>従業員選択画面へ</button>
	<h1>従業員情報変更</h1>
	<p>以下の項目に変更したい情報をご入力の上、「変更」ボタンをクリックしてください。</p>
	<input type="hidden" id="employeeInfo" value=<%= employeeInfo %> />
	<form action="EditEmployeeInfoConfirmServlet" method="post" id="editForm"> 
		<div class="input">
			<lavel>従業員番号</lavel>
			<p id="employeeCD"></p>
		</div>
		<div class="input">
			<lavel>氏名</lavel>
			<p id="name"></p>
		</div>
		<div class="input">
			<lavel>メールアドレス</lavel>
			<p id="email"></p>
		</div>
		<div class="input">
			<lavel>店舗名</lavel>
			<p id="storeName"></p>
		</div>
		<div class="input">
			<lavel>入社日</lavel>
			<p id="hireDate"></p>
		</div>
		<div class="input">
			<lavel>役職</lavel>
			<p id="position"></p>
		</div>
		<div class="input">
			<lavel>退職日</lavel>
			<p id="retire"></p>
		</div>

		<button type="reset" id="resetBtn" class="btn">リセット</button>
		<input type="submit" class="btn" value="確認画面へ">
	</form>
	<%-- <form action="DispEmployeeRetireServlet" method="post">
		<input type="submit" value="退職手続き" />
		<input type="hidden" value=<%= employeeInfo.employeeCD %> />
	</form> --%>
</div>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script type="module" src="js/const.js" ></script>
<script type="module" src="js/editEmployeeInfo.js" ></script>
</body>
</html>