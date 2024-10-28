<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int employeeCD = (int)request.getAttribute("employeeCD");
String name = (String)request.getAttribute("name");
String shift = (String)request.getAttribute("shift");
int isAdmin = (int)session.getAttribute("isAdmin"); 
System.out.println("isAdmin:" + isAdmin);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>固定シフト登録</title>
<link rel="stylesheet" href="css/shiftRegister.css">
<link rel="stylesheet" href="css/modal.css">
<link rel="stylesheet" href="css/shiftChange.css">
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
	<h1><%= employeeCD %> <%= name %></h1>
	<input id="employeeCD" type="hidden" value=<%= employeeCD %> />
	<input id="shift" type="hidden" value=<%= shift %> />
	<div id="selectDuration">
		<span class="btn-monthMove prev">＜</span>
		<span id="year"></span>
		<span id="month"></span>
		<span class="btn-monthMove next">＞</span>
	</div>
	<div id="selectWeek"></div>
	<div id="DispDailyEl"></div>
	<div id="error">
		<% if(request.getAttribute("message") != null){ %>
		<%= request.getAttribute("message") %>
		<% } %>
	</div>
	<div id="btnArea" class="btnArea">
		<button id="resetBtn">リセット</button>
		<button id="registerBtn">登録</button>
	</div>
	<div id="layer" class="layer">
		<div class="modal">
			<button id="closeBtn" class="close-button">×</button>
			<div class="modal__content">
				シフトの登録が完了しました。
				<div>
					<a href="DispSelectEmployeeServlet">従業員選択画面へ</a><br>
					<a href="DispClockServlet">トップへ</a>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="module" src="js/const.js" ></script>
<script type="module" src="js/shiftRegister.js" ></script>
</body>
</html>