<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.borad.model.*, com.comment.model.*, java.util.* ,com.user.model.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	BoardDao dao = BoardDao.getInstance();
	BoardDto dto = dao.getDB((int)session.getAttribute("boradid"));
	UserDto loginUser = (UserDto)session.getAttribute("loginUser");
%>
<jsp:useBean id="commentList" scope="request" class="java.util.ArrayList"></jsp:useBean>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CAMPICK</title>
    <link rel="stylesheet" href="/css/writedetail.css">
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

    <div id="content">
        <div id="writeinfo">
            <table id="table1">
                <tr>
                    <td class="title">글번호</td>
                    <td><%=dto.getBorad_id() %></td>
                    <td class="title">조회수</td>
                    <td><%=dto.getBorad_visit() %></td>
                    <td class="title">추천수</td>
                    <td><%=dto.getBorad_suggestion() %></td>
                    <td class="title">글작성일</td>
                    <td><%=dto.getBorad_date() %></td>
                </tr>
            </table>
            <table id="table2">
                <tr>
                    <td class="title">캠핑장</td>
                    <td><%=dto.getCamp_name() %></td>
                    <td class="title">기간</td>
                    <td><%=dto.getBorad_period_first() %> ~ <%=dto.getBorad_period_second() %></td>

                </tr>
                <tr>
                    <td class="title">글제목</td>
                    <td colspan="3"><%=dto.getBorad_name() %></td>
                </tr>
            </table>
            <span id="writer">작성자 <%=dto.getName() %></span>
        </div>
        <hr style="border: solid 2px #eee;" width="90%">
        <div id="writecontents">
        	<c:set var="borad_img" value="<%=dto.getBorad_img() %>"></c:set>
            <c:if test="${borad_img != null}">
	            <img src="image/<%=dto.getBorad_img()%>" alt="이미지" width="500px" height="350px">
            </c:if>
            <p>
             	<%=dto.getBorad_text() %>
            </p>
            <c:choose>
            	<c:when test="${loginUser != null }">
            	<%if(loginUser.getName().equals(dto.getName())){ %>
		            <button onclick="w_edit()" id="w_edit">수정</button>
		            <button onclick="w_remove()" id="w_remove">삭제</button>
	            	<button onclick="goList()" id="goList">목록</button>
    	        	<button onclick="w_like()" id="w_good">추천</button>
	            <%}else{ %>
    	        	<button onclick="w_good()" id="w_good">추천</button>
		           	<button onclick="goList()" id="goList">목록</button>
	            <%} %>
            	</c:when>
            </c:choose>
           	<button onclick="goList()" id="goList">목록</button>
        </div>
        <hr style="border: solid 2px #eee;" width="90%">
        <div id="datgle">
        	<c:forEach var="comment" items="${commentList }" varStatus="status">
		        <c:if test="${comment.depth == 0}">
	        	<table>
	        		<tr>
	        			<td rowspan="2" align="center" width = "70px" style="border-right: 1px solid #eee ">${comment.name }</td>
	        			<td colspan="4" class="ganguk" style="border-bottom: 1px solid #eee">${comment.reply }</td>
	        		</tr>
	        		<tr class="tablefont">
	        			<td height="10px" class="ganguk">${comment.reply_time }</td>
	        			<c:choose>
            			<c:when test="${loginUser != null }">
			        			<td width=35px><button class="reComment" onclick="togleReComment(${status.index})">답글</button></td>
	        			</c:when>
	        			</c:choose>
	        		</tr>
	        	</table>
		        </c:if>
	        	<c:if test ="${comment.depth == 1 }"> <%--recomment.bundle_id == comment.bundle_id --%>
        			<table>
		        		<tr>
		        			<td width=70px rowspan="2"><img src="image/recomment.png" width=100% height=100%></td>
		        			<td rowspan="2" align="center" width = "70px" style="border-right: 1px solid #eee ">${comment.name }</td>
		        			<td colspan="4" class="ganguk" style="border-bottom: 1px solid #eee">${comment.reply }</td>
		        		</tr>
		        		<tr class="tablefont">
		        			<td height="10px" class="ganguk">${comment.reply_time }</td>
		        		</tr>
		        	</table>
	        	</c:if>
<!-- 	        	대댓글 입력하는 곳 -->
		        <div class="insertReComment">
		        	<form action = "boradRecomment.do?bundle_id=${comment.bundle_id }" name=form4 method=post>
		        		<c:choose>
		        			<c:when test="${loginUser != null }">
			        			<table>
				        			<tr>
				        				<td width=70px><img src="image/recomment.png" width=100% height=100%></td>
					        			<td width = "70px"><%=loginUser.getName() %></td>
				        				<td><textarea rows="3" placeholder="댓글을 입력해주세요" name="reply" required></textarea></td>
				        				<td width=30px><button>등록</button></td>
				        			</tr>
				        		</table>
		        			</c:when>
		        		</c:choose>
		        	</form>
		        </div>
        	</c:forEach>
       </div>
<!--    댓글 등록구역	 -->
        <div id="insertComment">
        	<form action="boradComment.do" name=form3 method=post>
        	<c:choose>
            	<c:when test="${loginUser != null }">
	        	<table>
        			<tr>
	        			<td width = "70px"><%=loginUser.getName() %></td>
        				<td><textarea rows="3" placeholder="댓글을 입력해주세요" name="reply" required></textarea></td>
        				<td width=30px><button>등록</button></td>
        			</tr>
        		</table>
        		</c:when>
        	</c:choose>
        	</form>
        </div>
    </div>

</div>
    <script>
        function goList(){
            document.location.href="boradList.do";
        }
        function w_remove(){
            var check = confirm("삭제 하시겠습니까?");
            if(check === true){
                alert('삭제 되었습니다.');
                document.location.href="boradDelete.do";
            }
        }
        function w_edit(){
        	document.location.href="boradEdit.do";
        }
        function togleReComment(index){
        	var select = document.querySelectorAll('.insertReComment');
       		select[index].style.display = 'block';
        }
        function w_like(){
        	document.location = "boradSuggest.do";
        }
    </script>
</body>
</html>