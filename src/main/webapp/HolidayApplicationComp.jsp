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
<meta http-equiv="refresh" content="3;url=DispClockServlet">
<link rel="stylesheet" href="css/holidayApplication.css">
<title>有給申請完了画面</title>
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
	<p>有給の申請が完了しました。</p>
	<p>3秒後に打刻画面に自動で移動します。</p>
    <a href="DispClockServlet">打刻画面へ</a>
</div>
<script type="module" src="js/holidayApplicationConf.js" ></script>
</body>
</html>