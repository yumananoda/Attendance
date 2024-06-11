<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.TimeRecordsBean" %>
    <%
    String timeRecords = (String)session.getAttribute("timeRecords");
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/sample.css" />
</head>
<body>
    <h1>sample</h1>
    <div class="calendar-title">
      <span class="btn-monthMove prev">＜</span>
      <span id="year">2018</span>/
      <span id="month">11</span>
      <span class="btn-monthMove next">＞</span>
    </div>
    
    <div id="calendar"></div>
    <input id="dataHolder" type="hidden" value=<%= timeRecords %> > 
    <script src="js/calendar.js"></script>
</body>
</html>