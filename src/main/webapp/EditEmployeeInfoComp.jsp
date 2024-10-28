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
<title>従業員情報変更完了画面</title>
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
    <p>従業員情報の変更が完了しました。</p>
</div>
</body>
</html>