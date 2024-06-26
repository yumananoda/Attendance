<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime" %>
<%
String employeeCD = (String)session.getAttribute("employeeCD"); 
LocalDateTime clockIn = (LocalDateTime)session.getAttribute("clockIn"); 
System.out.println(clockIn);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>打刻</title>
</head>
<body>
<!--時刻表示-->    
 <p id="realtime"></p>
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
	  let nowHour = twoDigit( nowTime.getHours() );
	  let nowMin  = twoDigit( nowTime.getMinutes() );
	  let nowSec  = twoDigit( nowTime.getSeconds() );
	  let msg = nowHour + ":" + nowMin + ":" + nowSec;
	  document.getElementById("realtime").innerHTML = msg;
	}
	setInterval('showClock()',1000);
</script>

<form action="ClockInServlet" method="POST">
	<input type="hidden" id="employeeCD" name="employeeCD" value="<%=employeeCD %>">
		<% if(clockIn != null){ %>
    <button disabled class="styled" type="submit" value="clock-in" >出勤</button>
    <% }else{ %>
    <button  class="styled" type="submit" value="clock-in" >出勤</button>
    <% } %>
</form>

<form action="ClockOutServlet" method="POST">
	<input type="hidden" id="employeeCD" name="employeeCD" value="<%=employeeCD %>">
	<% if(clockIn == null){%>
    <button disabled class="styled" type="submit" value="clock-out" >退勤</button>
    <% }else{ %>
    <button  class="styled" type="submit" value="clock-out" >退勤</button>
    <% } %>
 </form>

 <a href = "AttendanceStatusServlet">勤怠状況</a>
 
</body>
</html>