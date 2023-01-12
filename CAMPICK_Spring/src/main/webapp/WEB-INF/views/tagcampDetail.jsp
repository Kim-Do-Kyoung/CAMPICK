<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,com.user.model.*"%>
   	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     
    <%  UserDto loginUser = (UserDto)session.getAttribute("loginUser");%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CAMPICK</title>
    <link rel="stylesheet" href="css/campDetail.css">
</head> 
<body>
    <div id="container">
    <header>
        <div id="logo">
            <a href="main.do">
                <h1>CAMPICK</h1>
            </a>
        </div>
        <div id="inform">
           <c:choose>
           	 <c:when test="${loginUser==null}">
           	 <ul>
              	<li><a href="login.jsp">로그인</a></li>
           	 </ul>
            </c:when>
           <c:otherwise>
             <ul>
            	<li><a href="userLogout.do">로그아웃</a></li>
         	    <li><a href="myPage.jsp">마이페이지</a></li>
           		<li style="color:white;"><%=loginUser.getName() %>님</li>
           	 </ul>
           </c:otherwise>
           </c:choose>
<!--             <ul>
                <li><a href="login.jsp">로그인</a></li>
            </ul> -->
        </div>
    </header>

    <nav>
        <ul id="topMenu">
            <li><a href="search.jsp">캠핑장찾기</a></li>
            <li><a href="tagSearch.jsp">태그로 찾기</a></li>
            <li><a href="analysis.jsp">캠핑 예측Pick</a></li>
            <li><a href="boradList.do">커뮤니티</a></li>
            </ul>
    </nav>
    <div id="contents">
    <div class="headline">
    <h1>${campDetail.camp_name }</h1>
    <h2>캠핑장 정보 자세히보기</h2>
    </div>
    <div class="tab">
        <div class="main" style="text-align:center">
 
            <input id="tab1" type="radio" name="tabs" checked> 
            <label for="tab1">시설정보</label>
         
            <input id="tab2" type="radio" name="tabs">
            <label for="tab2">위치정보</label>
            <input id="tab3" type="radio" name="tabs">
            <label for="tab3">날씨정보</label>
         
            <section id="content1" style="margin-bottom:20px;">
            	<img src="${giDto.imgUrl1 }">
                <table>
                    <tr>
                    	<th width="100px">소개글</th>
                    	<td id="intro">${campDetail.intro }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>주소</th>
                        <td>${campDetail.addr}</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>번호</th>
                        <td>${campDetail.tel}</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>캠핑장 환경</th>
                        <td>${campDetail.place }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>테마</th>
                        <td>${campDetail.thema }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>놀거리</th>
                        <td>${campDetail.playplace }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>계절</th>
                        <td>${campDetail.season }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>가능한 날</th>
                        <td>${campDetail.operdate }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>대여장비</th>
                        <td>${campDetail.eqpmnLendCl }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>체험,프로그램</th>
                        <td>${campDetail.exprnProgrm }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>홈페이지</th>
                        <td><a href="${campDetail.homepage }">${campDetail.homepage }</a></td>
                    </tr>
                </table>
            </section>
            <section id="content2" style="margin-bottom:20px;">
                <img src="image/map.PNG">
            </section>
            <section id="content3" style="margin-bottom:20px;">
                날씨정보
            </section>
    </div>
</div>
</div>

<footer>

</footer>
</body>
</html>