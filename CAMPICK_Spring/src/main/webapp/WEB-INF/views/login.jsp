<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CAMPICK</title>
    <link rel="stylesheet" href="/css/login.css">
  
</head>
<body>

    <div id="logo">
            <h1> <a href="main.do">CAMPICK</a></h1>
    </div>
    <form class="wrapper" id="loginForm" name="loginForm" method="post" action="login">
      <h1>환영합니다!</h1>
              <input id="userid" name="userid" type="text" placeholder="id 입력" required autofocus><br>
              <input id="password" name="password" type="password" placeholder="password 입력" required>

            <div id="loginInform">
                <ul>
                    <li><a href="registerform">회원가입</a></li>
                    <li><a href="searchId.jsp">ID 찾기</a></li>
                    <li><a href="searchPw.jsp">PW 찾기</a></li>
                </ul>
            </div>
            <button type="button" onclick="loginPro()"> LOGIN </button>
         <!--    <button type="submit"> LOGIN </button>  -->
          </form>
          
           
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript"> 
    $(document).keyup(function(e){
    	if(e.keyCode===13){
    		loginPro();
    	}
    });
    
    function loginPro(){
    	const id = $("#userid").val();
    	const pw = $("#password").val();
    	
    	if(!id){
    		alert("아이디를 입력해 주세요.");
    		return false;
    	}
    	if(!pw){
    		alert("비밀번호를 입력해 주세요");
    		return false;
    	}

    	//const id = document.getElementById("userid");
    	//const pw = document.getElementById("password");
    	if(!id){
    		//! => null 확인
    		alert("아이디를 입력해 주세요.");
    	}else if(!pw){
    		alert("비밀번호를 입력해 주세요.")
    	}else{
    		loginForm.method="post";
    		loginForm.action="login";
    		loginForm.submit();
    	}
    };
    
    </script>
</body>
</html>