<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String employeeCD = (String)session.getAttribute("employeeCD"); 
System.out.println("employeeCD:" + employeeCD);
String name = (String)session.getAttribute("name"); 
System.out.println("name:" + name);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/sideMenu.css" />
</head>
<body>
<div class="sidebar">
    <ul class="sidebarUL">
        <li id="homeLi" class="list" value="0">
            <a href="Home.jsp">
            <span class="icon"><ion-icon name="hourglass-outline"></ion-icon></span>
            <span class="title">打刻</span>
            </a>
        </li>
        <li id="timeLi" class="list" value=1>
            <a href="DispTimeRecordServlet?employeeCD=<%= employeeCD %>">
            <span class="icon"><ion-icon name="calendar-number-outline"></ion-icon></span>
            <span class="title">勤怠状況</span>
            </a>
        </li>
        <li id="holidayAppLi" class="list" value="2">
            <a href="DispHolidayApplicationServlet">
            <span class="icon"><ion-icon name="document-text-outline"></ion-icon></span>
            <span class="title">有給申請</span>
            </a>
        </li>
        <li id="passLi" class="list" value="3">
            <a href="DispEditPasswordServlet">
            <span class="icon"><ion-icon name="key-outline"></ion-icon></span>
            <span class="title">パスワード変更</span>
            </a>
        </li>
        <li id="holidayApprovalLi" class="list" value="4">
            <a href="DispHolidayApprovalServlet">
            <span class="icon"><ion-icon name="checkbox-outline"></ion-icon></span>
            <span class="title">有給承認</span>
            </a>
        </li>
        <li id="empRegisterLi" class="list" value="5">
            <a href="EmployeeRegister.jsp">
            <span class="icon"><ion-icon name="person-add-outline"></ion-icon></span>
            <span class="title">従業員登録</span>
            </a>
        </li>
        <li id="empSelectLi" class="list" value="6">
            <a href="DispSelectEmployeeServlet">
            <span class="icon"><ion-icon name="people-outline"></ion-icon></span>
            <span class="title">従業員選択</span>
            </a>
        </li>
        <li id="LogoutLi" class="list" value="7">
            <a href="LogoutServlet">
            <span class="icon"><ion-icon name="log-out-outline"></ion-icon></span>
            <span class="title">ログアウト</span>
            </a>
        </li>
    </ul>

    <div class="profile">
        <ul class="profileUL">
            <li><%= employeeCD %></li>
            <li><%= name %></li>
        </ul>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>     
</body>
</html>