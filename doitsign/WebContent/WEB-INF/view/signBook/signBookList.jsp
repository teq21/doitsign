<%@page import="poly.util.Pagination"%>
<%@page import="poly.dto.SignBookDTO"%>
<%@page import="static poly.util.CmmUtil.nvl"%>
<%@page import="java.util.List"%>
<%
   List<SignBookDTO> rList = (List<SignBookDTO>) request.getAttribute("rList");
   String pageName = "signBookList";
   Pagination pg = (Pagination) request.getAttribute("pg");
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
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
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
<link rel="stylesheet" href="/css/animation/animation-custom.css">
<!-- normalize CSS
      ============================================ -->
<link rel="stylesheet" href="/css/normalize.css">
<!-- mCustomScrollbar CSS
      ============================================ -->
<link rel="stylesheet"
   href="/css/scrollbar/jquery.mCustomScrollbar.min.css">
<!-- Notika icon CSS
      ============================================ -->
<link rel="stylesheet" href="/css/notika-custom-icon.css">
<!-- wave CSS
      ============================================ -->
<link rel="stylesheet" href="/css/wave/waves.min.css">
<!-- main CSS
      ============================================ -->
<link rel="stylesheet" href="/css/main.css">
<!-- style CSS
      ============================================ -->
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<!-- responsive CSS
      ============================================ -->
<link rel="stylesheet" href="/css/responsive.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<!-- modernizr JS
      ============================================ -->
<script src="/js/vendor/modernizr-2.8.3.min.js"></script>
<style>

.white {
	color: white;
	margin-left: 24px;
	font-weight: bold;
}


 *{font-family: 'Noto Sans KR', sans-serif;}
 
.animate-one {
   height: 400px;
   weight: 200px;
}

.invoice-wrap {
   padding: 400px;
}

.area_gnb {
   float: right;
}



.right {
   position: absolute;
   bottom: 10px;
   right: 35px;
}

.right1 {
   margin-left: 15px;
}

//
flip card css
   /* The flip card container - set the width and height to whatever you want. We have added the border property to demonstrate that the flip itself goes out of the box on hover (remove perspective if you don't want the 3D effect */
   /* The flip card container - set the width and height to whatever you want. We have added the border property to demonstrate that the flip itself goes out of the box on hover (remove perspective if you don't want the 3D effect */
   
   
   
.flip-card {
   background-color: transparent;
   width: 300px;
   height: 200px;
   border: 1px solid #f1f1f1;
   perspective: 1000px; /* Remove this if you don't want the 3D effect */
}

/* This container is needed to position the front and back side */
.flip-card-inner {
   position: relative;
   width: 100%;
   height: 100%;
   text-align: center;
   transition: transform 0.8s;
   transform-style: preserve-3d;
}

/* Do an horizontal flip when you move the mouse over the flip box container */
.flip-card:hover .flip-card-inner {
   transform: rotateY(180deg);
}

/* Position the front and back side */
.flip-card-front, .flip-card-back {
   position: absolute;
   width: 100%;
   height: 100%;
   -webkit-backface-visibility: hidden; /* Safari */
   backface-visibility: hidden;
}

/* Style the front side (fallback if image is missing) */
.flip-card-front {
   background-color: #9ae1cf;
   color: black;
}

/* Style the back side */
.flip-card-back {
   background-color: dodgerblue;
   color: black;
   transform: rotateY(180deg);
}
a.page_link{color:white};

// tittle css

@import url("https://fonts.googleapis.com/css?family=Montserrat:200,400");


.pre-text {
    display: inline;
    font-weight: 200;
 }

.overflow {
  height: 30px;
  width: 900px;
  overflow: hidden;
  position: relative;
  display: -webkit-inline-box;
}

#text-animate > h3 {
  font-weight: 400;
  display: inline;
  position: absolute;
  margin-top: 0;
  margin-left: 20px;
  opacity: 0;
  animation: textAnimation 8s ease-in-out infinite;
  color: grey;
}

#text-animate > h3:nth-child(2) {
  animation-delay: 2s;
}
#text-animate > h3:nth-child(3) {
  animation-delay: 4s;
}
#text-animate > h3:nth-child(4) {
  animation-delay: 6s;
}

@keyframes textAnimation {
  0% {
    opacity: 1;
    top: 35px;
  }

  8% {
    opacity: 1;
    top: 0;
  }
  17% {
    opacity: 1;
    top: 0;
  }
  25% {
    opacity: 1;
    top: -35px;
  }
  100% {
    opacity: 1;
    top: -35px;
  }
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
               <div class="breadcomb-list" style="background: #fff;
    box-shadow: 0 6px 10px rgba(0,0,0,.08), 0 0 6px rgba(0,0,0,.05);
    transition: .3s transform cubic-bezier(.155,1.105,.295,1.12),.3s box-shadow,.3s -webkit-transform cubic-bezier(.155,1.105,.295,1.12);
    border-radius: 40px 40px 40px 40px;"">
  
                  
                  <div style="text-align: center;">
  <div class="overflow">
      <h3 style="color:#00c292; margin-left:240px; display: inline; font-weight: bold; " >한글사전 </h3>
    <div id="text-animate" style="font-size: 1">
      <h3>원하는 한글 단어를 찾아보세요!</h3>
      <h3></h3>
      <h3>카드를 뒤집으면 수화 설명이 나옵니다</h3>
    </div>
    </div>
</div>
                  
                  
               </div>
         </div>
      </div>
   </div>
   <!-- Breadcomb area End-->

   <!-- Animateions area start-->
  <div class="animation-area">
		<div class="container">

			<div class="row">
				<%
					for (SignBookDTO e : rList) {
				%>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<div class="card"
						style="width: 357px; height: 320px; box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05); transition: .3s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .3s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12); cursor: pointer; border-radius: 20px;
						 ">
						<div class="flip-card">
							<div class="flip-card-inner" >
								<div class="flip-card-front">
									<img src="<%=nvl(e.getImg_path())%>" alt="Avatar"
										style="width: 290px; height: 250px;"> <br> 
									<div>
										<h2><%=nvl(e.getPost_title())%></h2>
									</div>
								</div>
								<div class="flip-card-back">
									<h1><%=nvl(e.getPost_title())%></h1>
									<hr>
									<br>
									
		<div style="height: 300px;width: 300px; margin: auto; line-height:2.2;font-size: medium;text-align: justify;"><%=nvl(e.getSign_info())%></div>							

								</div>

							</div>
						</div>

					</div>
					<br> <br>
				</div>

				<%
					}
				%>
			</div>
			<%
				if (rList.size() == 0) {
			%>
			<div>게시물이 없습니다.</div>
			<%
				} else {
			%>
			<%@include file="/WEB-INF/view/Pagination.jsp"%>
			<%
				}
			%>
			<br>


		</div>
	</div>

   <!-- Animateions area End-->

   <!-- Start Footer area-->
   <div class="footer-copyright-area">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
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
   <!--  wave JS
      ============================================ -->
   <script src="/js/wave/waves.min.js"></script>
   <script src="/js/wave/wave-active.js"></script>
   <!--  animation JS
      ============================================ -->
   <script src="/js/animation/animation-active.js"></script>
   <!--  Chat JS
      ============================================ -->
   <script src="/js/chat/jquery.chat.js"></script>
   <!--  todo JS
      ============================================ -->
   <script src="/js/todo/jquery.todo.js"></script>
   <!-- plugins JS
      ============================================ -->
   <script src="/js/plugins.js"></script>
   <!-- main JS
      ============================================ -->
   <script src="/js/main.js"></script>
   <!-- tawk chat JS
      ============================================ -->
</body>


</body>
</html>