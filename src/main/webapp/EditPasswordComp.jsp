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
<title>パスワード変更完了画面</title>
<link rel="stylesheet" href="css/editPassword.css">
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
	<p>パスワードの変更が完了しました。</p>
	<p>今後ログインする際には変更後のパスワードをご利用ください。</p>
</div>
</body>
</html>