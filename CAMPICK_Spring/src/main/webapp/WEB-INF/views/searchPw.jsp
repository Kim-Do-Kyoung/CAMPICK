<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%   String searchPw = (String)request.getAttribute("searchPw"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CAMPICK</title>
    <link rel="stylesheet" href="css/searchid.css">
</head>
<body>
    <div id="container">
    <div id="logo">
        <h1> <a href="main.do">CAMPICK</a></h1>
    </div>
<div id="contents">>
    <form id="form" method="post" action="userSearchPW.do">
        <h2>비밀번호 찾기</h2>
        
        <c:choose>
        
        <c:when test = "${searchPw==null}">
        <table>
            <tr>
                <td>ID</td>
                <td><input type="text" name="s_id" required autofocus></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="tel" name="s_email" required></td>
            </tr>
            <tr>
                <td>핸드폰 번호</td>
                <td><input type="tel" name="s_tel" required></td>
            </tr>
        </table>
        <input type="submit" value="비밀번호 찾기">
        </c:when>
        
        <c:otherwise>
        <ul>
          <li>당신의 PW는</li>
          <li><b><font color=green><%=searchPw %></font></b>입니다.</li>
        </ul>
            	
        <button type="button" onclick = "location.href = 'login.jsp'">로그인 하러가기</button>
        </c:otherwise>
        
        </c:choose>
        
    </form>
</div>
</div>
<footer>
    
</footer>
</body>
</html>