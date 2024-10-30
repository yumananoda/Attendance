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
  <div class="back"></div>
    <div class="main">
      <h2>LOGIN</h2>
      <form action="LoginServlet" method="POST">
        <div class="inputArea">
          <%-- <label for="employeeCD" class="employeeCDLabel">従業員コード</label> --%>
          <span class="employeeCD_icon"><ion-icon name="person-outline"></ion-icon></span>
          <input type="text" id="employeeCD" class="employeeCDBox" name="employeeCD" placeholder="EMPLOYEECD" pattern="\d*">
          <%-- <label for="pass" class="passLabel">パスワード</label> --%>
          <span class="pass_icon"><ion-icon name="bag-outline"></ion-icon></span>
          <input type="password" id="pass" class="passBox" name="password" placeholder="PASSWORD" minlength="8" required />
          <button type="submit" value="login" >Login</button>
        </div>
        <p>
        <% if(request.getAttribute("message") != null){ %>
        <%= request.getAttribute("message") %>
        <% } %>
        </p>
      </form>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script> 
</body>
</html>