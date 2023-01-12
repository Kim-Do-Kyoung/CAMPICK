<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CAMPICK</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>

    <div id="logo">
            <h1> <a href="main.do">CAMPICK</a></h1>
    </div>
    <form class="wrapper" method="post" action="userLogin.do">
      <h1>환영합니다!</h1>
              <input id="userid" name="userid" type="text" placeholder="id 입력" required autofocus><br>
              <input id="password" name="password" type="password" placeholder="password 입력" required>

            <div id="loginInform">
                <ul>
                    <li><a href="regist.jsp">회원가입</a></li>
                    <li><a href="searchId.jsp">ID 찾기</a></li>
                    <li><a href="searchPw.jsp">PW 찾기</a></li>
                </ul>
            </div>
            <button type="submit"> LOGIN </button> 
          </form>
</body>
</html>