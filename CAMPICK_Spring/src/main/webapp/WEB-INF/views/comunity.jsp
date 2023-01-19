<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.campick.user.model.*, com.campick.board.model.*" %>
   	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     
    <%
		UserDto loginUser = (UserDto)session.getAttribute("loginUser");
  		int count = (int)request.getAttribute("count");
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CAMPICK</title>
    <link rel="stylesheet" href="/css/comunity.css">
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
         	    <li><a href="myPage.jsp">마이페이지</a></li>
           		<li style="color:white;">${loginUser.name }님</li>
           	 </ul>
            </c:otherwise>
            </c:choose>
<!--                 <ul>
                    <li><a href="login.jsp">로그인</a></li>
                </ul> -->
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
        <div id="headline">
            <h2>커뮤니티</h2>
             <c:choose>
           	 <c:when test="${loginUser==null}">
           	 </c:when>	
           	 <c:otherwise>
        		<button type="button" onclick="writeBorad()"> 글쓰기 </button>
           	 </c:otherwise>
           	 </c:choose>
    </div><br><br><br>
            <ul id="gallery">
              <c:forEach items="${boardList }" var="boardList">
                <a href="detail?board_id=${boardList.board_id}">
                    <li>
                        <div class="photo">
                        	<c:set var="board_img" value="${boardList.board_img }"></c:set>
                        	<c:choose>
	                        	<c:when test="${board_img == null}">
	                        		<img src="/image/noimage.png">
	                        	</c:when>	
	                        	<c:otherwise>
		                        	<img src="/image/${boardList.board_img }">
	                        	</c:otherwise>
                        	</c:choose>
	                   	</div>
                        <div class="title">${boardList.board_name }</div>
                        <div class="writer">${boardList.name }</div>
                        <div class="date">${boardList.board_date }</div>
                    </li>
               </a>
              </c:forEach>
            </ul>
        </div>
        <div id=page_contorl>
        	<ul>
        	<%
        		if(count != 0){
        			String reqPage = request.getParameter("page");
        	    	if(reqPage == null){
        	    		reqPage = "1";
        	    	}
        			int pageSize = 9; // 페이지당 보여주는 게시글 갯수
        			int pageCount = count / pageSize + (count % pageSize == 0? 0:1); //페이지 갯수
        	    	int curPage = Integer.parseInt(reqPage); //현재 페이지
        	    	int pageBlock = 10; //페이지 보여주는 갯수 
        	    	
        	    	int startPage = ((curPage-1)/pageBlock)*pageBlock+1;
        	    	
        	    	int endPage = startPage + pageBlock-1;
        	    	if(endPage > pageCount){
        	    		endPage = pageCount;
        	    	}
        	    	if(curPage >1){
        	%>
        	    		<li><li class=page_li>
        	    			<a href="list?page=<%=curPage-1 %>">이전</a>
        	    		</li>
        	    		
        	<%		}
        			for(int i = startPage; i<=endPage; i++){ 
        				if(i == curPage){
        	%>
    					<li class=page_li><a href="list?page=<%=i%>"  id=curPage><%=i %></a></li>
    		<%			}else{ %>
        				<li class=page_li>
        					<a href=list?page=<%=i%>><%=i %></a>
        				</li>
        	<%			
        				}
        			}
        			if(curPage < pageCount){
        	%>
        				<li class=page_li>
        					<a href=list?page=<%=curPage +1 %>>다음</a>
        				</li>
        	<%
        			}
        		}
        	%>
        	</ul>
        </div>

    <footer>

    </footer>
    <script>
    function writeBorad(){
        document.location.href="write";
    }
</script>
</body>
</html>