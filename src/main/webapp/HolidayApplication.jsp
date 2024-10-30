<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.ApplicationBean" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.temporal.ChronoUnit" %>
<%@ page import="enums.ApprovalStatusEnum" %>
<%
String employeeCD = (String)session.getAttribute("employeeCD"); 
System.out.println("employeeCD:" + employeeCD);
String name = (String)request.getAttribute("name"); 
System.out.println("name:" + name);
int restDays = (int)request.getAttribute("restDays"); 
System.out.println("restDays:" + restDays);
String shift = (String)request.getAttribute("shift"); 
System.out.println("shift:" + shift);
ArrayList<ApplicationBean> applicationList = (ArrayList<ApplicationBean>)request.getAttribute("applicationList");
System.out.println("applicationList:" + applicationList);
ArrayList<ApplicationBean> applicationListOfApproved = (ArrayList<ApplicationBean>)request.getAttribute("applicationListOfApproved");
System.out.println("applicationListOfApproved:" + applicationListOfApproved);
int isAdmin = (int)session.getAttribute("isAdmin"); 
System.out.println("isAdmin:" + isAdmin);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>有給申請画面</title>
<link rel="stylesheet" href="css/tabMenu.css">
<link rel="stylesheet" href="css/checkboxSelected.css">
<link rel="stylesheet" href="css/holidayApplication.css">
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
	<ul class="tab-button">
		<li class="tab tab-01 is-active" value="0">有給休暇</li>
		<li class="tab tab-02" value="1">無給休暇</li>
		<li class="tab tab-03" value="2">申請履歴</li>
	</ul>


	<div>
		<input type="hidden" id="shiftData" value=<%= shift %> />
		<p>現在の有給取得日数: <%= restDays %>日</p>
	</div>
	<div class="tab-contents">
		<form action="HolidayApplicationConfirmServlet" method="post" id="HolidayForm">
			<div class="content tab-01 is-display">
				<label for="employeeCD">従業員コード</label>
				<input type="text" name="employeeCD" name="employeeCD" value="<%= employeeCD %>" readonly />

				<label for="name">氏名</label>
				<input type="text" id="name" name="name" value="<%= name %>" readonly />

				<label for="applicationDate1">日付</label>
				<div class="dateInput">
					<input type="date" id="applicationDate1" class="date" name="startDate" />～
					<input type="date" id="applicationDate2" class="date" name="endDate" />
				</div>

				<label for="reason">事由</label>
				<textarea id="reason" name="reason" placeholder="申請理由を入力してください。"></textarea>

				<label for="note">備考</label>
				<textarea id="note" name="note"></textarea>
				<div id="worningArea"></div>
				<input type="submit" class="btn" value="確認画面へ" />
			</div>

			<div class="content tab-02">
				<label for="employeeCD">従業員コード</label>
				<input type="text" name="employeeCD" name="employeeCD" value="<%= employeeCD %>" readonly />

				<label for="name2">氏名</label>
				<input type="text" id="name2" name="name" value="<%= name %>" readonly />

				<label for="applicationDate3">日付</label>
				<div class="dateInput">
					<input type="date" id="applicationDate3" class="date" name="startDate" />～
					<input type="date" id="applicationDate4" class="date" name="endDate" />
				</div>

				<label for="reason2">事由</label>
				<textarea id="reason2" name="reason" placeholder="申請理由を入力してください。"></textarea>

				<label for="note2">備考</label>
				<textarea id="note2" name="note"></textarea>
				<div id="worningArea2"></div>
				<input type="submit" class="btn" value="確認画面へ" />
			</div>

			<div class="content tab-03">
				<label class="checkboxArea"><input type="checkbox" id="approved" />承認済のみ表示</label>
				<div id="divAll" class="checkbox selected">
					<% if (!applicationList.isEmpty()) { %>
						<table>
							<tr>
								<th class="tr">申請日</th>
								<th class="tr">取得希望日</th>
								<th class="tr">事由</th>
								<th class="tr">備考</th>
								<th class="tr">申請状況</th>
							</tr>
							<%  for(ApplicationBean item : applicationList){ %>
							<% 
								Timestamp timestamp = new Timestamp(System.currentTimeMillis());
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								String formattedDate = sdf.format(item.getDate());
								System.out.println(item.getApprovalStatus());
								ApprovalStatusEnum approvalStatus = ApprovalStatusEnum.getById(item.getApprovalStatus());
								String approvalStatus2 = approvalStatus.getLabel();
							%>
								<tr>
									<td><%= formattedDate %></td>
									<td><%= item.getStartDate() %>(<%= item.getHolidayDays() %>日間)</td>
									<td><%= item.getReason() %></td>
									<td><%= item.getNote() %></td>
									<td><%= approvalStatus2 %></td>
								</tr>
							<% } %>
						</table>
					<% }else{ %>
						<p>現在までに提出した有給申請はありません。</p>
					<% } %>
				</div>

				<div id="divApproved" class="checkbox">
					<% if (!applicationListOfApproved.isEmpty()) { %>
						<table>
							<tr>
								<th class="tr">申請日</th>
								<th class="tr">取得希望日</th>
								<th class="tr">事由</th>
								<th class="tr">備考</th>
								<th class="tr">申請状況</th>
							</tr>
							<%  for(ApplicationBean item : applicationListOfApproved){ %>
							<% 
								Timestamp timestamp = new Timestamp(System.currentTimeMillis());
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								String formattedDate = sdf.format(item.getDate());
								System.out.println(item.getApprovalStatus());
								ApprovalStatusEnum approvalStatus = ApprovalStatusEnum.getById(item.getApprovalStatus());
								String approvalStatus2 = approvalStatus.getLabel();
							%>
								<tr>
									<td><%= formattedDate %></td>
									<td><%= item.getStartDate() %>(<%= item.getHolidayDays() %>日間)</td>
									<td><%= item.getReason() %></td>
									<td><%= item.getNote() %></td>
									<td><%= approvalStatus2 %></td>
								</tr>
							<% } %>
						</table>
					<% }else{ %>
						<p>現在までに提出した有給申請はありません。</p>
					<% } %>
				</div>

			</div>
		</form>
	</div>
</div>
<script type="module" src="js/tabMenu.js" ></script>
<script type="module" src="js/holidayApplication.js" ></script>
</body>
</html>