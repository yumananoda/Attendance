<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>従業員登録</title>
</head>
<body>
    <h2>従業員登録</h2>
    <form id="employeeForm">
        <div class="input-group">
            <label for="employeeName">名前:</label> <!-- forでinputで紐づけ -->
            <input type="text" name="name" id="employeeName" required><br>
        </div>
        <div class="input-group">
            <label for="email">メールアドレス:</label>
            <input type="email" name="email" id="email" required>
        </div>

        <div class="radio-group">
            <div>
                <input type="radio" id="fullTime" name="position" value=1 checked />
                <label for="fullTime">正社員</label>
            </div>
            <div>
                <input type="radio" id="part" name="position" value=2 />
                <label for="part">アルバイト</label>
            </div>
        </div>
        <button type="submit" id="addemployee">追加</button>
    </form>
    <button type="submit" id="register">登録</button>
    <div id="registerUser"></div>
    <script src="js/employeeRegister.js" ></script>
</body>
</html>