<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,com.user.model.*"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     
    <%  UserDto loginUser = (UserDto)session.getAttribute("loginUser");%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CAMPICK</title>
    <link rel="stylesheet" href="css/tagSearch.css">

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

    <div id="contents">

        <h2>어떤 캠핑장을 찾으시나요?<br><br>▼</h2>
        
        <form name="tag_search" method="post" action="tagSearch.do">
            <ul>
                <li><input type="checkbox" name="tag" value="반려" id="dog"><label for="dog" class="labelAfterCheckBox">#반려견동반</label></li>
                <li><input type="checkbox" name="tag" value="아이" id="kids"><label for="kids" class="labelAfterCheckBox">#아이들 놀기 좋은</label></li>
                <li><input type="checkbox" name="tag" value="맑은" id="cleanWater"><label for="cleanWater" class="labelAfterCheckBox">#물맑은</label></li>
                <li><input type="checkbox" name="tag" value="조용" id="silence"><label for="silence" class="labelAfterCheckBox">#조용한</label></li>
                <li><input type="checkbox" name="tag" value="가을" id="fall"><label for="fall" class="labelAfterCheckBox">#가을</label></li>
                <li><input type="checkbox" name="tag" value="산책" id="walk"><label for="walk" class="labelAfterCheckBox">#산책할 수 있는</label></li>
                <li><input type="checkbox" name="tag" value="체험" id="experience"><label for="experience" class="labelAfterCheckBox">#체험 가능한</label></li>
                <li><input type="checkbox" name="tag" value="계곡" id="valley"><label for="valley" class="labelAfterCheckBox">#계곡옆</label></li>
                <li><input type="checkbox" name="tag" value="봄" id="spring"><label for="spring" class="labelAfterCheckBox">#봄</label></li>
                <li><input type="checkbox" name="tag" value="가족" id="family"><label for="family" class="labelAfterCheckBox">#가족</label></li>
                <li><input type="checkbox" name="tag" value="커플" id="couple"><label for="couple" class="labelAfterCheckBox">#커플</label></li>
                <li><input type="checkbox" name="tag" value="수영장" id="swimmingPool"><label for="swimmingPool" class="labelAfterCheckBox">#수영장 있는</label></li>
                <li><input type="checkbox" name="tag" value="그늘" id="shade"><label for="shade" class="labelAfterCheckBox">#그늘이 많은</label></li>
                <li><input type="checkbox" name="tag" value="여름" id="summer"><label for="summer" class="labelAfterCheckBox">#여름</label></li>
                <li><input type="checkbox" name="tag" value="간격" id="largeSite"><label for="largeSite" class="labelAfterCheckBox">#사이트 간격 넓은</label></li>
                <li><input type="checkbox" name="tag" value="힐링" id="healing"><label for="healing" class="labelAfterCheckBox">#힐링</label></li>
                <li><input type="checkbox" name="tag" value="경관" id="goodView"><label for="goodView" class="labelAfterCheckBox">#경관이 멋진</label></li>
                <li><input type="checkbox" name="tag" value="물놀이" id="swim"><label for="swim" class="labelAfterCheckBox">#물놀이 하기 좋은</label></li>
                <li><input type="checkbox" name="tag" value="겨울" id="winter"><label for="winter" class="labelAfterCheckBox">#겨울</label></li>
                <li><input type="checkbox" name="tag" value="주차" id="parking"><label for="parking" class="labelAfterCheckBox">#주차가 편한</label></li>
                <li><input type="checkbox" name="tag" value="바다" id="OceanView"><label for="OceanView" class="labelAfterCheckBox">#바다 옆</label></li>
                <li><input type="checkbox" name="tag" value="깨끗" id="clean"><label for="clean" class="labelAfterCheckBox">#깨끗한</label></li>
                <li><input type="checkbox" name="tag" value="접근성" id="accessibility"><label for="accessibility" class="labelAfterCheckBox">#접근성 좋은</label></li>
            </ul>

      <button type="submit">검색하기</button>
        </form>


    </div>
    
    <footer>
    
    </footer>
    </div>
    <script>

    function getLabelText(event)  {
    	  const checkId = event.target.id; //체크된 id
    	  const query = 'label[for="'+ checkId + '"]' //그 아이디의 for값
    	  const text = 
    	        document.querySelector(query).innerText; //그 label의 text
    	  alert(text);

    //	  const text = 
    //	        document.querySelector(query).innerText;
    	  
    //	  document.getElementById('result').innerText = text;
    	} 
    
   function labelText(){
    if(document.getElementsByClassName('labelAfterCheckBox').checked==true){
    	alert(document.querySelector('labelAfterCheckBox').innerText);
    }
   //  const text = 
	   //     document.querySelector(label).innerText; 
  //   for(var i = 0; i < label.length; i++){
      //  alert(label[i].text());
    // }
   } 
    
    </script>    
</body>
</html>