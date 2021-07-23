<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="poly.dto.QuizDTO"%>
<%@ include file="./session.jsp"%>


<%
	QuizDTO rDTO = (QuizDTO) request.getAttribute("rDTO");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
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
<!-- Bootstrap CSS
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
<!-- notika icon CSS
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
<link rel="stylesheet" href="/css/timer.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<!-- modernizr JS
      ============================================ -->
<script src="js/vendor/modernizr-2.8.3.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script
	src="https://github.com/nagix/chartjs-plugin-streaming/releases/download/v1.5.0/chartjs-plugin-streaming.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@teachablemachine/pose@0.8/dist/teachablemachine-pose.min.js"></script>
<script type="text/javascript" src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script type="text/javascript" src="https://www.amcharts.com/lib/3/gauge.js"></script>
<script type="text/javascript" src="https://www.amcharts.com/lib/3/themes/none.js"></script>
<script src="/js/timer.js"></script>	
<script type="text/javascript">

//===================================================
//documet get ready 
//===================================================
  $( document ).ready( function() {
   init();   
    $ ('.last').hide();  
     $ ('.div1').hide();
   $ ('.div2').hide();
    $ ('.div3').hide(); 
    $ ('#myChart').hide();
   $ ('#cha').hide(); 
   timer.start(6);
});  
  
 

  let model, webcam, ctx, labelContainer, maxPredictions;

  const URL= "<%=rDTO.getTm_path()%>";

async function init() {
   
   
   
  const modelURL = URL + "model.json";
  const metadataURL = URL + "metadata.json";

  // load the model and metadata
  // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
  // Note: the pose library adds a tmPose object to your window (window.tmPose)
  model = await tmPose.load(modelURL, metadataURL);
  maxPredictions = model.getTotalClasses();

  // Convenience function to setup a webcam
  const size = 400;
  const flip = true; // whether to flip the webcam
  webcam = new tmPose.Webcam(400, size, flip); // width, height, flip
  await webcam.setup(); // request access to the webcam
  await webcam.play();
  window.requestAnimationFrame(loop);

  // append/get elements to the DOM
  const canvas = document.getElementById("canvas");
  canvas.width = 400; canvas.height = size;
  ctx = canvas.getContext("2d");
  labelContainer = document.getElementById("label-container");
  for (let i = 0; i < maxPredictions; i++) { // and class labels
      labelContainer.appendChild(document.createElement("div"));
  }
}

async function loop(timestamp) {
  webcam.update(); // update the webcam frame
  await predict();
  window.requestAnimationFrame(loop);
}
async function predict() {
  // Prediction #1: run input through posenet
  // estimatePose can take in an image, video or canvas html element
  const { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
  // Prediction 2: run input through teachable machine classification model
 const prediction = await model.predict(posenetOutput);
  // finally draw the poses
  drawPose(pose);
}

async function getPredictValue1() {
  // Prediction #1: run input through posenet
  // estimatePose can take in an image, video or canvas html element
  const { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
  // Prediction 2: run input through teachable machine classification model
  const prediction = await model.predict(posenetOutput);
  var test = prediction[0].probability.toFixed(2);
  return test;
}

async function getPredictValue2() {
  // Prediction #1: run input through posenet
  // estimatePose can take in an image, video or canvas html element
  const { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
  // Prediction 2: run input through teachable machine classification model
  const prediction = await model.predict(posenetOutput);
  var test = prediction[1].probability.toFixed(2);
  return test;
}

async function getPredictValue3() {
     // Prediction #1: run input through posenet
     // estimatePose can take in an image, video or canvas html element
     const { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
     // Prediction 2: run input through teachable machine classification model
     const prediction = await model.predict(posenetOutput);
     var test = prediction[2].probability.toFixed(2);
     return test;
   }
function drawPose(pose) {
  if (webcam.canvas) {
      ctx.drawImage(webcam.canvas, 0, 0);
      // draw the keypoints and skeleton
      if (pose) {
          const minPartConfidence = 0.5;
          tmPose.drawKeypoints(pose.keypoints, minPartConfidence, ctx);
          tmPose.drawSkeleton(pose.keypoints, minPartConfidence, ctx);
      }
  }
}


// 게이지 그리는곳
var gaugeChart = AmCharts.makeChart("chartdiv", {
	
	"type": "gauge",
"theme": "none",    
    "axes": [{
    	
        "axisThickness":1,
         "axisAlpha":0.2,
         "tickAlpha":0.2,
         "valueInterval":10,
        "bands": [{
            "color": " #7DF0D4",
            "endValue":30,
            "innerRadius": "70%",
            "startValue": 0,
           
       
        }, {
            "color": "#00C292",
            "endValue": 70,
            "innerRadius": "70%",
            "startValue": 30
        }, {
            "color": "#00694F", 
            "endValue": 100,
            "innerRadius": "70%",
            "startValue": 70
        }],
        "bottomText": "0 km/h",
        "bottomTextYOffset": -20,
        "endValue": 100
    }],
    "arrows": [{}]
});

setInterval(randomValue, 700);

 // set random value
async function randomValue() {
	 const a= await getPredictValue1();
    var value = a*100;
    if(a==1.00){
        await $ ('.div1').show();
        
     }

  if(gaugeChart){
    if(gaugeChart.arrows){
      if(gaugeChart.arrows[0]){
        if(gaugeChart.arrows[0].setValue){
          gaugeChart.arrows[0].setValue(value);
          gaugeChart.axes[0].setBottomText(value + " %");
        }
      }
    }
  }
}
/*-------------------------------------1번끝----------------------------------------------  */
var bchart = AmCharts.makeChart("chartdiv2", {
	
	"type": "gauge",
"theme": "none",    
    "axes": [{
    	
        "axisThickness":1,
         "axisAlpha":0.2,
         "tickAlpha":0.2,
         "valueInterval":10,
        "bands": [{
            "color": " #7DF0D4 ",
            "endValue":30,
            "innerRadius": "70%",
            "startValue": 0,
           
       
        }, {
            "color": "#00C292",
            "endValue": 70,
            "innerRadius": "70%",
            "startValue": 30
        }, {
            "color": "#00694F",
            "endValue": 100,
            "innerRadius": "70%",
            "startValue": 70
        }],
        "bottomText": "0 km/h",
        "bottomTextYOffset": -20,
        "endValue": 100
    }],
    "arrows": [{}]
});

setInterval(randomValue2, 700);

 // set random value
async function randomValue2() {
	 const b= await getPredictValue2();
    var value = b*100;
    if(b==1.00){
        await $ ('.div2').show();
        
     }
  if( bchart){
    if( bchart.arrows){
      if( bchart.arrows[0]){
        if( bchart.arrows[0].setValue){
        	 bchart.arrows[0].setValue(value);
        	 bchart.axes[0].setBottomText(value + "%");
        }
      }
    }
  }
}

/* ------------------2번끝--------------------- */
var cchart = AmCharts.makeChart("chartdiv3", {
	
	"type": "gauge",
"theme": "none",    
    "axes": [{
    	
        "axisThickness":1,
         "axisAlpha":0.2,
         "tickAlpha":0.2,
         "valueInterval":10,
        "bands": [{
            "color": " #7DF0D4 ",
            "endValue":30,
            "innerRadius": "70%",
            "startValue": 0,
           
       
        }, {
            "color": "#00C292",
            "endValue": 70,
            "innerRadius": "70%",
            "startValue": 30
        }, {
            "color": "#00694F",
            "endValue": 100,
            "innerRadius": "70%",
            "startValue": 70
        }],
        "bottomText": "0 km/h",
        "bottomTextYOffset": -20,
        "endValue": 100
    }],
    "arrows": [{}] 
});

setInterval(randomValue3,700);

 // set random value
async function randomValue3() {
	 const c= await getPredictValue3();
    var value = c*100;
    if(c==1.00){
        await $ ('.div3').show();
        await $ ('#cha').show();
     }
  if( cchart){
    if( cchart.arrows){
      if( cchart.arrows[0]){
        if( cchart.arrows[0].setValue){
        	cchart.arrows[0].setValue(value);
        	cchart.axes[0].setBottomText(value + "%");
        }
      }
    }
  }
}
var timer = new Timer({
    tick : 1,
    ontick : function (sec) {
    	 /*   console.log('interval', sec); */
    },
    onstart : function() {
    	  /* console.log('timer started'); */
    }
});
//defining options using on
 timer.on('end', function () {
	  console.log('timer ended');
	    this.start(4).off('end');
	    $ ('.last').show();
	    $ ('.timer').hide();
	    AmCharts.makeChart("chartdiv3"); 
});

 
 

</script>

<style>
.white {
   color: white;
   margin-left: 24px;
   font-weight: bold;
}
#chartdiv {
width: 33.3%;
height: 200px;
}
#chartdiv2 {
width: 33.3%;
height: 200px;
}
#chartdiv3 {
width: 33.3%;
height: 200px;
}
 *{font-family: 'Noto Sans KR', sans-serif};
.white {
	color: white;
	margin-left: 24px;
	font-weight: bold;
}

.dummy-positioning {
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
}

.success-icon {
	display: inline-block;
	width: 4em;
	height: 4em;
	font-size: 20px;
	border-radius: 50%;
	border: 4px solid #96df8f;
	background-color: #fff;
	position: relative;
	overflow: hidden;
	-webkit-transform-origin: center;
	transform-origin: center;
	-webkit-animation: showSuccess 180ms ease-in-out;
	animation: showSuccess 180ms ease-in-out;
	-webkit-transform: scale(1);
	transform: scale(1);
}

.success-icon__tip, .success-icon__long {
	display: block;
	position: absolute;
	height: 4px;
	background-color: #96df8f;
	border-radius: 10px;
}

.success-icon__tip {
	width: 2.4em;
	top: 2.15em;
	left: 1.4em;
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
	-webkit-animation: tipInPlace 300ms ease-in-out;
	animation: tipInPlace 300ms ease-in-out;
	-webkit-animation-fill-mode: forwards;
	animation-fill-mode: forwards;
	-webkit-animation-delay: 180ms;
	animation-delay: 180ms;
	visibility: hidden;
}

.success-icon__long {
	width: 4em;
	-webkit-transform: rotate(-45deg);
	transform: rotate(-45deg);
	top: 1.85em;
	left: 2.75em;
	-webkit-animation: longInPlace 140ms ease-in-out;
	animation: longInPlace 140ms ease-in-out;
	-webkit-animation-fill-mode: forwards;
	animation-fill-mode: forwards;
	visibility: hidden;
	-webkit-animation-delay: 440ms;
	animation-delay: 440ms;
}

@
-webkit-keyframes showSuccess {from { -webkit-transform:scale(0);
	transform: scale(0);
}

to {
	-webkit-transform: scale(1);
	transform: scale(1);
}

}
@
keyframes showSuccess {from { -webkit-transform:scale(0);
	transform: scale(0);
}

to {
	-webkit-transform: scale(1);
	transform: scale(1);
}

}
@
-webkit-keyframes tipInPlace {from { width:0em;
	top: 0em;
	left: -0.8em;
}

to {
	width: 1.2em;
	top: 2.15em;
	left: 0.7em;
	visibility: visible;
}

}
@
keyframes tipInPlace {from { width:0em;
	top: 0em;
	left: -0.8em;
}

to {
	width: 1.2em;
	top: 2.15em;
	left: 0.7em;
	visibility: visible;
}

}
@
-webkit-keyframes longInPlace {from { width:0em;
	top: 2.55em;
	left: 1.6em;
}

to {
	width: 2em;
	top: 1.85em;
	left: 1.375em;
	visibility: visible;
}

}
@
keyframes longInPlace {from { width:0em;
	top: 2.55em;
	left: 1.6em;
}

to {
	width: 2em;
	top: 1.85em;
	left: 1.375em;
	visibility: visible;
}

//
답에 대한 css
  .textRevealContainer {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	font-family: "Comic Sans MS", cursive, sans-serif;
	font-size: 1.5em; /*adjust according to your need*/
	text-align: center; /*in case you write multiline text*/
}

.textReveal {
	overflow: hidden;
	animation: textRevealAnim 2s ease 0.5s forwards;
}

.textReveal>div {
	padding: 8px 16px;
	transform: translateX(100%);
	border-left: 2px solid red;
	overflow: hidden;
	animation: textRevealAnim 2s ease 0.5s forwards, borderOpacityAnim 2s
		ease 0.5s forwards;
}

.textReveal>div>div {
	transform: translateX(-100%);
	animation: textRevealAnim 2s ease 0.5s forwards;
}

@
keyframes textRevealAnim {to { transform:translateX(0);
	
}

}
@
keyframes borderOpacityAnim { 50% {
	border-left: 2px solid red;
}

100%
{
border-left


:

 

2
px

 

solid

 

transparent


;
}
}
.textReveal.x50 {
	transform: translateX(-50%);
}

.textReveal.x100 {
	transform: translateX(-100%);
}

.textReveal.zoom>div {
	transform: translateX(100%) scale(0.5, 0.5);
}

.textReveal.rotateY {
	perspective: 100px; /*adjust according to your need*/
}

.textReveal.rotateY>div {
	transform: translateX(100%) rotateY(20deg);
}

.textReveal.color>div>div {
	background: linear-gradient(to right, red, red 45%, orange 45%, orange 55%, red 55%,
		red);
	-webkit-text-fill-color: transparent;
	-webkit-background-clip: text;
	background-size: 300%;
	animation: textRevealAnim 2s ease 0.5s forwards, bgShiftAnim 3s ease
		0.5s forwards;
}

@
keyframes bgShiftAnim {to { background-position:100%;
	
}
}
</style>
</head>

<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
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
	<!-- Start Sale Statistic area-->
	<div class="breadcomb-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="breadcomb-list" style="
background: #fff;
box-shadow: 0 6px 10px rgba(0,0,0,.08), 0 0 6px rgba(0,0,0,.05);
transition: .3s transform cubic-bezier(.155,1.105,.295,1.12),.3s box-shadow,.3s -webkit-transform cubic-bezier(.155,1.105,.295,1.12);
border-radius: 40px 40px 40px 40px;">
						<div class="row" style="text-align: center;">
							<h3>
								문장 "<%=rDTO.getSign_name()%>"을(를) 모션인식으로 맞춰보세요
							</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="step3">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" id="a"
					style="background: #fff; box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05); transition: .3s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .3s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12); border-radius: 20px; height: 535.2px;">
					<div class="data-map-single"
						style="text-align: center; margin: 0auto; ">

						<h4>모션인식을 통해 수화를 직접해보세요</h4>
						<hr>
						<br>
						<canvas id="canvas"></canvas>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="data-map-single sm-res-mg-t-30"
						style="height: 535.2px; text-align: center; margin: 0auto;
background: #fff;
box-shadow: 0 6px 10px rgba(0,0,0,.08), 0 0 6px rgba(0,0,0,.05);
transition: .3s transform cubic-bezier(.155,1.105,.295,1.12),.3s box-shadow,.3s -webkit-transform cubic-bezier(.155,1.105,.295,1.12);
border-radius: 20px;">

                               <!--타이머 그리는곳  -->
                     <div class="timer">   <br><br>
                     <h1 style="text-align:center; ">5초 뒤에 측정이 시작됩니다</h1><br>
                     <div class="numero_counting_wrapper" style="border-radius: 50%;border:4px solid #00c292;;">
                    <div class="numero_shape" style="margin-top: 50px;"></div>
                       </div>     
                       </div>
                             <!--타이머 그리는곳   끝-->
                             <div class="last">
						<h4>맞춘 어절이 하나씩 드러납니다</h4>
						<hr>
						<div class="textRevealContainer">
							<div class="textReveal rotateY"> 
								<div id="chartdiv" style="float: left;"></div>
								<div id="chartdiv2" style="float: left;"></div>
								<div id="chartdiv3"style="float: left;"></div>
								<div class="div1" style="">
								<h1><%=rDTO.getDiv_one()%></h1><br>
								</div>
								<div class="div2" style=" ">
									<h1>
										<%=rDTO.getDiv_two()%></h1><br>
								</div>
								<div class="div3" style=" ">
									<h1><%=rDTO.getDiv_three()%></h1><br>
								</div>
								
								<div>
								<button id="cha" class="btn btn-success notika-btn-success waves-effect" style="margin-top: 10px; background-color: #00c292; border: 0px;" OnClick="location.href ='/quiz/type2.do'">
<i class="fas fa-share" style="font-weight:bold;"> 다른문제 풀러가기</i>
</button>
						</div>
							</div>

						</div>
					
						</div>
                           <!--  -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--step3 끝-->


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
	<!-- jvectormap JS
      ============================================ -->
	<script src="/js/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
	<script src="/js/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script src="/js/jvectormap/jvectormap-active.js"></script>
	<!-- sparkline JS
      ============================================ -->
	<script src="js/sparkline/jquery.sparkline.min.js"></script>
	<script src="/js/sparkline/sparkline-active.js"></script>
	<!-- sparkline JS
      ============================================ -->
	<script src="/js/flot/jquery.flot.js"></script>
	<script src="/js/flot/jquery.flot.resize.js"></script>
	<script src="/js/flot/curvedLines.js"></script>
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
	<!--  todo JS
      ============================================ -->
	<script src="/js/todo/jquery.todo.js"></script>
	<!-- plugins JS
      ============================================ -->
	<script src="/js/plugins.js"></script>
	<!--  Chat JS
      ============================================ -->
	<script src="/js/chat/moment.min.js"></script>
	<script src="/js/chat/jquery.chat.js"></script>
	<!-- main JS
      ============================================ -->
	<script src="/js/main.js"></script>
</body>
</html>