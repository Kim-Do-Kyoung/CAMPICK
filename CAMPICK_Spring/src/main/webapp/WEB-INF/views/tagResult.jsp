<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,com.user.model.*, com.tag.model.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

    <%  UserDto loginUser = (UserDto)session.getAttribute("loginUser");
    int count = (int)request.getAttribute("camp_count");
    String[] tag =(String[])request.getAttribute("tag");
    String retag = String.join(",", tag);

    %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CAMPICK</title>
    <link rel="stylesheet" href="css/tagResult.css">

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
                <li><a href="search.jsp">캠핑장찾기</a></li>
                <li><a href="tagSearch.jsp">태그로 찾기</a></li>
                <li><a href="analysis.jsp">캠핑 예측Pick</a></li>
                <li><a href="boradList.do">커뮤니티</a></li>
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
     
                <img src="image/example2.jpg" alt="캠핑장 사이트 사진">
                    <div class="campinfo">
                        <div class="campinfo_head">
                            <a href="tagDetail.do?camp_id=${tagDto.camp_id}">${tagDto.camp_name}</a>
                            <div class="wishlist">
                            <c:choose>
                             <c:when test="${loginUser==null}">
        			   		 </c:when>
         				  	<c:otherwise>
                            <a href="zzim.do?camp_id=${tagDto.camp_id}&user_id=${loginUser.id}"><img src="image/wishlist.png" id="jjim"></a>
                             <!--    <img src="image/wishlist.png" onclick="alert('찜 list에 추가되었습니다.')"> -->
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
                        <c:set var = "subplace" value = "${fn:split(tagDto.subplace, ',')}" />
                       <c:forEach var="sub" items="${subplace}" varStatus="status">
           				  <c:if test="${sub != null }">
	              		  <li>${sub}</li>
	            		  </c:if>
              			</c:forEach>
                       <!--  <li>${tagDto.subplace}</li>  --> 

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
       	String pageNo = request.getParameter("page");
       	if(pageNo == null){
       		pageNo = "1";
       	}
       	int currentPage = Integer.parseInt(pageNo);
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
	    			<a href="tagSearch.do?page=<%=currentPage-1 %>&retag=<%=retag%>">이전</a>
	    		</li>
	    		
	<%		}
			for(int i = startPage; i<=endPage; i++){ 
				if(i == currentPage){
	%>
					<li class=page_li><a href="tagSearch.do?page=<%=i%>&retag=<%=retag%>" id=currentPage><%=i %></a></li>
	<%			}else{ %>
					<li class=page_li>
						<a href="tagSearch.do?page=<%=i%>&retag=<%=retag%>"><%=i %></a>
					</li>
	<%			
				}
			}
			if(endPage < pageCount){
	%>
				<li class=page_li>
					<a href="tagSearch.do?page=<%=currentPage +1%>&retag=<%=retag%>">다음</a>
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