<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,com.campick.user.model.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     
    <%  UserDto loginUser = (UserDto)session.getAttribute("loginUser");%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CAMPICK</title>
    <link rel="stylesheet" href="/css/analysis.css">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body>
    <div id="container">
        <header>
            <div id="logo">
                <a href="/">
                    <h1> CAMPICK</h1>
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

    <div class="headline">
        <h1><span class=text>빅데이터</span>로 알아보는 캠핑장 PICK</h1>
       <p><span class="highlight">지금 미리 예약해야할 캠핑장은?</span><p>
    </div>
               <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">언급량 분석</h1>
                        <div class="card mb-4">
                            <div class="card-body">
                             <!--   <a target="_blank" href="https://www.chartjs.org/docs/latest/">Chart.js documentation</a>-->
                               
                            </div>
                        </div>
                        <!--/////////// 날짜 선택 -->
                        <form>
                          시작일  <input type="date" id="start_date" name="start_date">
                          종료일  <input type="date" id="last_date" name="last_date">
                          <button type="button" onclick="getChart()">검색하기</button>
                        </form>
                        <!--/////////// 차트 시작 -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                Area Chart Example
                            </div>
                            <div class="card-body"><canvas id="myAreaChart" width="100%" height="30"></canvas></div>
                            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                        </div>
                        <!-- <div class="row">
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Bar Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-pie me-1"></i>
                                        Pie Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                </div>
                            </div>
                        </div> -->
                    </div>
                </main>
            </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
      <!--   <script src="js/scripts.js"></script> -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="assets/demo/chart-pie-demo.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
         <script type="text/javascript"> 
        $(document).ready(function(){
           getChart();
        });
        
        function getChart(){
           alert('hoho');
           var startDate=document.getElementById("start_date").value;
           var lastDate=document.getElementById("last_date").value;

           $.ajax({
               url:"/pick/test",
               method:"GET",
               dataType:"text",
               data:{
                  startDate:startDate,
                  lastDate:lastDate
               },
               success:
                  function(data){
                  alert('success')
               
        //그래프 표현 부분
        
         new Chart(document.getElementById("myAreaChart"), {
    type: 'line',
    data: {
			labels: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    		datasets: [{
    			
    			data: [29.16540,27.67117,28.05639,33.04933,34.04378,32.86315,32.57235,35.90580,31.03037,33.05630,24.68217,21.00641],
    		    label: "caraban",
    		    borderColor: "#8e5ea2",
    		    fill: false
    		    
    	    }, { 
    	        data: [29.16540,27.67117,28.05639,33.04933,34.04378,32.86315,32.57235,35.90580,31.03037,33.05630,24.68217,21.00641],
    		    label: "caraban",
    		    borderColor: "#8e5ea2",
    		    fill: false
    	    }, {
    	        data: [6.08476,6.04077,7.98461,8.41920,9.49493,8.52677,7.13072,7.99426,8.51255,7.85504,4.95108,3.75194],
    		    label: "carbak",
    		    borderColor: "#3cba9f",
    		    fill: false
    	    }, {
    	        data: [59.13962,57.72399,60.14293,79.11483,84.88439,73.03543,75.19657,79.18324,89.70134,100.00000,73.06011,60.97776],
    		    label: "glamping",
    		    borderColor: "#e8c3b9",
    		    fill: false
    	    }]
        }
            ]
    },
    options: {
        title: {
        display: true,
        text: 'World population per region (in millions)'
        }
    }
    }) //chartjs 끝 
               },
               error:
                  function(){
                  alert('에러남');
               }
           }) //ajax 끝
        }; //전체함수 끝
            </script>
<!--     <<p style="text-align: center;"> -->
<!-- 	<img src="/image/ready.PNG"> -->
<!-- 	</p> -->
<!--     <div id="topic">
        <div class="graph">
            <img src="image/trend.PNG">
        </div>
        <div class="description">
            <br>
            <h3>요즘 뜨는 캠핑 유형 트랜드는<br>
                 <span class=deco>#글램핑</span>입니다.</h3>
                 <br>
                    연도별 캠핑 유형별 언급량 증감률을 분석한 결과, '글램핑'의 증가율이 가장 높았고, 뒤이어 '차박', '캠핑카' 등이 뒤를 이었습니다. 캠핑 문화가 대중적으로 자리잡으면서 <b>장비와 짐에 대한 부담을 줄이고 가볍게 캠핑 감성을 즐길 수 있는 글램핑의 인기가 높아지는 것으로 분석</b>됐습니다. 단 글램핑의 경우 캠핑장별 제공되는 시설에 따라 즐길거리와 편의성에 영향이 크기 때문에 예약 전 꼼꼼하게 확인해야 합니다.

        </div>
        <button type="button" onclick = "location.href = 'searchResult.jsp'">캠핑장 추천 받기</button>
    </div> 
    <hr>
    <div id="topic">
        <div class="graph">
            <img src="/image/area.PNG">
        </div>
        <div class="description">
            <br>
            <h3>올해 가장 사람들에게 많이 언급된 지역은<br>
                <span class=deco>#포천</span>입니다.</h3>
                <br>
                2022년도 소셜미디어를 통한 지역별 언급량 분석 결과, <b>포천이 가장 높았고 2위 가평, 3위 연천 순</b>으로 나타났습니다. 포천의 언급량은 전체의 % 수준으로 높은 인기를 얻고 있는 만큼, 희망 캠핑장의 예약을 위해서는 빠른 예약 현황 확인이 필요합니다.

                </div>
                <button type="button" onclick = "location.href = 'searchResult.jsp'">캠핑장 추천 받기</button>
    </div>
    <hr>
    <div id="topic">
        <div class="graph">
            <img src="/image/keyword.PNG">
        </div>
        <div class="description">
            <br>
            <h3>최근 주목받는 캠핑 키워드는<br>
                 <span class=deco>#불멍</span>입니다.</h3>
                 지난 기간 동안 소셜미디어 빅데이터 분석 결과 캠핑 연관어 중 '불멍'이 증가세를 보이고 있습니다. 
                
        </div>
        <button type="button" onclick = "location.href = '/camp/detail'">캠핑장 추천 받기</button>
    </div>
    
    <footer>
        
    </footer>-->
            
</div> 
</body>
</html>