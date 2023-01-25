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
                            <a class="nav-link" href="/">
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
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">재로그인하기</h3></div>
                                    <div class="card-body">
                                        <div class="small mb-3 text-muted">비밀번호를 다시 입력해 주세요.</div>
                                        <form>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="pw" type="pw" placeholder="비밀번호 8~12자리 특수기호 포함"/>
                                                <label for="inputpw">비밀번호 재입력</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="/user/searchPw">비밀번호가 생각나지 않나요?</a>
                                                <a class="btn btn-primary" href="javascript:pwReCheck();" style="color: white">재로그인</a>
                                            </div>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>	  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

 <script type="text/javascript">

/* $(document).keyup(function(e){
   if(e.keyCode===13){
	   pwReCheck();
    }
   }); */
    
function pwReCheck() {
	const pw =  $('#pw').val();
	if(!pw){
		alert('비밀번호를 입력해 주세요.')
	}else{
   	 $.ajax({
   		 url:"/mypage/pwReCheck",
   		 method:"POST",
   		 dataType:"html",
   		 data:{
   			 id:'${loginUser.id}',
   			 pw: pw
   		 },
   		 success:
   		function(data){
   			 if(data=="ok"){
   				alert('로그인 성공');
   				location.href="/mypage/userEdit?id=${loginUser.id}";   
   			 }
   			 if(data=="fail"){
   				alert('비밀번호가 틀립니다.');
   			 }
    	},
   		 error:
   			 function(){
   			 alert('에러남');
   		 }
   	 });
	}
 }
   
   function exit(){
    var result=confirm("정말로 탈퇴하시겠습니까?");
   	if(result){
   		location.href= "/user/unregister?id=${loginUser.id}";
	    }
   }
	</script>
    </body>
</html>
