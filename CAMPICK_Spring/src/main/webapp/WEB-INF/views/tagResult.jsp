<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,com.campick.user.model.*,com.campick.tag.model.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

    <%  UserDto loginUser = (UserDto)session.getAttribute("loginUser");
    int count = (int)session.getAttribute("camp_count");
    %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CAMPICK</title>
    <link rel="stylesheet" href="/css/tagResult.css">

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
         	    <li><a href="mypage.do">마이페이지</a></li>
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
                <li><a href="/">캠핑장찾기</a></li>
                <li><a href="/tag/search">태그로 찾기</a></li>
                <li><a href="/pick/list">캠핑 예측Pick</a></li>
                <li><a href="/board/list">커뮤니티</a></li>
                </ul>
            </nav>
    </header>

    <div id="contents">
            <ul>
                <li></li>
                <li></li>
                <li></li>
            </ul>

            <h2 id="result">
                당신에게 추천하는 캠핑장은

            </h2>

	  <c:forEach var="tagDto" items="${tagSearchList}" varStatus="status">
        <div class="card">
          <c:set var="check" value="1"></c:set>
          <c:forEach var="giDto" items="${giDtoList }" varStatus="gi_status">
	  	    <c:if test="${tagDto.camp_id == giDto.camp_id}">
	          <img src="${giDto.imgUrl1}" alt="캠핑장 사이트 사진" width=340px height=330px>
              <c:set var="check" value="0"></c:set>
		    </c:if>
          </c:forEach>
          <c:if test="${check ==1 }">
	        <img src="/image/noimage.png" alt="캠핑장 사이트 사진" width=340px height=330px>
	      </c:if>
          <div class="campinfo">
            <div class="campinfo_head">
              <a href="detail?camp_id=${tagDto.camp_id}">${tagDto.camp_name}</a>
              <div class="wishlist">
                <c:choose>
                  <c:when test="${loginUser==null}">
        	 		 </c:when>
         		  <c:otherwise>
                    <a href="zzim.do?camp_id=${tagDto.camp_id}&user_id=${loginUser.id}"><img src="/image/wishlist.png" id="jjim"></a>
                  </c:otherwise>
                </c:choose>
              </div>
             </div>
            <div class="campinfo_contents">
                <ul>
                    <li>${tagDto.addr}</li>
                    <li>${tagDto.tel}</li>
                </ul>
            </div>
            <div class="campinfo_detail">
             <ul>
            <c:set var = "subPlace" value = "${fn:split(tagDto.subPlace, ',')}" />
           <c:forEach var="sub" items="${subPlace}" varStatus="status">
			  <c:if test="${sub != null }">
   		  <li>${sub}</li>
 		  </c:if>
  			</c:forEach>

             </ul>
            </div>

            </div>
        </div> 
                    
     	</c:forEach>  
     	
     	
       <!-- 페이징 처리 -->  
       <div id="page_control">
       <ul>
       <%
       if(count !=0){
   		int pageSize = 3;
       	int currentPage = (int)session.getAttribute("page");
       	int startRow = ((currentPage-1) * pageSize) +1 ;
    	   int pageCount = count / pageSize + (count%pageSize==0?0:1);
    	   int pageBlock = 10;
    	   int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
    	   
    	   int endPage = startPage + pageBlock-1;
    	   if(endPage > pageCount){
    		   endPage = pageCount;
    	   }
	    	if(currentPage >1){
	%>
	    		<li class=page_li>
	    			<a href="tagSearch?page=<%=currentPage-1 %>">이전</a>
	    		</li>
	    		
	<%		}
			for(int i = startPage; i<=endPage; i++){ 
				if(i == currentPage){
	%>
					<li class=page_li><a href="tagSearch?page=<%=i%>" id=currentPage><%=i %></a></li>
	<%			}else{ %>
					<li class=page_li>
						<a href="tagSearch?page=<%=i%>"><%=i %></a>
					</li>
	<%			
				}
			}
			if(endPage < pageCount){
	%>
				<li class=page_li>
					<a href="tagSearch?page=<%=currentPage +1%>">다음</a>
				</li>
	<%
			}  
    	   
       }

	   %>
	   </ul>
       
       </div>

		
    </div>

    <footer>

    </footer>
    </div>
    
    <script>
    
    function jjim(){
const jjim = document.getElementById("jjim");
jjim.addEventListener('click',function(event){
	document.location.href = "jjim.do?camp_name=${dto.camp_name}";
});
    }
    
    </script>
    
</body>
</html>