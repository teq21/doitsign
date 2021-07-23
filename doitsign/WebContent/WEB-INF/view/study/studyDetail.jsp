<%@page import="poly.dto.StudyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="static poly.util.CmmUtil.nvl"%>
<%
	StudyDTO rDTO = (StudyDTO) request.getAttribute("rDTO");
    System.out.print(rDTO.getFile_path());
    System.out.print(rDTO.getReg_dt());
%>
 
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
 *{font-family: 'Noto Sans KR', sans-serif;}

.invoice-wrap {
	padding: 400px;
}

.area_gnb {
	float: right;
}

.white {
	color: white;
	margin-left: 24px;
	font-weight: bold;
}

.right {

	float:right;
	margin-right: 20px;
}

.right1 {
	margin-left: 20px;
}

.tooltips-inner {
	height: 730px;
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
							class="tab-pane in notika-tab-menu-bg animated flipInX"></div>
						<div id="mailbox"
							class="tab-pane notika-tab-menu-bg animated flipInX">
							<ul class="notika-main-menu-dropdown">
								<li><a href="inbox.html"></a></li>
								<li><a onclick="location.href='/signBook/signBookList.do'"
									; style="cursor: pointer;">한글 수화</a></li>
								<li><a onclick="location.href='/EsignBookList.do'"
									; style="cursor: pointer;">영어 수화</a></li>

							</ul>
						</div>
						<div id="Interface"
							class="tab-pane notika-tab-menu-bg animated flipInX"></div>
						<div id="Charts"
							class="tab-pane notika-tab-menu-bg animated flipInX"></div>
						<div id="Tables"
							class="tab-pane active notika-tab-menu-bg animated flipInX">
						</div>
						<div id="Forms"
							class="tab-pane notika-tab-menu-bg animated flipInX"></div>
						<div id="Appviews"
							class="tab-pane notika-tab-menu-bg animated flipInX"></div>
						<div id="Page"
							class="tab-pane notika-tab-menu-bg animated flipInX"></div>
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
					<div class="breadcomb-list"
						style="border-radius:40px;background: #fff; box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05); transition: .3s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .3s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12); ">
						<div class="row" style="text-align: center";>
							<h2>학 습 게 시 판</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcomb area End-->
	<!-- Tooltips area Start-->
	<div class="tooltips-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="tooltips-inner"
						style="border-radius:20px;background: #fff; box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05); transition: .3s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .3s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12); ">
						<div class="tooltips-hd tooltips-hdn">
							
						</div>
						<hr>
						<div class="tooltips-ctn">
							<h3>제목</h3>          
							<span><%=nvl(rDTO.getPost_title())%></span> <span style="float: right;">작성일자:   <%=nvl(rDTO.getReg_dt())%></span>
						</div>
						<hr>
						<div >	
						<h3>VIDEO</h3> 
							<div style="text-align:center;" >
						
								 <iframe src='/user_video/2.mp4?rel=0;apm;autoplay=1'  style="width:495px; height:280px; "> </iframe>
							     
							</div><br>
							<hr>
							<div class="tooltips-ctn">
								<h3>내용</h3>
								<div style="height: 100px; border: 1px solid darkgray;">
									<%=nvl(rDTO.getPost_content())%>
								</div>
							</div>
							<div class="tooltips-static tooltips-cvn">
								<div class="stc-tlt-hd">
									<div class="right">
										
										<span class="right1"><button style="color:white;float: right;margin-right: 40px;background-color:#00c292;border: 0px;"
												onclick="location.href='/study/doDeleteStudyDetail.do?no=<%=rDTO.getPost_no()%>'"
												class="btn btn-default btn-icon-notika waves-effect"><i class="fas fa-share"> 삭제</i></button></span>
												
										<button style=" float: right;margin-right: 40px;background-color:#00c292;border: 0px;color:white;"
											onclick="location.href='/study/editStudyDetail.do?no=<%=rDTO.getPost_no()%>'"
											class="btn btn-default btn-icon-notika waves-effect"><i class="fas fa-share"> 수정</i></button>		
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Tooltips area End-->
		<!-- Start Footer area-->
		<div class="footer-copyright-area" style="width:100%">
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
		<script src="js/plugins.js"></script>
		<!-- main JS
		============================================ -->
		<script src="js/main.js"></script>
		
</body>

</html>