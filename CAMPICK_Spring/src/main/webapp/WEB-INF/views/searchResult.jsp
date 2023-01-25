<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,com.campick.user.model.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
     
    <%
    UserDto loginUser = (UserDto)session.getAttribute("loginUser");
 	int count = (int)session.getAttribute("count");
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CAMPICK</title>
    <link rel="stylesheet" href="/css/searchResult.css">
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
            <li><a href="userLogout.do">로그아웃</a></li>
            <li><a href="/mypage/zzimlist?id=${loginUser.id}">마이페이지</a></li>
            <li style="color:white;">${loginUser.name }님</li>
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
            <li><a href="/">캠핑장찾기</a></li>
            <li><a href="/tag/search">태그로 찾기</a></li>
            <li><a href="/pick/list">캠핑 예측Pick</a></li>
            <li><a href="/board/list">커뮤니티</a></li>
        </ul>
    </nav>

    <div id="resultCount">
        <p>총  <%=count %>개의 결과가 검색되었습니다.</p>
        <hr>
    </div>

    <div id="contents">
      <c:forEach var="scDto" items="${scDtoList }" varStatus="status">
      <div class="card">
      	<c:set var="check" value="1"></c:set>
      	<c:forEach var="giDto" items="${giDtoList }" varStatus="gi_status">
		    <c:if test="${scDto.camp_id == giDto.camp_id}">
	          <img src="${giDto.imgUrl1}" alt="캠핑장 사이트 사진" width=340px height=330px>
              <c:set var="check" value="0"></c:set>
		    </c:if>
        </c:forEach>
        <c:if test="${check ==1 }">
	      <img src="/image/noimage.png" alt="캠핑장 사이트 사진" width=340px height=330px>
	    </c:if>
        <div class="campinfo">
          <div class="campinfo_head">
            <a href="detail?camp_id=${scDto.camp_id}&addr=${scDto.addr}">${scDto.camp_name }<span id=campFont>(${scDto.facility})</span></a>
              <div class="wishlist">
              <c:choose>
                 <c:when test="${loginUser==null}">
        		 </c:when>
         		 <c:otherwise>
<%--          		 <form name="zzim">
         		 <input type="hidden" name="camp_id" value="${scDto.camp_id}">
         		 <button type=button onclick="javascript:zzim();">찜하기</button>
         		 </form> --%>
            	 <a href="javascript:zzim(${scDto.camp_id});"><img src="/image/wishlist.png" id="zzim"></a> 
 
   			     </c:otherwise>
   			  </c:choose>
              </div>
            </div>
            <div class="campinfo_contents">
              <ul>
                <li>주소 : ${scDto.addr }</li>
                <c:if test="${scDto.tel != null }">
                	<li>전화번호 : ${ scDto.tel }</li>
                </c:if>
                <c:if test="${scDto.lineIntro != null }">
                	<li>${ scDto.lineIntro }</li>                
                </c:if>
              </ul>
            </div>
            <div class="campinfo_detail">
         	  <c:set var="subList" value="${fn:split(scDto.subPlace,',')}" />
              <ul>
              	<c:forEach var="sub" items="${subList }" varStatus="status">
           		  <c:if test="${sub != null }">
	                <li>${sub}</li>
	              </c:if>
              	</c:forEach>
              </ul>
            </div>
        </div>
      </div>
      </c:forEach>
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
        	    		<li>
        	    			<li class=page_li>
        	    				<a href="list?page=<%=curPage-1 %>">이전</a>
	        	    		</li>
        	    		
        	<%		}
        			for(int i = startPage; i<=endPage; i++){ 
        				if(i == curPage){
        	%>
    					<li class=page_li><a href="list?page=<%=i%>" id=curPage><%=i %></a></li>
    		<%			}else{ %>
        					<li class=page_li>
        						<a href="list?page=<%=i%>"><%=i %></a>
        					</li>
        	<%			
        				}
        			}
        			if(curPage < pageCount){
        	%>
        				<li class=page_li>
        					<a href="list?page=<%=curPage +1 %>">다음</a>
        				</li>
        	<%
        			}
        		}
        	%>
        	</ul>
        </div>
    <footer>

    </footer>
    </div>
   
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>   
 <script>   
 function zzim(camp_id){
	 alert(camp_id);
 	 $.ajax({
		 url:"/mypage/zzim",
		 method:"GET",
		 dataType:"text",
		 data:{
			 user_id:'${loginUser.id}',
			 camp_id: camp_id
		 },
		 success:
		function(data){
			 if(data=="ok"){
			 alert('찜 list에 추가되었습니다.');
			 }
			 if(data=="fail"){
				 alert('이미 찜한 캠핑장입니다.')
			 }
 		 },
		 error:
			 function(){
			 alert('에러남');
		 }
	 });
    }
    
    </script>
    
</body>
</html>