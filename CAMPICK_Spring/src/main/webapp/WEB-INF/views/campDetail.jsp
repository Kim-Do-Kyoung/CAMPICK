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
    <h1>${scDto.camp_name }</h1>
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
              <div class="carousel-wrapper">
                <div class="carousel">
             	  <img src="${giDto.imgUrl1 }">
	              <img src="${giDto.imgUrl2 }">
	              <img src="${giDto.imgUrl3 }">
                </div>
                <button class="prev" type="button" id="prevButton">&lt;</button>
   			    <button class="next" type="button" id="nextButton">&gt;</button>
              </div>
                <table>
                    <tr>
                    	<th width="100px">소개글</th>
                    	<td id="intro">${scDto.intro }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>주소</th>
                        <td>${scDto.addr }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>번호</th>
                        <td>${scDto.tel }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>캠핑장 유형</th>
                        <td>${scDto.facility }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>캠핑장 환경</th>
                        <td>${scDto.place }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>테마</th>
                        <td>${scDto.thema }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>놀거리</th>
                        <td>${scDto.playPlace }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>계절</th>
                        <td>${scDto.season }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>가능한 날</th>
                        <td>${scDto.operdate }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>대여장비</th>
                        <td>${scDto.eqpmnlendcl }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>체험,프로그램</th>
                        <td>${scDto.exprnprogrm }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>홈페이지</th>
                        <td><a href="${scDto.homepage }">${scDto.homepage }</a></td>
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
</div>
</body>
	<script>
		const prevButton = document.querySelector('.prev');
		const nextButton = document.querySelector('.next');
		const carousel = document.querySelector('.carousel');
		
		let index = 0;
		
		prevButton.addEventListener('click', function () {
			   if (index === 2){
				   carousel.style.transform = 'translate(-840px,0)';
				   index -= 1;
			   }else if (index === 1){
				   carousel.style.transform = 'translate(0,0)';
				   index -=1;
			   }else if (index === 0){
				   return;
			   }
		});
		nextButton.addEventListener('click', function () {
			   if (index === 0){
				   carousel.style.transform = 'translate(-840px,0)';
				   index += 1;
			   }else if (index === 1){
				   carousel.style.transform = 'translate(-1680px,0)';
				   index +=1;
			   }else if (index === 2){
				   return;
			   }
		});
	</script>

</html>