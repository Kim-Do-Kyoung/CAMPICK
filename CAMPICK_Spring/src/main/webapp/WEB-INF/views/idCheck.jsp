<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
   <script src="/js/registerCheck.js"></script>
</head>
<body>

<form method ="post" action="user.do?action=checkID">
아이디 <input type = "text" name ="user_id" onclick="getParentText()">
<input type="submit" value = "중복 체크하기">
</form>

</body>
</html>