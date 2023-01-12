<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,com.borad.model.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <%   String searchUser = (String)request.getAttribute("searchUser"); %>
    
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
		<div id="contents">
    		<form id="form" method = "post" action="userSearchID.do">
       		 <h2>ID찾기</h2>
       		  <c:choose>
        		<c:when test="${searchUser==null}">
        		<table>
           			<tr>
                		<td>이름</td>
                		<td><input type="text" name="s_name" required autofocus></td>
            		</tr>
            		<tr>
                		<td>핸드폰 번호</td>
                		<td><input type="tel" name="s_tel" required></td>
            		</tr>
            	</table>
        		<input type="submit" value="아이디 찾기">
            	</c:when>
            	<c:otherwise>
            	<ul>
            	<li>당신의 ID는</li>
            	<li><b><font color=green><%=searchUser %></font></b>입니다.</li>
            	</ul>
            	
            	<button type="button" onclick = "location.href = 'login.jsp'">로그인 하러가기</button>
            	
            	</c:otherwise>
        	  </c:choose>
    		</form>
		</div>
	</div>
	<footer>
	    
	</footer>
	
	
	</script>
</body>
</html>