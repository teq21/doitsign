<%@ page import="poly.dto.NoticeDTO"%>
<%@page import="poly.util.Pagination_other"%>
<%@page import="static poly.util.CmmUtil.nvl"%>
<%@page import="java.util.List"%>
<%@ include file="./session.jsp"%>
<%
	List<NoticeDTO> rList = (List<NoticeDTO>)request.getAttribute("rList");
	String pageName = "noticeList";
	Pagination_other pg = (Pagination_other) request.getAttribute("pg");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="ko">

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
	href="/css/scrollbar/jquery.mCustomScrollbar.min.css">
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
<!-- modernizr JS
		============================================ -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<script src="js/vendor/modernizr-2.8.3.min.js"></script>
<script type="text/javascript">
	
</script>

<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

.white {
	color: white;
	margin-left: 24px;
	font-weight: bold;
}
</style>
</head>

<body>
	<!-- ??????, ?????? ????????? ?????? ?????? ?????? ?????? -->
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
					<b class="white"><%=user_name%>???, ???????????????!</b> <a
						href="user/logout.do" class="white">????????????</a> <b class="white">
						| </b> <a href="/user/myPage.do" class="white"> ???????????????</a>
					<%
						} else {
					%>
					<a href="/user/login_register.do" class="white"> ????????? </a> <b
						class="white"> | </b> <a href="/user/myPage.do" class="white">
						???????????????</a>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
	<!-- ??????, ?????? ????????? ?????? ?????? ?????? ??? -->


	<!--?????????????????? ?????? (????????? main menu area ???)  -->
	<div class="main-menu-area mg-tb-40" id="ksb">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<ul class="nav nav-tabs notika-menu-wrap menu-it-icon-pro" id="x">
						<li><a data-toggle="tab" onclick="location.href='/index.do'"
							; style="cursor: pointer;"><i class="fas fa-home"
								style="font-weight: 1000;"></i> Home</a></li>
						<li><a data-toggle="tab" href="#mailbox"><i
								class="fas fa-search" style="font-weight: 1000;"></i> ????????????</a></li>
						<li><a data-toggle="tab" onclick="location.href='/quiz.do'"
							; style="cursor: pointer;"><i class="fas fa-sign-language"
								style="font-weight: 1000;"></i> ????????????</a></li>
						<li><a data-toggle="tab"
							onclick="location.href='/study/studyList.do'"
							; style="cursor: pointer;"><i class="far fa-list-alt"
								style="font-weight: 1000;"></i> ???????????????</a></li>
						<li class="active"><a data-toggle="tab"
							onclick="location.href='/map.do'" ; style="cursor: pointer;"><i
								class="fa fa-map" style="font-weight: 1000;"></i> ???</a></li>
						<li><a data-toggle="tab"
							onclick="location.href='/notice/noticeList.do'"
							; style="cursor: pointer;"><i class="far fa-clipboard"
								style="font-weight: 1000;"></i>????????????</a></li>

					</ul>
					<div class="tab-content custom-menu-content">
						<div id="Home"
							class="tab-pane in notika-tab-menu-bg animated flipInX"></div>
						<div id="mailbox"
							class="tab-pane notika-tab-menu-bg animated flipInX">
							<ul class="notika-main-menu-dropdown">
								<li><a href="inbox.html"></a></li>
								<li><a onclick="location.href='/signBook/signBookList.do'"
									; style="cursor: pointer;">?????? ??????</a></li>
								<li><a onclick="location.href='/EsignBookList.do'"
									; style="cursor: pointer;">?????? ??????</a></li>

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
	<!--?????????????????? ??? (????????? main menu area ???)  -->


	<!-- Breadcomb area Start-->
	<div class="breadcomb-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="breadcomb-list"
						style="background: #fff; box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05); transition: .3s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .3s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12); border-radius: 40px;">
						<div class="row" style="text-align: center;">
							<h2>??? ??? ??? ???</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- Breadcomb area End-->

	<!-- ????????? ????????? ?????? ?????? -->
	<div class="normal-table-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="normal-table-list"
						style="background: #fff; box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05); transition: .3s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .3s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12); padding-bottom: 40px; border-radius: 20px;">
						<div class="bsc-tbl">
							<table class="table table-sc-ex">
								<thead>
									<tr>
										<th>??????</th>
										<th>??????</th>
										<th>?????????</th>
										<th>?????????</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (NoticeDTO e : rList) {
									%>
									<tr>
										<td><%=nvl(e.getPost_no())%></td>
										<td><a
											href="/notice/noticeDetail.do?no=<%=e.getPost_no()%>"><%=nvl(e.getPost_title())%></a></td>
										<td><%=nvl(e.getReg_id())%></td>
										<td><%=nvl(e.getReg_dt())%></td>

									</tr>
									<%
										}
									%>

								</tbody>
							</table>
						</div>
						<%
								if (rList.size() == 0) {
							%>
							<div>???????????? ????????????.</div>
							<%
								} else {
							%>
							<%@include file="/WEB-INF/view/Pagination_other.jsp"%>
							<%
								}
							%>
						<%if(user_type.equals("2")) {%>
						<div style="float: right;">
							<input type="button" value="??????">
						</div>
						<%} %>
					</div>
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
						<p>Copyright ?? 2020 . All rights reserved. Template by
							Colorlib. Team FOMARD.</p>
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