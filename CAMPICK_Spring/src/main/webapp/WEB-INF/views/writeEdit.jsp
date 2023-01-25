<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.campick.user.model.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	UserDto loginUser = (UserDto)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CAMPICK</title>
    <link rel="stylesheet" href="/css/writepage.css">
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
       		  		 </ul>
      		    </c:when>
         		<c:otherwise>
          			<ul>
         				<li><a href="/user/logout">로그아웃</a></li>
      	    			<li><a href="/mypage/zzimlist?id=${loginUser.id}">마이페이지</a></li>
        					<li style="color:white;">${loginUser.name}님</li>
        		 		</ul>
         		</c:otherwise>
           	</c:choose>
        </div>


    <nav>
        <ul id="topMenu">
            <li><a href="/">캠핑장찾기</a></li>
            <li><a href="/tag/search">태그로 찾기</a></li>
            <li><a href="/pick/list">캠핑 예측Pick</a></li>
            <li><a href="list">커뮤니티</a></li>
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
	        <form id="form2" method="post" action="update" enctype="multipart/form-data">
	          <input type="hidden" name="board_id" value="${bDto.board_id }">
	            <ul>
		        	<li><dt>제목<span class="font05"> *</span></dt><dd><input type="text" style="width:100%;" name="board_name" value="${bDto.board_name }" required></input></dd></li>
                  	<li>
                        <dt>캠핑장 이름</dt>
                        <dd>
                            <input type="text" style="width:100%;" name="camp_name" value="${bDto.camp_name }" required>
                          </dd>
                 	 </li>
             		 <li>
                         <dt>여행일자</dt>
                         <dd>
                             <input type="date" style="width:130px;" name="board_period_first" value="${bDto.board_period_first }" required>
                             &nbsp;~&nbsp;
                             <input type="date" style="width:130px;" name="board_period_second" value="${bDto.board_period_second }" required>
                         </dd>
                        </li>
                     <li class="textarea" style="height:180px;">
                         <dt>내용<span class="font05"> *</span></dt>
                         <dd>
    	                        <p><textarea style="width:100%; height:180px" name="board_text" required>${bDto.board_text }</textarea></p>
    	                       
                         </dd>
                     </li>
                     <li>
                         <dt>첨부파일</dt>
                         <dd>
                             <div class="filebox">
                                 <input class="upload-name" id="fileName" readonly>
                                 <label for="filename">업로드</label> 
                                 <input type="file" id="filename" class="upload-hidden" name="uploadFile" accept=".gif, .jpg, .png" onchange="javascript:document.getElementById('fileName').value = this.value"> 
                             </div>
                         </dd>
                     </li>
                 </ul>
                 <button onclick="submitWriter()"> 수정하기 </button> 
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

