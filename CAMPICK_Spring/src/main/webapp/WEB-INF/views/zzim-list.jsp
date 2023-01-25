<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,com.campick.user.model.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     
    <% 
    UserDto loginUser = (UserDto)session.getAttribute("loginUser");
    %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>마이페이지 - 찜목록</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/">CAMPICK</a>

            <!-- Navbar Search-->
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/user/logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">my Info</div>
                            <a class="nav-link" href="/mypage/pwReCheck?id=${loginUser.id}">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                             	   내 정보 수정
                             	   </a>
                            <div class="sb-sidenav-menu-heading">my Contents</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                             	   내 컨텐츠
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/mypage/writeList?name=${loginUser.name}">내가 쓴글 보기</a>
                                    <a class="nav-link" href="/mypage/zzimlist?id=${loginUser.id}">내 찜 list</a>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">campick:</div>
                      	<a href="javascript:exit();" style="color: gray">탈퇴하기</a>
                      	
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-5">내가 찜한 목록</h1>
                        <ol class="breadcrumb mb-4">
                          <!--   <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
                            <li class="breadcrumb-item active">찜한 캠핑장 한눈에 보기!</li>
                        </ol> 

                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Zzim List
                                </div>
                            <c:forEach var ="tagDto" items="${myList}" varStatus="status">
                            <div class="card-body">
                                <div id="pick" class="tabContent">
                                    <ol>
                                    <button onclick="zzimDelete(${tagDto.camp_id})" class="btn btn-dark">찜삭제</button>
                                        <li><a href="/tag/detail?camp_id=${tagDto.camp_id}"><h3>${tagDto.camp_name}</h3></a></li>
                                        <li><hr class="dropdown-divider" /></li>
                        
                                            <table class="table" style="table-layout: fixed">
                                                <tbody>
                                                    <tr>
                                                        <th class="w-25 p-3 table-success">주소</td>
                                                        <td class="w-50 p-3">${tagDto.addr}</td>
                                                        <th class="w-25 p-3 table-success">번호</td>
                                                        <td class="w-50 p-3">${tagDto.tel}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                    </ol>
                                </div>
                            </div>
                            </c:forEach>
        <div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/mypage/zzimlist?id=${loginUser.id}&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/mypage/zzimlist?id=${loginUser.id}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/mypage/zzimlist?id=${loginUser.id}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                            <div>
<!--                                 <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a> -->
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script>
    function zzimDelete(camp_id){
    	 $.ajax({
   		 url:"/mypage/zzimDelete",
   		 method:"GET",
   		 dataType:"text",
   		 data:{
   			 user_id:'${loginUser.id}',
   			 camp_id: camp_id
   		 },
   		 success:
   		function(data){
   			 if(data=="ok"){
   			 alert('찜 목록에서 삭제되었습니다.');
   			 location.reload(true);
   			 }

    		 },
   		 error:
   			 function(){
   			 alert('에러남');
   		 }
   	 });
       }
    
    function exit(){
       	var result=confirm("정말로 탈퇴하시겠습니까?");
    	if(result){
    		location.href= "/user/unregister?id=${loginUser.id}";
/*     		var unregister = document.unregister;
    		unregister.method="post";
    		unregister.action ="/user/unregister?id=${loginUser.id}"; */
	    }
    }
    </script>
    </body>
</html>
