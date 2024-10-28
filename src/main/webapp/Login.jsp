<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%@ page import="java.util.Date, java.text.DateFormat" %> --%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ログイン</title>
  <link rel="stylesheet" href="css/login.css" />
</head>
<body>
<div class="contents">
  <img src="img/login.jpg" alt="login" id="pic" class="login_pic" />
  <div class="main">
    <h2>ログイン</h2>
    <form action="LoginServlet" method="POST">
      <div class="employeeCD">
        <label for="employeeCD" class="employeeCDLabel">従業員コード</label>
        <input type="text" name="employeeCD" class="employeeCDBox pattern="\d*">
      </div>
      <div class="password">
        <label for="pass" class="passLabel">パスワード</label>
        <input type="password" id="pass" class="passBox" name="password" minlength="8" required />
      </div>
      <button type="submit" value="login" >ログイン</button>
      <p>
      <% if(request.getAttribute("message") != null){ %>
      <%= request.getAttribute("message") %>
      <% } %>
      </p>
    </form>
  </div>
</div>
</body>
</html>