<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
System.out.println("Logout");
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
<meta http-equiv="refresh" content="3;url=http://localhost:8080/DateTime/Login.jsp">
</head>
<title>ログアウト</title>
<style>
    *{
        margin: 0;
        padding: 0;
    }
    .contents {
        background-color: #f7ffff;
        width: 100vw;
        height: 100vh;
        padding: 20px;
    }
</style>
</head>
<body>
<div class="contents">
	<p>正常にログアウト処理が完了しました。</p>
    <p>3秒後にログイン画面に自動で移動します。</p>
    <a href="Login.jsp">ログイン画面へ</a>
</div>
</body>
</html>