<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%  %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CAMPICK</title>

    <link rel="stylesheet" href="/css/register.css">
 
</head>
<body>
    <div id="container">
        <header>
            <div id="logo">
                <a href="/">
                    <h1>CAMPICK</h1>
                </a>
            </div>
            <div id="inform">
                <ul>
                    <li><a href="/user/login">로그인</a></li>
                </ul>
            </div>    
        	<nav>
           		<ul id="topMenu">
	                <li><a href="/">캠핑장찾기</a></li>
	                <li><a href="/tag/search">태그로 찾기</a></li>
	                <li><a href="/pcik/list">캠핑 예측Pick</a></li>
	                <li><a href="/board/list">커뮤니티</a></li>
				</ul>
      	  	</nav>
    	</header>

    <form name="joinForm">
        <div id="registerForm">
        <h1>회원 가입</h1>
        
        <fieldset>
            <table>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" id = "user_id" name="id" required placeholder="2글자 이상 12글자 이하" autofocus onchange="idCheck()"></td>
                </tr>
                <tr>
                	<td></td>
              		<td height="10px"><p id ="idCheckMsg"></p></td>
                </tr>

                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" id ="user_pw" name="pw" required placeholder="비밀번호 8~12자리 특수기호 포함" onkeyup="pwCheck()"></td>
                </tr>
              	<tr>
                	<td></td>
              		<td><p id="pwMsg"></p></td>
                </tr>
 

                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" id = "user_pw2" name="pw2" required onkeyup="pw_duplicate()"></td>
               		<td><p id="checkMsg"></p></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name" required></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td><input type="text" name="addr" required></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="email" name="email" required></td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td><input type="tel" name="phone" required></td>
                </tr>
            </table>
        </fieldset>
        </div>

  <div id = "submit">
 	 <!-- 	<button type="submit">가입하기</button>  -->
     	<button type="button" onclick="register()">가입하기</button>
        <button type="reset" value="다시 작성">다시작성</button>
  </div>
    </form>
    </div>

    <footer>
    </footer>
    
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script> 
var idCheckResult=false;

function idCheck() {
	const id =  $('#user_id').val();
	const idCheckMsg = document.getElementById("idCheckMsg");
	const idPattern = /^[A-Za-z0-9]{4,12}$/;
	if(idPattern.test(id)){
	 $.ajax({
		 url:"/user/idCheck",
		 method:"GET",
		 dataType:"text",
		 data:{
			 user_id:id
		 },
		 success:
		function(data){
			 if(data=="ok"){
				idCheckMsg.style.color = "#134f2c";
				idCheckMsg.innerText = "사용 가능한 id입니다.";
				idCheckResult=true;
				alert(idCheckResult);
			}
			if(data=="fail"){
				idCheckMsg.style.color = "#D1433A";
				idCheckMsg.innerText = "이미 사용중인 ID입니다.";
				idCheckResult=false;
				alert(idCheckResult);
			}
 		 },
		 error:
			 function(){
			 alert('에러남');
		 }
	 });
	}else{
		idCheckMsg.style.color = "#D1433A";
		idCheckMsg.innerText = "4~12자 이내의 대/소문자와 숫자";
		idCheckResult=false;
		alert(idCheckResult);
	}
}


function pw_duplicate(){
	
	const pw1 = document.getElementById("user_pw");
	const pw2 = document.getElementById("user_pw2");
	const checkMsg = document.getElementById("checkMsg");
	if(pw1.value==pw2.value){
		checkMsg.style.color = "#134f2c";
		checkMsg.innerText = "OK!";
        return true;
	} else{
		checkMsg.style.color = "#D1433A";
		checkMsg.innerText = "X";   
	}
}

function pwCheck(){
   const password =  document.getElementById("user_pw");
   const pwMsg = document.getElementById("pwMsg");
   const pattern = /^.*(?=^.{8,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; // 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식 ( 3 가지 조합)
     
     if(pattern.test(password.value)){
        pwMsg.style.color = "#134f2c";
        pwMsg.innerText = "사용 가능한 비밀번호입니다.";
         return true;
     }
     else{
        pwMsg.style.color = "#D1433A";
        pwMsg.innerText = "8~12자리의 특수문자/영문자/숫자 포함";   
         
   }
}

function register(){
	if(idCheckResult==true){
		joinForm.method="post";
		joinForm.action="/user/register";
		joinForm.submit();
	}else{
		alert("id를 다시 확인해 주세요.");
	}
}

   
</script>
</body>
</html>