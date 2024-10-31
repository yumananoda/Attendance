<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
System.out.println("called jsp");
int employeeCD = (int) request.getAttribute("employeeCD");
System.out.println("employeeCD:" + employeeCD);
String name = (String) request.getAttribute("name");
System.out.println("name:" + name);
int recordCD = (int) request.getAttribute("recordCD");
System.out.println("recordCD:" + recordCD);
String clockInTime = (String) request.getAttribute("clockInTime");
System.out.println("clockInTime:" + clockInTime);
String clockOutTime = (String) request.getAttribute("clockOutTime");
System.out.println("clockOutTime:" + clockOutTime);
int isAdmin = (int) session.getAttribute("isAdmin");
System.out.println("isAdmin:" + isAdmin);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/modal.css">
<link rel="stylesheet" href="css/editTimeRecord.css" />
<title></title>
</head>
<body>
<div class="sidebar">
	<%
	if (isAdmin == 1) {
	%>
	<jsp:include page="ManagerSideMenu.jsp" />
	<%
	} else {
	%>
	<jsp:include page="EmployeeSideMenu.jsp" />
	<%
	}
	%>
</div>
<div class="contents">
	<button id="cross" class="cross"><span class="icon"><ion-icon name="close-outline"></ion-icon></span>従業員選択画面へ</button>
	<%-- <form action="EditTimeRecordServlet" method="POST" id="editTimeRecordForm"> --%>
	<form id="editTimeRecordForm">
		<h1>
			勤怠修正-<%=name%>(従業員番号:<%=employeeCD%>)
		</h1>
		<input type="hidden" id="recordCD" name="recordCD"
			value=<%=recordCD%> /> <input type="hidden" id="clockInTime"
			value=<%=clockInTime%> /> <input type="hidden" id="clockOutTime"
			value=<%=clockOutTime%> />
		<div id="dateArea">
			<p id="selectDate"></p>
			<input type="hidden" id="selectDateValue" name="selectDateValue" />
		</div>
		<div class="timeArea">
			<div id="beforeTimeArea">
				<p>変更前</p>
				<input type="time" id="beforeClockInTime" name="beforeClockInTime" disabled /><span>~<span>
				<input type="time" id="beforeClockOutTime" name="beforeClockOutTime" disabled />
			</div>
			<div id="afterTimeArea">
				<p>変更後</p>
				<input type="time" id="afterClockInTime" name="afterClockInTime" required /><span>~<span>
				<input type="time" id="afterClockOutTime" name="afterClockOutTime" required />
			</div>
		</div>
		<div id="error" class="error"></div>
		<input type="submit" class="btn" value="変更" />
	</form>
	<div id="layer" class="layer">
		<div class="modal">
			<button id="closeBtn" class="close-button"><span class="icon"><ion-icon name="close-outline"></ion-icon></span></button>
			<div class="modal__content">
				打刻時刻の変更が完了しました。
				<div>
					<a href="DispSelectEmployeeServlet">従業員選択画面へ</a><br> <a
						href="DispClockServlet">トップへ</a>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script type="module" src="js/editTimeRecord.js"></script>
<script type="module" src="js/const.js"></script>
</body>
</html>