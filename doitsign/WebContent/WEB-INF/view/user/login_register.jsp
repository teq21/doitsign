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
<!-- 새로운 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
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
<!-- wave CSS
		============================================ -->
<link rel="stylesheet" href="/css/wave/waves.min.css">
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
<!-- modernizr JS
		============================================ -->
<script src="/js/vendor/modernizr-2.8.3.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						//이메일 입력값 검증
						$('#email')
								.on(
										'focusout',
										function() {
											console.log($(this).val());
											var email = $('#email').val();
											$
													.ajax({
														type : "POST",
														url : "/user/emailCheck.do",
														headers : {
															"Content-Type" : "application/json",
															"X-HTTP-Method-Override" : "POST"
														},
														data : email,
														datatype : "json",
														success : function(data) {
															console.log(data);
															if (data.confirm === "OK") {
																$('#email_msg')
																		.html(
																				'<i style="color: green"> 사용 가능한 이메일 입니다.</i>');
															} else {
																$('#email_msg')
																		.html(
																				'<i style="color: red" > 이미 사용중인 이메일 입니다.</i>');
															}
														},
														error : function(error) {
															console
																	.log("error : "
																			+ error);
														}
													});
										});

						$("#doLogin").on("click", function() {
							var email = $("#login_email").val();
							var password = $("#login_password").val();

							if (!email) {
								alert("이메일을 입력하세요");
								$("#login_email").focus();
								return false;
							}

							if (!password) {
								alert("비밀번호를 입력하세요");
								$("#login_password").focus();
								return false;
							}

							if (email && password) {
								loginSubmit();
							}

						});
						
						$("#index").on("click", function() {
							var email = $("#login_email").val();
							var password = $("#login_password").val();

							if (!email) {
								alert("이메일을 입력하세요");
								$("#login_email").focus();
								return false;
							}

							if (!password) {
								alert("비밀번호를 입력하세요");
								$("#login_password").focus();
								return false;
							}

							if (email && password) {
								loginSubmit();
							}

						});
						
						

					});

	function loginSubmit() {
		var myJSON = JSON.stringify({
			email : $('#login_email').val(),
			password : $('#login_password').val()
		});
		$.ajax({
			type : "POST",
			url : "/user/getUserLoginCheck.do",
			data : myJSON,
			contentType : "application/json",
			dataType : "json",
			success : function(data) {
				console.log(data);
				if (data.loginResult == 1) {
					window.location.href = "/index.do";
				} else if (data.loginResult == 0) {
					alert("아이디, 비밀번호 불일치");
				} else {
					alert("시스템오류");
				}
			},
			error : function(request, status, error) {
				alert("오류");
			}
		});

	}
	function doRegUserCheck() {

		var email = document.getElementById("email");
		var user_name = document.getElementById('user_name');
		var password = document.getElementById('password');
		if (email.value == "") {
			alert("이메일을 입력 하십시오.");
			email.focus();
			return false;
		}

		if (user_name.value == "") {
			alert("이름을 입력 하십시오.");
			user_name.focus();
			return false;
		}
		if (password.value == "") {
			alert("비밀번호를 입력 하십시오.");
			password.focus();
			return false;
		}
		if (phone.value == "") {
			alert("휴대폰 번호를 입력 하십시오.");
			password.focus();
			return false;
		}
		if (have_sign.value == "") {
			alert("수화 경험 여부를 입력 하십시오.");
			password.focus();
			return false;
		}
		if (email.value != "" && user_name.value != "" && password.value != "" && phone.value != "" && have_sign.value != "") {
			var registerForm = document.registerForm;
			registerForm.submit();
		}
	}

	function doFindPasswordCheck() {

		var email = document.getElementById("find_email");
		var user_name = document.getElementById('find_user_name');
		
		if (email.value == "") {
			alert("이메일을 입력하세요");
			email.focus();
			return false;
		}

		if (user_name.value == "") {
			alert("이름을 입력하세요");
			user_name.focus();
			return false;
		}
		
		if (email.value != "" && user_name.value != "") {
			var findPasswordForm = document.findPasswordForm;
			findPasswordForm.submit();
		}
	}
</script>

<style>
*{font-family: 'Noto Sans KR', sans-serif;}
</style>
</head>

<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- Login Register area Start-->
	<div class="login-content">

		<!-- 로그인 -->
		<div class="nk-block toggled" id="l-login">
			<form name="LoginForm" action="/user/getUserLoginCheck.do"
				method="post">
				<div class="nk-form">
					<h3>로그인</h3>
					<br>
					<div class="input-group">
						<span class="input-group-addon nk-ic-st-pro"><i
							class="far fa-user"></i></span>
						<div class="nk-int-st">
							<input type="text" name="email" id="login_email"
								class="form-control" placeholder="이메일을 입력 하십시오.">
						</div>
					</div>
					<div class="input-group mg-t-15">
						<span class="input-group-addon nk-ic-st-pro"><i
							class="far fa-file-alt"></i></span>  
						<div class="nk-int-st">
							<input type="password" name="password" id="login_password"
								class="form-control" placeholder="비밀번호를 입력 하십시오.">
						</div>
					</div>
					<!-- 로그인 하는 버튼 -->
					<a href="#" data-ma-block="#l-register" id="doLogin"
						class="btn btn-login btn-success btn-float"><i class="fas fa-long-arrow-alt-right"></i></a>
				</div>
			</form>
			<div class="nk-navigation nk-lg-ic">
				<a href="#" data-ma-action="nk-login-switch"
					data-ma-block="#l-register"><i class="fas fa-user-plus"></i> <span>회원가입</span></a> 
				<a
					href="#" data-ma-action="nk-login-switch"
					data-ma-block="#l-forget-password"><i class="fas fa-search"></i> <span>비밀번호
						찾기</span></a>
				<a
					onclick="location.href='/index.do'" data-ma-action="nk-login-switch"
					data-ma-block="#l-register" style="cursor: pointer;"><i class="fas fa-undo-alt"></i><span>메인으로</span></a>
			</div>
		</div>


		<!-- 회원가입 -->
		<div class="nk-block" id="l-register">
			<form name="registerForm" action="/user/register.do" method="post">
				<div class="nk-form">
					<h3>회원가입</h3>
					<br>
					<div class="input-group">
						<span class="input-group-addon nk-ic-st-pro"><i class="far fa-envelope"></i></span>
						<div class="nk-int-st">
							<input type="text" name="email" id="email" class="form-control"
								placeholder="이메일을 입력 하십시오.">
						</div>
						<div id="email_msg"></div>
					</div>
					<div class="input-group mg-t-15">
						<span class="input-group-addon nk-ic-st-pro"><i class="far fa-user"></i></span>
						<div class="nk-int-st">
							<input type="text" name="user_name" id="user_name"
								class="form-control" placeholder="이름을 입력 하십시오.">
						</div>
					</div>
					<div class="input-group mg-t-15">
						<span class="input-group-addon nk-ic-st-pro"><i class="fas fa-pencil-alt"></i></span>
						<div class="nk-int-st">
							<input type="password" name="password" id="password"
								class="form-control" placeholder="비밀번호를 입력 하십시오.">
						</div>
					</div>
					<div class="input-group mg-t-15">
						<span class="input-group-addon nk-ic-st-pro"><i class="fas fa-pencil-alt"></i></span>
						<!-- 비멀번호 재입력 검증하는 div 이지만 제대로 작동하지 않는 것 같음. -->
						<div class="nk-int-st">
							<input type="password" data-match="#password" data-match-error="비밀번호가 일치하지 않습니다." 
								class="form-control" placeholder="비밀번호를 한 번 더 입력해 주십시오." data-error=" " required>
						</div>
					</div>
					<div class="input-group mg-t-15">
						<span class="input-group-addon nk-ic-st-pro"><i class="fas fa-phone"></i></span>
						<div class="nk-int-st">
							<input type="text" name="phone" id="phone"
								class="form-control" placeholder="휴대폰 번호를 입력 하십시오.">
						</div>
					</div>
					<div class="input-group mg-t-15">
						<span class="input-group-addon nk-ic-st-pro"><i class="far fa-check-circle"></i></span>
						<div class="nk-int-st">
							<input type="text" name="have_sign" id="have_sign"
								class="form-control" placeholder="수화 경험 여부 : 있음 또는 없음으로 입력 하십시오.">
						</div>
					</div>
					<a href="#l-login" data-ma-action="nk-login-switch"
						onclick="doRegUserCheck()" data-ma-block="#l-login"
						class="btn btn-login btn-success btn-float"><i
						class="fas fa-long-arrow-alt-right"></i></a>
				</div>
			</form>
			<div class="nk-navigation rg-ic-stl">
				<a href="#" data-ma-action="nk-login-switch"
					data-ma-block="#l-forget-password"><i
					class="fas fa-search"></i> <span>비밀번호 찾기</span></a> <a
					href="#l-login" data-ma-action="nk-login-switch"
					data-ma-block="#l-login"><i
					class="fas fa-undo-alt"></i> <span>돌아가기</span></a>

			</div>
		</div>


		<!-- 비밀번호 찾기 -->
		<div class="nk-block" id="l-forget-password">
			<form name="findPasswordForm" action="/user/findPasswordProc.do"
				method="post">
				<div class="nk-form">
					<h3>비밀번호 찾기</h3>
					<br>
					<p class="text-left">회원가입 당시 등록하셨던 이름과 이메일을 입력 하십시오.</p>
					<br>
					<div class="input-group mg-t-15">
						<span class="input-group-addon nk-ic-st-pro"><i
							class="far fa-envelope"></i></span>
						<div class="nk-int-st">
							<input type="text" name="email2" id="find_email"
								class="form-control" placeholder="이메일을 입력 하십시오.">
						</div>
					</div>
					<div class="input-group mg-t-15">
						<span class="input-group-addon nk-ic-st-pro"><i
							class="far fa-user"></i></span>
						<div class="nk-int-st">
							<input type="text" name="user_name2" id="find_user_name"
								class="form-control" placeholder="이름을 입력 하십시오.">
						</div>
					</div>
					<a href="#l-login" data-ma-action="nk-login-switch"
						onclick="doFindPasswordCheck()" data-ma-block="#l-login"
						class="btn btn-login btn-success btn-float">찾기</a>
				</div>
			</form>
			<div class="nk-navigation nk-lg-ic rg-ic-stl">
				<a href="#l-login" data-ma-action="nk-login-switch"
					data-ma-block="#l-login"><i
					class="fas fa-undo-alt"></i> <span>돌아가기</span></a>
			</div>
		</div>
	</div>
	<!-- Login Register area End-->

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
	<!--  wave JS
		============================================ -->
	<script src="/js/wave/waves.min.js"></script>
	<script src="/js/wave/wave-active.js"></script>
	<!-- icheck JS
		============================================ -->
	<script src="/js/icheck/icheck.min.js"></script>
	<script src="/js/icheck/icheck-active.js"></script>
	<!--  todo JS
		============================================ -->
	<script src="/js/todo/jquery.todo.js"></script>
	<!-- Login JS
		============================================ -->
	<script src="/js/login/login-action.js"></script>
	<!-- plugins JS
		============================================ -->
	<script src="/js/plugins.js"></script>
	<!-- main JS
		============================================ -->
	<script src="/js/main.js"></script>
</body>
</html>