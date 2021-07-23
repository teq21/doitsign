<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!-- dropzone CSS
		============================================ -->
<link rel="stylesheet" href="/css/dropzone/dropzone.css">
<!-- summernote CSS
		============================================ -->
<link rel="stylesheet" href="/css/summernote/summernote.css">
<!-- wave CSS
		============================================ -->
<link rel="stylesheet" href="/css/wave/waves.min.css">
<link rel="stylesheet" href="/css/wave/button.css">
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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">

<!-- modernizr JS
		============================================ -->
<script src="/js/vendor/modernizr-2.8.3.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var objDragAndDrop = $(".dragAndDropDiv");

						$(document).on("dragenter", ".dragAndDropDiv",
								function(e) {
									e.stopPropagation();
									e.preventDefault();
									$(this).css('border', '2px solid #0B85A1');
								});
						$(document).on("dragover", ".dragAndDropDiv",
								function(e) {
									e.stopPropagation();
									e.preventDefault();
								});
						$(document).on("drop", ".dragAndDropDiv", function(e) {

							$(this).css('border', '2px dotted #0B85A1');
							e.preventDefault();
							var files = e.originalEvent.dataTransfer.files;

							handleFileUpload(files, objDragAndDrop);
						});

						$(document).on('dragenter', function(e) {
							e.stopPropagation();
							e.preventDefault();
						});
						$(document).on('dragover', function(e) {
							e.stopPropagation();
							e.preventDefault();
							objDragAndDrop.css('border', '2px dotted #0B85A1');
						});
						$(document).on('drop', function(e) {
							e.stopPropagation();
							e.preventDefault();
						});
						//drag 영역 클릭시 파일 선택창
						objDragAndDrop.on('click', function(e) {
							$('input[type=file]').trigger('click');
						});

						$('input[type=file]').on('change', function(e) {
							var files = e.originalEvent.target.files;
							handleFileUpload(files, objDragAndDrop);
						});

						function handleFileUpload(files, obj) {
							for (var i = 0; i < files.length; i++) {
								var fd = new FormData();
								fd.append('file', files[i]);

								var status = new createStatusbar(obj); //Using this we can set progress.
								status.setFileNameSize(files[i].name,
										files[i].size);
								sendFileToServer(fd, status);

							}
						}

						var rowCount = 0;
						function createStatusbar(obj) {

							rowCount++;
							var row = "odd";
							if (rowCount % 2 == 0)
								row = "even";
							this.statusbar = $("<div class='statusbar "+row+"'></div>");
							this.filename = $("<div class='filename'></div>")
									.appendTo(this.statusbar);
							this.size = $("<div class='filesize'></div>")
									.appendTo(this.statusbar);
							this.progressBar = $(
									"<div class='progressBar'><div></div></div>")
									.appendTo(this.statusbar);
							this.abort = $("<div class='abort'>중지</div>")
									.appendTo(this.statusbar);

							obj.after(this.statusbar);

							this.setFileNameSize = function(name, size) {
								var sizeStr = "";
								var sizeKB = size / 1024;
								if (parseInt(sizeKB) > 1024) {
									var sizeMB = sizeKB / 1024;
									sizeStr = sizeMB.toFixed(2) + " MB";
								} else {
									sizeStr = sizeKB.toFixed(2) + " KB";
								}

								this.filename.html(name);
								this.size.html(sizeStr);
							}

							this.setProgress = function(progress) {
								var progressBarWidth = progress
										* this.progressBar.width() / 100;
								this.progressBar.find('div').animate({
									width : progressBarWidth
								}, 10).html(progress + "% ");
								if (parseInt(progress) >= 100) {
									this.abort.hide();
								}
							}

							this.setAbort = function(jqxhr) {
								var sb = this.statusbar;
								this.abort.click(function() {
									jqxhr.abort();
									sb.hide();
								});
							}
						}

						function sendFileToServer(formData, status) {
							var uploadURL = "/fileUpload/post.do"; //Upload URL
							var extraData = {}; //Extra Data.
							var jqXHR = $
									.ajax({
										xhr : function() {
											var xhrobj = $.ajaxSettings.xhr();
											if (xhrobj.upload) {
												xhrobj.upload
														.addEventListener(
																'progress',
																function(event) {
																	var percent = 0;
																	var position = event.loaded
																			|| event.position;
																	var total = event.total;
																	if (event.lengthComputable) {
																		percent = Math
																				.ceil(position
																						/ total
																						* 100);
																	}
																	//Set progress
																	status
																			.setProgress(percent);
																}, false);
											}
											return xhrobj;
										},
										url : uploadURL,
										type : "POST",
										contentType : false,
										processData : false,
										cache : false,
										data : formData,
										success : function(data) {
											status.setProgress(100);

											//$("#status1").append("File upload Done<br>");           
										}
									});

							status.setAbort(jqXHR);
						}
						
					});
	
	
</script>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif
}

;
.view-mail-list {
	width: 940px;
}

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
	float: right;margin-right: 40px;
}

.right1 {
	margin-left: 15px;
}

.tooltips-inner {
	height: 263px;
}

.view-mail-list {
	width: 1140px;
}

/*드래그앤 드롭 쪾 스타일 */
.dragAndDropDiv {
	border: 2px dashed #92AAB0;
	width: 1100px;
	height: 200px;
	color: #92AAB0;
	text-align: center;
	vertical-align: middle;
	padding: 10px 0px 10px 10px;
	font-size: 200%;
	display: table-cell;
	margin-left: 400px; 
}

.progressBar {
	width: 200px;
	height: 22px;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
	display: inline-block;
	margin: 0px 10px 5px 5px;
	vertical-align: top;
}

.progressBar div {
	height: 100%;
	color: #fff;
	text-align: right;
	line-height: 22px;
	/* same as #progressBar height if we want text middle aligned */
	width: 0;
	background-color: #0ba1b5;
	border-radius: 3px;
}

.statusbar {
	border-top: 1px solid #A9CCD1;
	min-height: 25px;
	width: 99%;
	padding: 10px 10px 0px 10px;
	vertical-align: top;
}

.statusbar:nth-child(odd) {
	background: #EBEFF0;
}

.filename {
	display: inline-block;
	vertical-align: top;
	width: 250px;
}

.filesize {
	display: inline-block;
	vertical-align: top;
	color: #30693D;
	width: 100px;
	margin-left: 10px;
	margin-right: 5px;
}

.abort {
	background-color: #A8352F;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	display: inline-block;
	color: #fff;
	font-family: arial;
	font-size: 13px;
	font-weight: normal;
	padding: 4px 15px;
	cursor: pointer;
	vertical-align: top
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
						<div class="row" style="text-align: center;">
							<h2>등 록 하 기</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcomb area End-->
	<!-- Compose email area Start-->
	<div class="inbox-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
					<div class="view-mail-list sm-res-mg-t-30"
						style="border-radius:20px; 1140px; background: #fff; box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05); transition: .3s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .3s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12); ">
						<form action="/study/doStudyForm.do" method="post" enctype="multipart/form-data">
							<div class="view-mail-hd">
								<div class="view-mail-hrd">
									<h2>등록하기</h2>
								</div>
							</div>
							<div class="cmp-int mg-t-20">
								<div class="row">
									<div class="col-lg-1 col-md-2 col-sm-2 col-xs-12">
										<div class="cmp-int-lb cmp-int-lb1 text-right">
											<span>작 성 자 :</span>
										</div>
									</div>
									<div class="col-lg-11 col-md-10 col-sm-10 col-xs-12">
										<div class="form-group">
											<%=user_name%>
											<hr>

										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-1 col-md-2 col-sm-2 col-xs-12">
										<div class="cmp-int-lb cmp-int-lb1 text-right">
											<span>제 목 :</span>
										</div>
									</div>
									<div class="col-lg-11 col-md-10 col-sm-10 col-xs-12">
										<div class="form-group">
											<div class="nk-int-st cmp-int-in cmp-email-over">
												<input type="text" name="post_title" class="form-control"
													placeholder="제목을 입력 하십시오." />
											</div>
										</div>
									</div>
								</div>
								<br>
								<textarea name="post_content" class="form-control" rows="5"
									placeholder="내용을 입력 하십시오."></textarea>
								<br>
								<div id="fileUpload" class="dragAndDropDiv" style=" ">Drag & Drop
									Files Here or Browse Files</div>
								<input type="file" name="file" id="fileUpload"
									style="display: none; width: 100%;"  />
								<div class="vw-ml-action-ls text-right mg-t-20">
									<div class="btn-group ib-btn-gp active-hook nk-email-inbox">
										<button type="submit" style=" float: right;margin-right: 40px;background-color:#00c292;border: 0px;" class="btn btn-success notika-btn-success waves-effect"
											class="btn btn-default btn-sm waves-effect">
											<i class="fas fa-share"> 등록하기</i>
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			</div>
			</div>
			<!-- Compose email area End-->
			<!-- Start Footer area-->
	<div class="footer-copyright-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  style="width:100%">
					<div class="footer-copy-right"  style="width: 100%">
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
</body>

</html>