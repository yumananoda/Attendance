<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int employeeCD = (int)request.getAttribute("employeeCD");
String name = (String)request.getAttribute("name");
String shift = (String)request.getAttribute("shift");
String exceptionShift = (String)request.getAttribute("exceptionShift");
int isAdmin = (int)session.getAttribute("isAdmin"); 
System.out.println("isAdmin:" + isAdmin);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>日時指定シフト変更</title>
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
	<button id="cross" class="cross"><span class="icon"><ion-icon name="close-outline"></ion-icon></span>従業員選択画面へ</button>
	<h1><%= employeeCD %> <%= name %></h1>
	<form id="shiftChangeForm" action="ShiftChangeServlet" method="post">
		<input id="employeeCD" type="hidden" name="employeeCD" value=<%= employeeCD %> />
		<input id="shift" type="hidden" value=<%= shift %> />
		<input id="exceptionShift" type="hidden" value=<%= exceptionShift %> />
		
		<div>
			<select id="application_category" class="category" name="application_category" required >
				<option value="">--申請区分を選択してください--</option>
				<option value="addShift">シフトに追加</option>
				<option value="removeShift">シフトから削除</option>
				<option value="changeTime">シフトの時間変更</option>
			</select>
		</div>
	
		<div id="selectChengeDate">
			<input type="date" id="changeDete" class="dateTime" name="changeDete" required />
			<input type="time" id="changeTimeStart" class="dateTime" name="changeTimeStart" required />~
			<input type="time" id="changeTimeEnd" class="dateTime" name="changeTimeEnd" required />
		</div>
	
		
		<div id="error">
			<% if(request.getAttribute("message") != null){ %>
			<%= request.getAttribute("message") %>
			<% } %>
		</div>
		<div id="btnArea" class="btnArea">
			<input type="reset" class="btn resetBtn" value="リセット" />
			<button id="registerBtn" class="btn">登録</button>
			
		</div>
		<div id="changeHistory" class="changeHistory">
			<div id="addShift" class="addShift"></div>
			<div id="removeShift" class="removeShift"></div>
			<div id="changeShift" class="changeShift"></div>
		</div>
	</form>
	<div id="layer" class="layer">
		<div class="modal">
			<button id="closeBtn" class="close-button"><span class="icon"><ion-icon name="close-outline"></ion-icon></span></button>
			<div class="modal__content">
				変更が完了しました。<br>
				続けて登録・削除を行う場合は左上の×ボタンを押してください。
				<div>
					<a href="DispSelectEmployeeServlet">従業員選択画面へ</a><br>
					<a href="DispClockServlet">トップへ</a>
				</div>
			</div>
		</div>
	</div>
	<div id="error"></div>
</div>
<script type="module" src="js/const.js" ></script>
<script type="module" src="js/shiftChange.js" ></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>