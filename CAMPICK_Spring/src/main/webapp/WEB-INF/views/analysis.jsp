<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,com.user.model.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     
    <%  UserDto loginUser = (UserDto)session.getAttribute("loginUser");%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="css/analysis.css">

</head>
<body>
    <div id="container">
        <header>
            <div id="logo">
                <a href="main.do">
                    <h1> CAMPICK</h1>
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
<!--                 <ul>
                    <li><a href="login.jsp">로그인</a></li>
                </ul> -->
            </div>


           <nav>
            <ul id="topMenu">
                <li><a href="search.jsp">캠핑장찾기</a></li>
                <li><a href="tagSearch.jsp">태그로 찾기</a></li>
                <li><a href="analysis.jsp">캠핑 예측Pick</a></li>
                <li><a href="boradList.do">커뮤니티</a></li>
            </ul>
            </nav>
    </header>

    <div class="headline">
        <h1><span class=text>빅데이터</span>로 알아보는 캠핑장 PICK</h1>
       <p><span class="highlight">지금 미리 예약해야할 캠핑장은?</span><p>
    </div>

<!--     <div id="topic">
        <div class="graph">
            <img src="image/trend.PNG">
        </div>
        <div class="description">
            <br>
            <h3>요즘 뜨는 캠핑 유형 트랜드는<br>
                 <span class=deco>#글램핑</span>입니다.</h3>
                 <br>
                    연도별 캠핑 유형별 언급량 증감률을 분석한 결과, '글램핑'의 증가율이 가장 높았고, 뒤이어 '차박', '캠핑카' 등이 뒤를 이었습니다. 캠핑 문화가 대중적으로 자리잡으면서 <b>장비와 짐에 대한 부담을 줄이고 가볍게 캠핑 감성을 즐길 수 있는 글램핑의 인기가 높아지는 것으로 분석</b>됐습니다. 단 글램핑의 경우 캠핑장별 제공되는 시설에 따라 즐길거리와 편의성에 영향이 크기 때문에 예약 전 꼼꼼하게 확인해야 합니다.

        </div>
        <button type="button" onclick = "location.href = 'searchResult.jsp'">캠핑장 추천 받기</button>
    </div> -->
    <hr>
    <div id="topic">
        <div class="graph">
            <img src="image/area.PNG">
        </div>
        <div class="description">
            <br>
            <h3>올해 가장 사람들에게 많이 언급된 지역은<br>
                <span class=deco>#포천</span>입니다.</h3>
                <br>
                2022년도 소셜미디어를 통한 지역별 언급량 분석 결과, <b>포천이 가장 높았고 2위 가평, 3위 연천 순</b>으로 나타났습니다. 포천의 언급량은 전체의 % 수준으로 높은 인기를 얻고 있는 만큼, 희망 캠핑장의 예약을 위해서는 빠른 예약 현황 확인이 필요합니다.

                </div>
                <button type="button" onclick = "location.href = 'searchResult.jsp'">캠핑장 추천 받기</button>
    </div>
    <hr>
    <div id="topic">
        <div class="graph">
            <img src="image/keyword.PNG">
        </div>
        <div class="description">
            <br>
            <h3>최근 주목받는 캠핑 키워드는<br>
                 <span class=deco>#불멍</span>입니다.</h3>
                 지난 기간 동안 소셜미디어 빅데이터 분석 결과 캠핑 연관어 중 '불멍'이 증가세를 보이고 있습니다. 
                
        </div>
        <button type="button" onclick = "location.href = 'searchResult.jsp'">캠핑장 추천 받기</button>
    </div>
    
    <footer>
        
    </footer>
            
</div> 
</body>
</html>