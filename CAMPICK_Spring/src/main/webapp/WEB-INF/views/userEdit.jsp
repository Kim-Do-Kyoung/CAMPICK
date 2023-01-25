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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">회원정보수정</h3></div>
                                    <div class="card-body">
                                        <form name="editForm">
                                            <div class="col-md-6">
                                            <div class="col-12">
                                               <div class="small mb-3 text-muted">회원 ID</div>
                                               <input class="form-control" id="name" name="id" type="text" readonly value=${loginUser.id }>
                                            </div>
                                            </div>
                                            <br>
                                            <div class="row g-2">
                                            	<div class="col-6">
                                             	  <div class="small mb-3 text-muted">새로운 비밀번호</div>
                                             	   <input class="form-control" id="user_pw" type="password" onkeyup="newpw()" name="pw" placeholder="비밀번호 8~12자리 특수기호 포함">
                                              	<!--  <input class="form-control" type="password" id="user_pw" name="pw" required placeholder="비밀번호 8~12자리 특수기호 포함" onkeyup="pwCheck()"> -->
                                          		</div>
                                           
                                                <div class="col-6">
                                              		 <div class="small mb-3 text-muted">비밀번호 재확인</div>
                                               		 <input class="form-control" id="user_pw2" type="password" onkeyup="pw_duplicate()">
                                          	    </div>
											</div>

											<div class="row g-2">
												<div class="col-10">
                                              		 <div class="small mb-3 text-muted text-start"><p style="height:10px" id="pwMsg"></p></div>
                                            	</div>
                                           		<div class="col-2">
                                              		 <div class="small mb-3 text-muted text-end"><p style="height:10px" id="checkMsg"></p></div>
                                            	</div>
                                            </div>
                                            
                                            <div class="col-md-6">
                                            <div class="col-12">
                                               <div class="small mb-3 text-muted">이름</div>
                                               <input class="form-control" id="name" name="name" type="text" value=${loginUser.name } />
                                            </div>
                                            </div>
                                            <br>
                                            <div class="col-12">
                                               <div class="small mb-3 text-muted">주소</div>
                                               <input class="form-control" id="addr" name="addr" type="text" value=${loginUser.addr } />
                                            </div>
                                              <br>
                                           <div class="col-12">
                                               <div class="small mb-3 text-muted">이메일</div>
                                               <input class="form-control" id="email" name="email" type="email" value=${loginUser.email } />
                                            </div>
                                              <br>
                                            <div class="col-12">
                                               <div class="small mb-3 text-muted">전화번호</div>
                                               <input class="form-control" id="phone" type="tel" name="phone" value=${loginUser.phone } />
                                            </div>
                                            <div class="mt-4 mb-0">
                                             <div class="d-grid"><a class="btn btn-primary btn-block" href="javascript:userEdit();" style="color: white">수정하기</a></div>
                                          
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
            
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>            
	<script>
	var pwCheck=false;
	function exit(){
   		var result=confirm("정말로 탈퇴하시겠습니까?");
		if(result){
			location.href= "/user/unregister?id=${loginUser.id}";
    	}
	}
	
	
	function pw_duplicate(){
		
		const pw1 = document.getElementById("user_pw");
		const pw2 = document.getElementById("user_pw2");
		const checkMsg = document.getElementById("checkMsg");
		if(pw1.value==pw2.value){
			checkMsg.style.color = "#134f2c";
			checkMsg.innerText = "OK!";
	        pwCheck=true;
		} else{
			checkMsg.style.color = "#D1433A";
			checkMsg.innerText = "NOT OK";   
		}
	}

	
	function newpw(){
		   const password =  document.getElementById("user_pw");
		   const pwMsg = document.getElementById("pwMsg");
		   const pattern = /^.*(?=^.{8,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; // 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식 ( 3 가지 조합)
		     
		     if(pattern.test(password.value)){
		        pwMsg.style.color = "#134f2c";
		        pwMsg.innerText = "사용 가능한 비밀번호입니다.";
		         return true;
		     }
		     else{
		        pwMsg.style.color = "#D1433A";
		        pwMsg.innerText = "8~12자리의 특수문자/영문자/숫자 포함";   
		         
		   }
	}
	
	function userEdit(){
		if(pwCheck==true){
			editForm.method="post";
			editForm.action="/mypage/userEdit";
			editForm.submit();
		}else{
			alert("pw를 다시 확인해 주세요.");
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