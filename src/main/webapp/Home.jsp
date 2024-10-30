<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime" %>
<%
String employeeCD = (String)session.getAttribute("employeeCD"); 
System.out.println("employeeCD:" + employeeCD);
LocalDateTime clockIn = (LocalDateTime)session.getAttribute("clockIn"); 
System.out.println("clockIn:" + clockIn);
LocalDateTime breakIn = (LocalDateTime)session.getAttribute("breakIn"); 
System.out.println("breakIn:" + breakIn);
LocalDateTime breakOut = (LocalDateTime)session.getAttribute("breakOut"); 
System.out.println("breakOut:" + breakOut);
int isAdmin = (int)session.getAttribute("isAdmin"); 
System.out.println("isAdmin:" + isAdmin);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>打刻</title>
<link rel="stylesheet" href="css/home.css" />
</head>
<body>
<div class="sidebar">
	<% if(isAdmin == 1){ %>
		<jsp:include page="ManagerSideMenu.jsp" />
	<% }else{ %>
		<jsp:include page="EmployeeSideMenu.jsp" />
	<% } %>
</div>
<!--時刻表示-->    
<div class="contents">
	<div class="timeBox">
		<p id="date" class="realtime"></p>
		<p id="realtime" class="realtime"></p>
		<script>
			function twoDigit(num) {
				let ret;
				if( num < 10 ) 
				ret = "0" + num; 
				else 
				ret = num; 
				return ret;
			}
			function showClock() {
				let nowTime = new Date();
				let nowYear = twoDigit( nowTime.getFullYear() );
				let nowMonth = twoDigit( nowTime.getMonth() + 1 );
				let nowDate = twoDigit( nowTime.getDate() );
				<%-- let nowDay = twoDigit( nowTime.getDay()); --%>
				let nowHour = twoDigit( nowTime.getHours() );
				let nowMin  = twoDigit( nowTime.getMinutes() );
				let nowSec  = twoDigit( nowTime.getSeconds() );
				let msg1 = nowYear + "年" + nowMonth + "月" + nowDate + "日";
				let msg2 = nowHour + ":" + nowMin + ":" + nowSec;
				document.getElementById("date").innerHTML = msg1;
				document.getElementById("realtime").innerHTML = msg2;
			}
			setInterval('showClock()',1000);
		</script>
	</div>

	<div class="buttonWrap">
		<div class="buttonWrap1">
			<form action="ClockInServlet" class="form clockIn" method="POST">
				<input type="hidden" id="employeeCD" name="employeeCD" value="<%=employeeCD %>">
			<% if(clockIn != null){ %> 
				<button class="flex-item" type="submit" value="clock-in" disabled>出勤</button>
				<% }else{ %>
				<button class="flex-item" type="submit" value="clock-in" >出勤</button>
				<% } %>
			</form>

			<form action="ClockOutServlet" class="form clockOut" method="POST">
				<input type="hidden" id="employeeCD" name="employeeCD" value="<%=employeeCD %>">
				<%  if(clockIn == null || breakIn != null){ %>
				<button class="flex-item" type="submit" value="clock-out" disabled>退勤</button>
				<% }else{ %>
				<button class="flex-item" type="submit" value="clock-out" >退勤</button>
				<% } %>
			</form>
		</div>

		<div class="buttonWrap2">
			<form action="BreakInServlet" class="form breakIn" method="POST">
				<input type="hidden" id="employeeCD" name="employeeCD" value="<%=employeeCD %>">
				<% if(clockIn == null || breakIn != null){ %> 
				<button class="flex-item" type="submit" value="break-in" disabled>休憩</button>
				<% }else{ %>
				<button class="flex-item" type="submit" value="break-in">休憩</button>
				<% } %>
			</form>

			<form action="BreakOutServlet" class="form breakOut" method="POST">
				<input type="hidden" id="employeeCD" name="employeeCD" value="<%=employeeCD %>">
				<% if(clockIn == null || breakIn == null){ %>
				<button class="flex-item" type="submit" value="break-out" disabled>復帰</button>
				<% }else{ %>
				<button class="flex-item" type="submit" value="break-out" >復帰</button>
				<% } %>
			</form>
		</div>
	</div>
</div>
<%-- <a href = "DispTimeRecordServlet?employeeCD=<%= employeeCD %>">勤怠状況</a>
<a href = "DispHolidayApplicationServlet">有給申請</a>
<a href = "DispEditPasswordServlet">パスワード変更</a>
<a href = "DispHolidayApprovalServlet">有給承認</a>
<a href = "EmployeeRegister.jsp">従業員登録</a>
<a href = "DispSelectEmployeeServlet">従業員選択</a> --%>
<script type="module" src="js/home.js" ></script>
</body>
</html>