<%@page import="poly.dto.QuizDTO"%>
<%@page import="static poly.util.CmmUtil.nvl"%>
<%@page import="java.util.List"%>
<%
	List<QuizDTO> res = (List<QuizDTO>) request.getAttribute("rList");
  		
%>
<%@ include file="./session.jsp"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Do IT Sign</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon
		============================================ -->
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico">
<!-- Google Fonts
		============================================ -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900"
	rel="stylesheet">
<!-- Bootstrap CSS
		============================================ -->
<link rel="stylesheet" href="/css/bootstrap.min.css">
<!-- font awesome CSS
		============================================ -->
<link rel="stylesheet" href="/css/font-awesome.min.css">
<!-- owl.carousel CSS
		============================================ -->
<link rel="stylesheet" href="/css/owl.carousel.css">
<link rel="stylesheet" href="/css/owl.theme.css">
<link rel="stylesheet" href="/css/owl.transitions.css">
<!-- meanmenu CSS
		============================================ -->
<link rel="stylesheet" href="/css/meanmenu/meanmenu.min.css">
<!-- animate CSS
		============================================ -->
<link rel="stylesheet" href="/css/animate.css">
<!-- normalize CSS
		============================================ -->
<link rel="stylesheet" href="/css/normalize.css">
<!-- wave CSS
		============================================ -->
<link rel="stylesheet" href="/css/wave/waves.min.css">
<link rel="stylesheet" href="/css/wave/button.css">
<!-- mCustomScrollbar CSS
		============================================ -->
<link rel="stylesheet"
	href="css/scrollbar/jquery.mCustomScrollbar.min.css">
<!-- Notika icon CSS
		============================================ -->
<link rel="stylesheet" href="/css/notika-custom-icon.css">
<!-- main CSS
		============================================ -->
<link rel="stylesheet" href="/css/main.css">
<!-- style CSS
		============================================ -->
<link rel="stylesheet" href="/css/style.css">
<!-- responsive CSS
		============================================ -->
<link rel="stylesheet" href="/css/responsive.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<!-- modernizr JS
		============================================ -->
<script src="/js/vendor/modernizr-2.8.3.min.js"></script>
<script>
	
</script>
<style>
 .white {
   color: white;
   margin-left: 24px;
   font-weight: bold;
}

#db {
	float: left;
}
 *{font-family: 'Noto Sans KR', sans-serif;}

.card {
	display: flex;
	height: 280px;
	width: 200px;
	background-color: white;
	border-radius: 10px;
		box-shadow: -0.5rem 0 1rem rgba(181,181,181,0.5);
	/*   margin-left: -50px; */
	transition: 0.4s ease-out;
	position: relative;
	left: 0px;
	cursor: pointer;
}

.card:not (:first-child ) {
	margin-left: -50px;
}

.card:hover {
	transform: translateY(-20px);
	transition: 0.4s ease-out;
}

.card:hover ~ .card {
	position: relative;
	left: 50px;
	transition: 0.4s ease-out;
}

.title {
	color: black;
	font-weight: 300;
	position: absolute;
	left: 20px;
	top: 15px;
}

.bar {
	position: absolute;
	top: 100px;
	left: 20px;
	height: 5px;
	width: 150px;
}
.emptybar {
	background-color: #899492;
	width: 100%;
	height: 100%;
}

.filledbar {
	position: absolute;
	top: 0px;
	z-index: 3;
	width: 0px;
	height: 100%;
	background: rgb(0, 154, 217);
	background: #d1dad8;
	transition: 0.6s ease-out;
}

.card:hover .filledbar {
	width: 120px;
	transition: 0.4s ease-out;
}

.circle {
	position: absolute;
	top: 150px;
	left: calc(50% - 60px);
	color: green;
}

.stroke {
	stroke: #e2e4e4;
	stroke-dasharray: 360;
	stroke-dashoffset: 360;
	transition: 0.6s ease-out;
}

svg {
	fill: #3e8071; 
	stroke-width: 2px;
}


.card:hover .stroke {
	stroke-dashoffset: 100;
	transition: 0.6s ease-out;
}
</style>
</head>

<body>
	<!-- 로고, 세션 적용한 상단 헤더 영역 시작 -->
   <div class="header-top-area">
      <div class="container">
         <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
               <div class="logo-area">
                  <a href="/index.do"><img src="/img/logo/dblogo.png" alt="" /></a>
               </div>
            </div>
            <div class="area_gnb" style="margin-top: 25px; float: right">
               <%
                  if (user_type.equals("1") && state.equals("0")) {
               %>
               <b class="white"><%=user_name%>님, 환영합니다!</b> <a
                  href="user/logout.do" class="white">로그아웃</a> <b class="white">
                  | </b> <a href="/user/myPage.do" class="white"> 마이페이지</a>
               <%
                  } else {
               %>
               <a href="/user/login_register.do" class="white"> 로그인 </a> <b
                  class="white"> | </b> <a href="/user/myPage.do" class="white">
                  마이페이지</a>
               <%
                  }
               %>
            </div>
         </div>
      </div>
   </div>
   <!-- 로고, 세션 적용한 상단 헤더 영역 끝 -->


  <!--네비게이션바 시작 (원래는 main menu area 임)  -->
	<div class="main-menu-area mg-tb-40" id="ksb">
      <div class="container">                    
         <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
               <ul class="nav nav-tabs notika-menu-wrap menu-it-icon-pro" id="x">
                 <li><a data-toggle="tab" onclick="location.href='/index.do'"; style="cursor: pointer;"><i 
                        class="fas fa-home" style="font-weight:1000;"></i> Home</a></li>
                  <li><a data-toggle="tab" href="#mailbox"><i                       
                        class="fas fa-search" style="font-weight:1000;"></i> 수화사전</a></li>          
                  <li><a data-toggle="tab" onclick="location.href='/quiz.do'"; style="cursor: pointer;"><i
                        class="fas fa-sign-language" style="font-weight:1000;"></i> 문제풀이</a></li>          
                  <li><a data-toggle="tab" onclick="location.href='/study/studyList.do'"; style="cursor: pointer;" ><i
                          class="far fa-list-alt" style="font-weight:1000;"></i> 학습게시판</a></li>
                  <li class="active"><a data-toggle="tab" onclick="location.href='/map.do'"; style="cursor: pointer;"><i
                        class="fa fa-map" style="font-weight:1000;"></i> 맵</a></li>
                  <li><a data-toggle="tab" onclick="location.href='/notice/noticeList.do'"; style="cursor: pointer;"><i
                        class="far fa-clipboard" style="font-weight:1000;"></i>공지사항</a></li>       

                 
               </ul>
               <div class="tab-content custom-menu-content">
                  <div id="Home"
                     class="tab-pane in notika-tab-menu-bg animated flipInX">
                   
                  </div>
                  <div id="mailbox"
                     class="tab-pane notika-tab-menu-bg animated flipInX">
                     <ul class="notika-main-menu-dropdown">
                     <li><a href="inbox.html"></a></li>
                        <li><a onclick="location.href='/signBook/signBookList.do'"; style="cursor: pointer;">한글 수화</a></li>
                        <li><a onclick="location.href='/EsignBookList.do'"; style="cursor: pointer;">영어 수화</a></li>
                        
                     </ul>
                  </div>
                  <div id="Interface"
                     class="tab-pane notika-tab-menu-bg animated flipInX">
                  </div>
                  <div id="Charts"
                     class="tab-pane notika-tab-menu-bg animated flipInX">
                  </div>
                  <div id="Tables"
                     class="tab-pane active notika-tab-menu-bg animated flipInX">
                  </div>
                  <div id="Forms"
                     class="tab-pane notika-tab-menu-bg animated flipInX">
                  </div>
                  <div id="Appviews"
                     class="tab-pane notika-tab-menu-bg animated flipInX">
                  </div>
                  <div id="Page"
                     class="tab-pane notika-tab-menu-bg animated flipInX">
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!--네비게이션바 끝 (원래는 main menu area 임)  -->
	<!-- Breadcomb area Start-->
	<div class="breadcomb-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="breadcomb-list" style="
background: #fff;
box-shadow: 0 6px 10px rgba(0,0,0,.08), 0 0 6px rgba(0,0,0,.05);
transition: .3s transform cubic-bezier(.155,1.105,.295,1.12),.3s box-shadow,.3s -webkit-transform cubic-bezier(.155,1.105,.295,1.12);
border-radius: 40px 40px 40px 40px;">
						<div class="row" style="text-align:center;">
										<h2>문 장 풀 이</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcomb area End-->
	<!-- Normal Table area Start-->
	<div class="normal-table-area">
		<div class="container">

			<div class="row">

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div style="text-align: center;">
						<%
							for (QuizDTO e : res) {
						%>
						<div class="container1" style="  display:inline-block;" onclick="location.href='/quiz/type2detail.do?sign_name=<%=e.getSign_name()%>'" >
							<div class="card">
							
								<h3 class="title"><%=nvl(e.getSign_name())%></h3>
								
								<div class="bar">
									<div class="emptybar"></div>
									<div class="filledbar"></div>
								</div>
								<div class="circle">
									<svg version="1.1" xmlns="http://www.w3.org/2000/svg" style="width: 300px;">
                                   <circle class="stroke" cx="60"cy="60" r="50" />
                                        </svg>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
					<br>
				</div>
			</div>

		</div>
	</div>


	<!-- Normal Table area End-->
	<!-- Start Footer area-->
	<div class="footer-copyright-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="footer-copy-right">
					 <p>Copyright © 2020 . All rights reserved. Template by Colorlib. Team FOMARD.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Footer area-->
	<!-- jquery
		============================================ -->
	<script src="/js/vendor/jquery-1.12.4.min.js"></script>
	<!-- bootstrap JS
		============================================ -->
	<script src="/js/bootstrap.min.js"></script>
	<!-- wow JS
		============================================ -->
	<script src="/js/wow.min.js"></script>
	<!-- price-slider JS
		============================================ -->
	<script src="/js/jquery-price-slider.js"></script>
	<!-- owl.carousel JS
		============================================ -->
	<script src="/js/owl.carousel.min.js"></script>
	<!-- scrollUp JS
		============================================ -->
	<script src="/js/jquery.scrollUp.min.js"></script>
	<!-- meanmenu JS
		============================================ -->
	<script src="/js/meanmenu/jquery.meanmenu.js"></script>
	<!-- counterup JS
		============================================ -->
	<script src="/js/counterup/jquery.counterup.min.js"></script>
	<script src="/js/counterup/waypoints.min.js"></script>
	<script src="/js/counterup/counterup-active.js"></script>
	<!-- mCustomScrollbar JS
		============================================ -->
	<script src="/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- sparkline JS
		============================================ -->
	<script src="/js/sparkline/jquery.sparkline.min.js"></script>
	<script src="/js/sparkline/sparkline-active.js"></script>
	<!-- flot JS
		============================================ -->
	<script src="/js/flot/jquery.flot.js"></script>
	<script src="/js/flot/jquery.flot.resize.js"></script>
	<script src="/js/flot/flot-active.js"></script>
	<!-- knob JS
		============================================ -->
	<script src="/js/knob/jquery.knob.js"></script>
	<script src="/js/knob/jquery.appear.js"></script>
	<script src="/js/knob/knob-active.js"></script>
	<!--  Chat JS
		============================================ -->
	<script src="/js/chat/jquery.chat.js"></script>
	<!--  todo JS
		============================================ -->
	<script src="/js/todo/jquery.todo.js"></script>
	<!--  wave JS
		============================================ -->
	<script src="/js/wave/waves.min.js"></script>
	<script src="/js/wave/wave-active.js"></script>
	<!-- plugins JS
		============================================ -->
	<script src="/js/plugins.js"></script>
	<!-- main JS
		============================================ -->
	<script src="/js/main.js"></script>
</body>
</html>