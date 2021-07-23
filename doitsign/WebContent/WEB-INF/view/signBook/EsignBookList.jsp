<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="./session.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Do IT Sign</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon
		============================================ -->
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.ico">
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
<!-- mCustomScrollbar CSS
		============================================ -->
<link rel="stylesheet"
	href="/css/scrollbar/jquery.mCustomScrollbar.min.css">
<!-- jvectormap CSS
		============================================ -->
<link rel="stylesheet"
	href="/css/jvectormap/jquery-jvectormap-2.0.3.css">
<!-- Notika icon CSS
		============================================ -->
<link rel="stylesheet" href="../css/notika-custom-icon.css">
<!-- wave CSS
		============================================ -->
<link rel="stylesheet" href="/css/wave/waves.min.css">
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
<script src="js/vendor/modernizr-2.8.3.min.js"></script>

<style>

 .white {
   color: white;
   margin-left: 24px;
   font-weight: bold;
}

 *{font-family: 'Noto Sans KR', sans-serif;}
 
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

.tooltips-inner {
	height: 756px;
}

.bot{
     margin-top:20px;
     height:450px;
}

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
#what2Say {
  font-size: 4vw;
  position: absolute;
  left: 57%;
  transform: translate(-50%);
  text-align: center;
  z-index: 50;
  border-radius: 5px;
  padding: 2px;
  margin: 2px;
  height:100px;
}

.asl {
  top: 50%;
  left: 57%;
  position: absolute;
  transform: translate(-50%, -50%);
  height: 10vw;
}
#spelledOut {
  top: 0px;
  left: 0px;
  position: absolute;
  height: 756px;
  width: 180px;
  margin: 0 auto;
  overflow-x: hidden;
  border: 1px solid #00c292;
  border-radius : 20px;
  background-color: #00c292;
}
.asl2 {
  top: 5vw;
  left: 50%;
  position: relative;
  margin-bottom: -8vw;
  display: inline-block;
  transform: translate(-50%, -50%) scale(0.3);
}
.asl3 {
  top: 5vw;
  left: 50%;
  position: relative;
  margin-bottom: -8vw;
  display: inline-block;
  transform: translate(-50%, -26%) scale(0.3);
}
.asl4 {
  top: 5vw;
  left: 50%;
  position: relative;
  margin-bottom: 2vw;
  display: inline-block;
  transform: translate(-50%, -26%) scale(0.3);
}
.asl-a::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Sign_language_A.svg/323px-Sign_language_A.svg.png);
  background-size: 100%;
  display: block;
  width: 15vw;
  height: 20vw;
  content: "";
}
.asl-b::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Sign_language_B.svg/198px-Sign_language_B.svg.png);
  background-size: 100%;
  display: block;
  width: 14vw;
  height: 31vw;
  transform: translate(-8%, -35%);
  content: "";
}

.asl-c::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Sign_language_C.svg/416px-Sign_language_C.svg.png);
  background-size: 100%;
  display: block;
  width: 20vw;
  height: 20vw;
  transform: translate(0%, 0%);
  content: "";
}
.asl-d::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Sign_language_D.svg/242px-Sign_language_D.svg.png);
  background-size: 100%;
  display: block;
  width: 14vw;
  height: 27vw;
  transform: translate(-4%, -30%);
  content: "";
}
.asl-e::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Sign_language_E.svg/286px-Sign_language_E.svg.png);
  background-size: 100%;
  display: block;
  width: 14vw;
  height: 22vw;
  transform: translate(-5%, -10%);
  content: "";
}
.asl-f::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Sign_language_F.svg/244px-Sign_language_F.svg.png);
  background-size: 100%;
  display: block;
  width: 14vw;
  height: 28vw;
  transform: translate(-1%, -31%);
  content: "";
}
.asl-g::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Sign_language_G.svg/491px-Sign_language_G.svg.png);
  background-size: 100%;
  display: block;
  width: 28vw;
  height: 13vw;
  transform: translate(-5%, 10%);
  content: "";
}
.asl-h::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Sign_language_H.svg/504px-Sign_language_H.svg.png);
  background-size: 100%;
  display: block;
  width: 28vw;
  height: 13vw;
  transform: translate(-5%, 10%);
  content: "";
}
.asl-i::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Sign_language_I.svg/286px-Sign_language_I.svg.png);
  background-size: 100%;
  display: block;
  width: 14vw;
  height: 24vw;
  transform: translate(-2%, -20%);
  content: "";
}
.asl-j::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Sign_language_J.svg/466px-Sign_language_J.svg.png);
  background-size: 100%;
  display: block;
  width: 22vw;
  height: 21vw;
  transform: translate(-10%, 0%);
  content: "";
}
.asl-k::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Sign_language_K.svg/283px-Sign_language_K.svg.png);
  background-size: 100%;
  display: block;
  width: 14vw;
  height: 25vw;
  transform: translate(-7%, -28%);
  content: "";
}
.asl-l::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Sign_language_L.svg/387px-Sign_language_L.svg.png);
  background-size: 100%;
  display: block;
  width: 19vw;
  height: 25vw;
  transform: translate(10%, -26%);
  content: "";
}
.asl-m::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Sign_language_M.svg/310px-Sign_language_M.svg.png);
  background-size: 100%;
  display: block;
  width: 14vw;
  height: 21vw;
  transform: translate(-7%, -4%);
  content: "";
}
.asl-n::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Sign_language_N.svg/305px-Sign_language_N.svg.png);
  background-size: 100%;
  display: block;
  width: 14vw;
  height: 21vw;
  transform: translate(-7%, -8%);
  content: "";
}
.asl-o::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Sign_language_O.svg/353px-Sign_language_O.svg.png);
  background-size: 100%;
  display: block;
  width: 16vw;
  height: 20vw;
  transform: translate(0%, -6%);
  content: "";
}
.asl-p::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Sign_language_P.svg/530px-Sign_language_P.svg.png);
  background-size: 100%;
  display: block;
  width: 26vw;
  height: 16vw;
  transform: translate(-10%, 20%);
  content: "";
}
.asl-q::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Sign_language_Q.svg/384px-Sign_language_Q.svg.png);
  background-size: 100%;
  display: block;
  width: 16vw;
  height: 20vw;
  transform: translate(0%, 0%);
  content: "";
}
.asl-r::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Sign_language_R.svg/233px-Sign_language_R.svg.png);
  background-size: 100%;
  display: block;
  width: 14vw;
  height: 29vw;
  transform: translate(-5%, -31%);
  content: "";
}
.asl-s::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Sign_language_S.svg/336px-Sign_language_S.svg.png);
  background-size: 100%;
  display: block;
  width: 15vw;
  height: 20vw;
  transform: translate(0%, 0%);
  content: "";
}
.asl-t::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/Sign_language_T.svg/341px-Sign_language_T.svg.png);
  background-size: 100%;
  display: block;
  width: 15vw;
  height: 20vw;
  transform: translate(0%, 0%);
  content: "";
}
.asl-u::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Sign_language_U.svg/246px-Sign_language_U.svg.png);
  background-size: 100%;
  display: block;
  width: 14vw;
  height: 30vw;
  transform: translate(-10%, -36%);
  content: "";
}
.asl-v::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Sign_language_V.svg/249px-Sign_language_V.svg.png);
  background-size: 100%;
  display: block;
  width: 14vw;
  height: 28vw;
  transform: translate(-10%, -36%);
  content: "";
}
.asl-w::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Sign_language_W.svg/280px-Sign_language_W.svg.png);
  background-size: 100%;
  display: block;
  width: 14vw;
  height: 27vw;
  transform: translate(1%, -33%);
  content: "";
}
.asl-x::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Sign_language_X.svg/362px-Sign_language_X.svg.png);
  background-size: 100%;
  display: block;
  width: 15vw;
  height: 22vw;
  transform: translate(-8%, -14%);
  content: "";
}
.asl-y::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Sign_language_Y.svg/517px-Sign_language_Y.svg.png);
  background-size: 100%;
  display: block;
  width: 23vw;
  height: 19vw;
  transform: translate(0%, 0%);
  content: "";
}
.asl-z::before {
  background-image: url(https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Sign_language_Z.svg/368px-Sign_language_Z.svg.png);
  background-size: 100%;
  display: block;
  width: 20vw;
  height: 31vw;
  transform: translate(-20%, -36%);
  content: "";
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
    border-radius: 40px 40px 40px 40px;  ">
						
						<div style="text-align: center;">
  <div class="overflow">
    <h3 style="color:#00c292; margin-left:300px;" >영어사전 </h3>
    <div id="text-animate">
      <h3>영어단어를 입력해서</h3>
      <h3></h3>
      <h3>이미지로 수화를 배워봐요</h3>
    </div>
  </div>
</div>
						
						
					</div>
			</div>
		</div>
	</div>
	<!-- Breadcomb area End-->

	<!-- Map area Start-->
	<div class="tooltips-area " >
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="
background: #fff;
box-shadow: 0 6px 10px rgba(0,0,0,.08), 0 0 6px rgba(0,0,0,.05);
transition: .3s transform cubic-bezier(.155,1.105,.295,1.12),.3s box-shadow,.3s -webkit-transform cubic-bezier(.155,1.105,.295,1.12);
border-radius: 20px;">
					<div class="tooltips-inner" >
					<input  type="text" id="what2Say" title="Type in here and the Sign Language spelling will appear below" placeholder="Type here..." onchange="words2Faces(this.value)">

<div>
<div id="aslContainer" title="ASL" class="asl asl-a"></div>
  <!--<div id="templateFist" class="asl asl-a"></div>-->
</div>
<div id="spelledOut"></div>
					
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Map area End-->

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
	<!-- summernote JS
		============================================ -->
	<script src="/js/summernote/summernote-updated.min.js"></script>
	<script src="/js/summernote/summernote-active.js"></script>
	<!-- dropzone JS
		============================================ -->
	<script src="/js/dropzone/dropzone.js"></script>
	<!--  wave JS
		============================================ -->
	<script src="/js/wave/waves.min.js"></script>
	<script src="/js/wave/wave-active.js"></script>
	<!-- icheck JS
		============================================ -->
	<script src="/js/icheck/icheck.min.js"></script>
	<script src="/js/icheck/icheck-active.js"></script>
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
<script>
var animationSpeed = 400;

function words2Faces(userText) {
  var userTextL = userText.toLowerCase();
  //strip punctuation
  var punc = /[ï¿½`~\"\/'_\-[\]{}()*+!?%&.,\\^$|#@<>|+=;:\u2018\u2019\u201C\u201D]/g;
  var noPunc = userTextL.replace(punc, "");
  var words = noPunc.split("");

  //remove all spaces
  for (var i = 0; i < words.length; i++) {
    if (words[i] === " ") {
      words.splice(i, 1);
    } else if (words.indexOf(words[i]) == words.length) {
      return false;
    }
  }

  var allofEm = words;

  //replace all phonemes with their class names
  for (var i = 0; i < allofEm.length; i++) {
    if (allofEm[i] == "a") {
      allofEm[i] = "asl-a";
    } else if (allofEm[i] == "b") {
      allofEm[i] = "asl-b";
    } else if (allofEm[i] == "c") {
      allofEm[i] = "asl-c";
    } else if (allofEm[i] == "d") {
      allofEm[i] = "asl-d";
    } else if (allofEm[i] == "e") {
      allofEm[i] = "asl-e";
    } else if (allofEm[i] == "f") {
      allofEm[i] = "asl-f";
    } else if (allofEm[i] == "g") {
      allofEm[i] = "asl-g";
    } else if (allofEm[i] == "h") {
      allofEm[i] = "asl-h";
    } else if (allofEm[i] == "i") {
      allofEm[i] = "asl-i";
    } else if (allofEm[i] == "j") {
      allofEm[i] = "asl-j";
    } else if (allofEm[i] == "k") {
      allofEm[i] = "asl-k";
    } else if (allofEm[i] == "l") {
      allofEm[i] = "asl-l";
    } else if (allofEm[i] == "m") {
      allofEm[i] = "asl-m";
    } else if (allofEm[i] == "n") {
      allofEm[i] = "asl-n";
    } else if (allofEm[i] == "o") {
      allofEm[i] = "asl-o";
    } else if (allofEm[i] == "p") {
      allofEm[i] = "asl-p";
    } else if (allofEm[i] == "q") {
      allofEm[i] = "asl-q";
    } else if (allofEm[i] == "r") {
      allofEm[i] = "asl-r";
    } else if (allofEm[i] == "s") {
      allofEm[i] = "asl-s";
    } else if (allofEm[i] == "t") {
      allofEm[i] = "asl-t";
    } else if (allofEm[i] == "u") {
      allofEm[i] = "asl-u";
    } else if (allofEm[i] == "v") {
      allofEm[i] = "asl-v";
    } else if (allofEm[i] == "w") {
      allofEm[i] = "asl-w";
    } else if (allofEm[i] == "x") {
      allofEm[i] = "asl-x";
    } else if (allofEm[i] == "y") {
      allofEm[i] = "asl-y";
    } else if (allofEm[i] == "z") {
      allofEm[i] = "asl-z";
    }
  }

  //add a rest face at the end
  //allofEm.push("rest");

  //this function spits out an array of class names coresponding to the animation face of each phoneme when called
  return allofEm;
} //END

var userInput = document.getElementById("what2Say").value;

var classArray = [];

function loopEm(putMeHere) {
  classArray = [];
  //var classArray = ["asl-a","asl-b","asl-c","asl-d","asl-e","asl-f","asl-g","asl-h","asl-i","asl-j","asl-k","asl-l","asl-m","asl-n","asl-o","asl-p","asl-q","asl-r","asl-s","asl-t","asl-u","asl-v","asl-w","asl-x","asl-y","asl-z"];
  var userText2 = document.getElementById("what2Say").value;
  classArray = words2Faces(userText2);
  var cal = classArray.length;
  //creates a variable to be incremented
  var classChanges = 0;
  (function nextClass() {
    setTimeout(function () {
      //don't rearrange until after the first one is displayed
      if (classChanges != 0) {
        //removes the first array item and pushes it to the end of the array
        classArray.push(classArray.shift());
      }
      //removes all classes and adds whichever class is in the current 0 spot
      var c = document.getElementById(putMeHere);
      c.className = "asl";
      c.classList.add(classArray[0]);
      //increments the variable
      classChanges++;
      if (classChanges < classArray.length + 1) {
        //runs the parent function again after a timeout setting
        nextClass();
      } else {
        //once the classChanges variable gets to the length of the classArray, clear all classes, stay on last letter and stop.
        c.className = "";
        c.classList.add("asl");
        c.classList.add(classArray[classArray.length - 1]); //stay on last letter
        return false;
      }
    }, animationSpeed); // delay
  })();

  document.getElementById("spelledOut").innerHTML = "";

  //create boxes in the side area
  for (var i = 0; i < classArray.length; i++) {
    if (
      classArray[i] === "asl-u" ||
      classArray[i] === "asl-w" ||
      classArray[i] === "asl-r" ||
      classArray[i] === "asl-k" ||
      classArray[i] === "asl-z" ||
      classArray[i] === "asl-v" ||
      classArray[i] === "asl-b" ||
      classArray[i] === "asl-f" ||
      classArray[i] === "asl-d"
    ) {
      document.getElementById("spelledOut").innerHTML +=
        "<span class='asl3 " +
        classArray[i] +
        "' title='" +
        classArray[i].charAt(4) +
        "'></span><br/>";
    } else if (classArray[i] === "asl-g" || classArray[i] === "asl-h") {
      document.getElementById("spelledOut").innerHTML +=
        "<span class='asl4 " +
        classArray[i] +
        "' title='" +
        classArray[i].charAt(4) +
        "'></span><br/>";
    } else {
      document.getElementById("spelledOut").innerHTML +=
        "<span class='asl2 " +
        classArray[i] +
        "' title='" +
        classArray[i].charAt(4) +
        "'></span><br/>";
    }
  }
}

function aslContainer() {
  loopEm("aslContainer");
}
//link function to clicks on the body or pushing ENTER
document.getElementById("aslContainer").addEventListener("click", aslContainer);
document.addEventListener("keydown", keyDownHandler, false);
function keyDownHandler(e) {
  if (e.keyCode == 13) {
    loopEm("aslContainer");
  }
}
</script>
</html>