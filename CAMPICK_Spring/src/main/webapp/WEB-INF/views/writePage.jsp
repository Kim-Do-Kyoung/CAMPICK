<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.borad.model.* ,com.user.model.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%UserDto loginUser = (UserDto)session.getAttribute("loginUser"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CAMPICK</title>
    <link rel="stylesheet" href="css/writepage.css">
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
    	<div class="headline">
		    <h1>커뮤니티 글쓰기</h1>
		    <h2>나의 캠핑 후기 공유하기!</h2>
  		</div>
    <div class="tab">
        <div class="main" style="text-align:center">
	        <form id="form2" method="post" action="boradInsert.do" enctype="multipart/form-data">
	            <ul>
		        	<li><dt>제목<span class="font05"> *</span></dt><dd><input type="text" style="width:100%;" name="borad_name" required></input></dd></li>
                  	<li>
                          <dt>캠핑장 이름</dt>
                          <dd>
                              <input type="text" style="width:100%;" name="camp_name" required>
                          </dd>
                 	 </li>
             		 <li>
                         <dt>여행일자</dt>
                         <dd>
                             <input type="date" style="width:130px;" name="borad_period_first" required>
                             &nbsp;~&nbsp;
                             <input type="date" style="width:130px;" name="borad_period_second" required>
                         </dd>
                        </li>
                     <li class="textarea" style="height:180px;">
                         <dt>내용<span class="font05"> *</span></dt>
                         <dd>
    	                        <p><textarea style="width:100%; height:180px" name="borad_text" required></textarea></p>
    	                       
                         </dd>
                     </li>
                     <li>
                         <dt>첨부파일</dt>
                         <dd>
                             <div class="filebox">
                                 <input class="upload-name" id="fileName" readonly>
                                 <label for="filename">업로드</label> 
                                 <input type="file" id="filename" class="upload-hidden" name="borad_img" accept=".gif, .jpg, .png" onchange="javascript:document.getElementById('fileName').value = this.value"> 
                             </div>
                         </dd>
                     </li>
                 </ul>
                 <button onclick="submitWriter()"> 제출하기 </button> 
             </form>
         </div>
     </div>
</div>
    </div>
<footer>

</footer>
<script>

    function submitWriter(){
    }
</script>
</body>
</html>

