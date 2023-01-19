<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,com.campick.user.model.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	UserDto loginUser = (UserDto)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CAMPICK</title>
    <link rel="stylesheet" href="/css/detailsearch.css">
    <link rel="stylesheet" href="/css/search.css">
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
            <c:choose>
            <c:when test="${loginUser==null}">
            <ul>
              <li><a href="/user/login">로그인</a></li>
              <li><a href="/user/registerform">회원가입</a></li>
            </ul>
            </c:when>
            <c:otherwise>
            <ul>
            <li><a href="/user/logout">로그아웃</a></li>
            <li><a href="/user/mypage">마이페이지</a></li>
            <li style="color:white;">${loginUser.name }님</li>
            </ul>
            </c:otherwise>
            </c:choose>
            
<!--                 <ul>
                    <li><a href="login.html">로그인</a></li>
                </ul> -->
                
            </div>
            
        <nav>
            <ul id="topMenu">
                <li><a href="search.jsp">캠핑장찾기</a></li>
                <li><a href="tagSearch.jsp">태그로 찾기</a></li>
                <li><a href="analysis.jsp">캠핑 예측Pick</a></li>
                <li><a href="board/list">커뮤니티</a></li>
            </ul>
        </nav>
        
    </header>
        <div id="contents">
            <h2>내게 맞는 캠핑장 검색하기</h2>
            <fieldset>
               <form id="campSearch" method="post" name="form1" action="campList.do">
                    <h2>어디로 떠날까요?</h2>
                    <p>
                        <label>캠핑장 이름</label>
                        <input id="campName" name="camp_name" type="search" autofocus>
                    </p>
                    <p>
                        <label>캠핑 지역</label>
							<input list="location_cdo" id="input_cdo" name="donm" placeholder="-- 시/도 -- "/>
                       		 <datalist id="location_cdo">
                           		  <option value="경기도">
                      		  </datalist>
						<input list="location_gungu" id="input_gungu" name="sigungu" placeholder="-- 군/구 -- "/>
                        <datalist id="location_gungu">
                           	  <option value="가평군">
                           	  <option value="고양시">
                           	  <option value="과천시">
                           	  <option value="광명시">
                           	  <option value="광주시">
                           	  <option value="구리시">
                           	  <option value="군포시">
                           	  <option value="김포시">
                           	  <option value="남양주시">
                           	  <option value="동두천시">
                           	  <option value="부천시">
                           	  <option value="성남시">
                           	  <option value="수원시">
                           	  <option value="시흥시">
                           	  <option value="안산시">
                           	  <option value="안성시">
                           	  <option value="안양시">
                           	  <option value="양주시">
                           	  <option value="양평군">
                           	  <option value="여주시">
                           	  <option value="연천군">
                           	  <option value="오산시">
                           	  <option value="용인시">
                           	  <option value="의왕시">
                           	  <option value="의정부시">
                           	  <option value="이천시">
                           	  <option value="파주시">
                           	  <option value="평택시">
                           	  <option value="포천시">
                           	  <option value="하남시">
                           	  <option value="화성시">
                        </datalist>
                    </p>
                    <p>
                        <label>캠핑 구분</label>
                        <input type="checkbox" id="site_01" name="camptype" value="일반야영장">일반야영장
                        <input type="checkbox" id="site_02" name="camptype" value="자동차야영장">자동차야영장
                        <input type="checkbox" id="site_03" name="camptype" value="카라반">카라반
                        <input type="checkbox" id="site_04" name="camptype" value="글램핑">글램핑
                    </p>
                    <button type="button" onclick="submit()"> 검색하기 </button> 
                </form>
                <button id="detailbutton" onclick="showPopup(true)">+</button>
            </fieldset>
        <div id="popup" class="hide">
            <div class="content">
                <form action="campList.do" method="post" id="popupform">
                    <h2>원하는 정보를 상세하게 입력해 보세요!</h2>
                    <ul>
                    	<h3>캠핑지역</h3>
						<li>
						  <input list="location_cdo" id="input_cdo" name="donm" placeholder="-- 시/도 -- "/>
                       	  <datalist id="location_cdo">
                            <option value="경기도">
                      	  </datalist>
                      	</li>
                      	<li>
                      	  <input list="location_gungu" id="input_gungu" name="sigungu" placeholder="-- 군/구 -- "/>
                        <datalist id="location_gungu">
                           	  <option value="가평군">
                           	  <option value="고양시">
                           	  <option value="과천시">
                           	  <option value="광명시">
                           	  <option value="광주시">
                           	  <option value="구리시">
                           	  <option value="군포시">
                           	  <option value="김포시">
                           	  <option value="남양주시">
                           	  <option value="동두천시">
                           	  <option value="부천시">
                           	  <option value="성남시">
                           	  <option value="수원시">
                           	  <option value="시흥시">
                           	  <option value="안산시">
                           	  <option value="안성시">
                           	  <option value="안양시">
                           	  <option value="양주시">
                           	  <option value="양평군">
                           	  <option value="여주시">
                           	  <option value="연천군">
                           	  <option value="오산시">
                           	  <option value="용인시">
                           	  <option value="의왕시">
                           	  <option value="의정부시">
                           	  <option value="이천시">
                           	  <option value="파주시">
                           	  <option value="평택시">
                           	  <option value="포천시">
                           	  <option value="하남시">
                           	  <option value="화성시">
                        </datalist>
                      	</li>
                    </ul>
                    <ul>
                    	<h3>캠핑구분</h3>
                    	<li><input type="checkbox" id="site_01" name="camptype" value="일반야영장">일반야영장</li>
                        <li><input type="checkbox" id="site_02" name="camptype" value="자동차야영장">자동차야영장</li>
                        <li><input type="checkbox" id="site_03" name="camptype" value="카라반">카라반</li>
                        <li><input type="checkbox" id="site_04" name="camptype" value="글램핑">글램핑</li>
                    </ul>
                    <ul>
                        <h3>입지구분</h3>
                        <li><input type="checkbox" value="해변" name="place">해변</li>
                        <li><input type="checkbox" value="섬" name="place">섬</li>
                        <li><input type="checkbox" value="산" name="place">산</li>
                        <li><input type="checkbox" value="숲" name="place">숲</li>
                        <li><input type="checkbox" value="계곡" name="place">계곡</li>
                        <li><input type="checkbox" value="강" name="place">강</li>
                        <li><input type="checkbox" value="호수" name="place">호수</li>
                        <li><input type="checkbox" value="도심" name="place">도심</li>
                    </ul>
                    <ul>
                        <h3>테마별</h3>
                        <li><input type="checkbox" value="일출명소" name="thema">일출명소</li>
                        <li><input type="checkbox" value="일몰명소" name="thema">일몰명소</li>
                        <li><input type="checkbox" value="수상레저" name="thema">수상레저</li>
                        <li><input type="checkbox" value="항공레저" name="thema">항공레저</li>
                        <li><input type="checkbox" value="스키" name="thema">스키</li>
                        <li><input type="checkbox" value="낚시" name="thema">낚시</li>
                        <li><input type="checkbox" value="액티비티" name="thema">액티비티</li>
                        <li><input type="checkbox" value="봄꽃여행" name="thema">봄꽃여행</li>
                        <li><input type="checkbox" value="여름물놀이" name="thema">여름물놀이</li>
                        <li><input type="checkbox" value="가을단풍명소" name="thema">가을단풍명소</li>
                        <li><input type="checkbox" value="겨울눈꽃명소" name="thema">겨울눈꽃명소</li>
                        <li><input type="checkbox" value="산책" name="thema">산책</li>
                    </ul>
                    <ul>
                        <h3>부대시설</h3>
                        <li><input type="checkbox" value="전기" name="subplace">전기</li>
                        <li><input type="checkbox" value="무선인터넷" name="subplace">Wi-Fi</li>
                        <li><input type="checkbox" value="장작판매" name="subplace">장작판매</li>
                        <li><input type="checkbox" value="온수" name="subplace">온수</li>
                        <li><input type="checkbox" value="트렘폴린" name="subplace">트렘폴린</li>
                        <li><input type="checkbox" value="물놀이장" name="subplace">물놀이장</li>
                        <li><input type="checkbox" value="놀이터" name="subplace">놀이터</li>
                        <li><input type="checkbox" value="산책로" name="subplace">산책로</li>
                        <li><input type="checkbox" value="운동장" name="subplace">운동장</li>
                        <li><input type="checkbox" value="운동시설" name="subplace">운동시설</li>
                        <li><input type="checkbox" value="마트.편의점" name="subplace">마트,편의점</li>
                    </ul>
                    <div id="buttons">
                        <input type="submit" value="검색하기">
                        <input type="reset" value="다시체크">
                    </div>
                </form>
                <button id="closebutton" onclick="closePopup()">닫기</button>
            </div>
        </div>
    </div>
    <footer>
        
    </footer>
    </div>
    <script>
        function showPopup(multipleFilter) {
	        const popup = document.querySelector('#popup');
  
                if (multipleFilter) {
  	                popup.classList.add('multiple-filter');
                } else {
  	                popup.classList.remove('multiple-filter');
                }
            popup.classList.remove('hide');
        }

        function closePopup() {
	        const popup = document.querySelector('#popup');
            popup.classList.add('hide');
        }
    </script>
</body>
</html>