<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String employeeCD = (String)request.getAttribute("employeeCD");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/shiftRegister.css">
<title>シフト登録 </title>
</head>
<body>
	<input id="employeeCD" type="hidden" value=<%= employeeCD %> />
	<div id="selectWeek"></div>
	<div id="inputTimeGroup"></div>
	
	<script type="module" src="js/const.js" ></script>
	<script type="module" src="js/shiftRegister.js" ></script>
</body>
</html>