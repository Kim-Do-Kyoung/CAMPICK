<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,com.user.model.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
     
    <%
    	UserDto loginUser = (UserDto)session.getAttribute("loginUser");
    	int count = (int)request.getAttribute("camp_count");
    	String camp_name = (String)request.getAttribute("camp_name");
    	//캠핑장 명이 없을 때 초기화
    	if(camp_name == null){
    		camp_name = "";
    	}
    	
    	String donm = (String)request.getAttribute("donm");
    	String sigungu = (String)request.getAttribute("sigungu");
    	
    	String[] camptype = (String[])request.getAttribute("camptype");
  		String camptypes = "";
  		if(camptype != null){
	    	for (int i =0; i<camptype.length; i++){
	    		camptypes += camptype[i];
	    		if(i+1 == camptype.length){
	    			break;
	    		}
	    		camptypes += ",";
	    	}
  		}
  		
    	String[] place = (String[])request.getAttribute("place");
  		String places = "";
  		if(place != null){
	    	for (int i =0; i<place.length; i++){
	    		places += place[i];
	    		if(i+1 == place.length){
	    			break;
	    		}
	    		places += ",";
	    	}
  		}
    	String[] thema = (String[])request.getAttribute("thema");
  		String themas = "";
  		if(thema != null){
	    	for (int i =0; i<thema.length; i++){
	    		themas += thema[i];
	    		if(i+1 == thema.length){
	    			break;
	    		}
	    		themas += ",";
	    	}
  		}
    	String[] subplace = (String[])request.getAttribute("subplace");
  		String subplaces = "";
  		if(subplace != null){
	    	for (int i =0; i<subplace.length; i++){
	    		subplaces += subplace[i];
	    		if(i+1 == subplace.length){
	    			break;
	    		}
	    		subplaces += ",";
	    	}
  		}
  		
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CAMPICK</title>
    <link rel="stylesheet" href="css/searchResult.css">
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

    <div id="resultCount">
        <p>총  <%=count %>개의 결과가 검색되었습니다.</p>
        <hr>
    </div>

    <div id="contents">
      <c:forEach var="scDto" items="${scDtoList }" varStatus="status">
      <div class="card">
      	<c:set var="check" value="1"></c:set>
      	<c:forEach var="giDto" items="${giDtoList }" varStatus="gi_status">
		    <c:if test="${scDto.camp_id == giDto.camp_id }">
	          <img src="${giDto.imgUrl1}" alt="캠핑장 사이트 사진" width=340px height=330px>
              <c:set var="check" value="0"></c:set>
		    </c:if>
        </c:forEach>
        <c:if test="${check ==1 }">
	      <img src="image/noimage.png" alt="캠핑장 사이트 사진" width=340px height=330px>
	    </c:if>
        <div class="campinfo">
          <div class="campinfo_head">
            <a href="campDetail.do?camp_id=${scDto.camp_id}">${scDto.camp_name }<span id=campFont>(${scDto.facility})</span></a>
              <div class="wishlist">
                <img src="image/wishlist.png" onclick="alert('찜 list에 추가되었습니다.')">
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
    	<c:set var="scDto">${scDtoList }</c:set>
        	<ul>
        	<%
        		if(count != 0){
        			String reqPage = request.getParameter("page");
        	    	if(reqPage == null){
        	    		reqPage = "1";
        	    	}
        			int pageSize = 9; // 페이지당 보여주는 게시글 갯수
        			int pageCount = count / pageSize + (count % pageSize == 0? 0:1); //페이지 갯수
        	    	int curPage = Integer.parseInt(reqPage);
        	    	int pageBlock = 10;
        	    	
        	    	int startPage = ((curPage-1)/pageBlock)*pageBlock+1;
        	    	
        	    	int endPage = startPage + pageBlock-1;
        	    	if(endPage > pageCount){
        	    		endPage = pageCount;
        	    	}
        	    	if(curPage >1){
        	%>
        	    		<li><li class=page_li>
        	    			<a href="campList.do?page=<%=curPage-1 %>&camp_name=<%=camp_name%>&donm=<%=donm%>&sigungu=<%=sigungu%>&camptypes=<%=camptypes%>&places=<%=places%>&themas=<%=themas%>&subplace=<%=subplaces%>">이전</a>
        	    		</li>
        	    		
        	<%		}
        			for(int i = startPage; i<=endPage; i++){ 
        				if(i == curPage){
        	%>
    						<li class=page_li><a href="campList.do?page=<%=i%>&camp_name=<%=camp_name%>&donm=<%=donm%>&sigungu=<%=sigungu%>&camptypes=<%=camptypes%>&places=<%=places%>&themas=<%=themas%>&subplace=<%=subplaces%>"  id=curPage><%=i %></a></li>
    		<%			}else{ %>
        					<li class=page_li>
        						<a href="campList.do?page=<%=i%>&camp_name=<%=camp_name%>&donm=<%=donm%>&sigungu=<%=sigungu%>&camptypes=<%=camptypes%>&places=<%=places%>&themas=<%=themas%>&subplaces=<%=subplaces%>"><%=i %></a>
        					</li>
        	<%			
        				}
        			}
        			if(endPage < pageCount){
        	%>
        				<li class=page_li>
        					<a href="campList.do?page=<%=curPage +1 %>&camp_name=<%=camp_name%>&donm=<%=donm%>&sigungu=<%=sigungu%>&camptypes=<%=camptypes%>&places=<%=places%>&themas=<%=themas%>&subplace=<%=subplaces%>">다음</a>
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
</body>
</html>