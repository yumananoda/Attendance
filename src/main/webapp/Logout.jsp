<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
System.out.println("Logout");
// HttpSession session = request.getSession();

session.removeAttribute("employeeCD");
session.removeAttribute("name");
session.removeAttribute("storeCD");
session.removeAttribute("isAdmin");
session.removeAttribute("clockIn");
session.removeAttribute("clockOut");
session.removeAttribute("breakIn");
session.removeAttribute("breakOut");
session.removeAttribute("selectEmployee");
session.removeAttribute("selectRetireEmployees");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログアウト</title>
<link rel="stylesheet" href="css/editEmployee.css" />
</head>
<body>
<div class="contents">
	<p>正常にログアウト処理が完了しました。</p>
</div>
</body>
</html>