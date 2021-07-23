<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="poly.dto.QuizDTO"%>

<%
	QuizDTO rDTO = (QuizDTO) request.getAttribute("rDTO");
%>
<%@ include file="./session.jsp"%>
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
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
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
    <link rel="stylesheet" href="/css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- jvectormap CSS
		============================================ -->
    <link rel="stylesheet" href="/css/jvectormap/jquery-jvectormap-2.0.3.css">
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
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <!-- modernizr JS
		============================================ -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script src="https://github.com/nagix/chartjs-plugin-streaming/releases/download/v1.5.0/chartjs-plugin-streaming.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/pose@0.8/dist/teachablemachine-pose.min.js"></script>
<script src="/js/timer.js"></script>	
<script type="text/javascript">


//===================================================
//documet get ready 
//===================================================
  $( document ).ready( function() {
	  init();
	 $ ('.vcheck').hide();
	 $ ('#vcheckstring').hide();
	 $ ('#cha').hide();
	
	 $ ('.last').hide();
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

//그래프 그리기 
//===================================================
var chartColors = {
		red: 'rgb(255, 99, 132)',
		orange: 'rgb(255, 159, 64)',
		yellow: 'rgb(255, 205, 86)',
		green: 'rgb(75, 192, 192)',
		blue: 'rgb(54, 162, 235)',
		purple: 'rgb(153, 102, 255)',
		grey: 'rgb(201, 203, 207)'
	};


async function onRefresh(chart) {
	
	const a = await getPredictValue1();
	const b = await getPredictValue2();
	console.log(a);
	if(a==1.00){
		await $ ('.vcheck').show();
		await $ ('#vcheckstring').show();
		await $ ('#cha').show();
	}
	
	chart.config.data.datasets.forEach(function(dataset) {
		if(dataset.label=='정답'){
			dataset.data.push({
				x: Date.now(),
				y:  a
			});
		}else{
			dataset.data.push({
				x: Date.now(),
				y:  b
			});
		}
		
	});
}

var color = Chart.helpers.color;
var config = {
	type: 'line',
	data: {
		datasets: [{
			label: '정답',
			backgroundColor: color(chartColors.blue).alpha(0.5).rgbString(),
			borderColor: chartColors.blue,
			fill: false,
			lineTension: 0,
			borderDash: [8, 4],
			data: []
		}, {
			label: '오답',
			backgroundColor: color(chartColors.red).alpha(0.5).rgbString(),
			borderColor: chartColors.red,
			fill: false,
			cubicInterpolationMode: 'monotone',
			data: []
		}]
	},
	options: {
		title: {
			display: true,
			text: '수화 정확치'
		},
		scales: {
			xAxes: [{
				type: 'time'
			}],
			yAxes: [{
				scaleLabel: {
					display: true,
					labelString: '확률'
				}
			}]
		},
		tooltips: {
			mode: 'nearest',
			intersect: false
		},
		hover: {
			mode: 'nearest',
			intersect: false
		},
		plugins: {
			streaming: {
				duration: 6000,
				refresh: 200,
				delay: 50,
				onRefresh: onRefresh
			}
		}
	}
};
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
	    var ctx = document.getElementById('myChart').getContext('2d');
		window.myChart = new Chart(ctx, config);
	    this.start(4).off('end');
	    $ ('.last').show();
	    $ ('.timer').hide();

    
});

</script>	
<style>
 
 .white {
   color: white;
   margin-left: 24px;
   font-weight: bold;
}
  *{font-family: 'Noto Sans KR', sans-serif;}
#myChart{height:400px;}
.dummy-positioning {
  -webkit-box-align: center;
          align-items: center;
  -webkit-box-pack: center;
          justify-content: center;
}

.success-icon {
  display: inline-block;
  width:4em;
  height:4em;
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
  top:2.15em;
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

@-webkit-keyframes showSuccess {
  from {
    -webkit-transform: scale(0);
            transform: scale(0);
  }
  to {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
}

@keyframes showSuccess {
  from {
    -webkit-transform: scale(0);
            transform: scale(0);
  }
  to {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
}
@-webkit-keyframes tipInPlace {
  from {
    width: 0em;
    top: 0em;
    left: -0.8em;
  }
  to {
    width:1.2em;
    top: 2.15em;
    left: 0.7em;
    visibility: visible;
  }
}
@keyframes tipInPlace {
  from {
    width: 0em;
    top: 0em;
    left: -0.8em;
  }
  to {
    width:1.2em;
    top: 2.15em;
    left:0.7em;
    visibility: visible;
  }
}
@-webkit-keyframes longInPlace {
  from {
    width: 0em;
    top: 2.55em;
    left:1.6em;
  }
  to {
    width: 2em;
    top: 1.85em;
    left: 1.375em;
    visibility: visible;
  }
}
@keyframes longInPlace {
  from {
    width: 0em;
    top: 2.55em;
    left: 1.6em;
  }
  to {
    width: 2em;
    top: 1.85em;
    left: 1.375em;
    visibility: visible;
  }
}</style>
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
						<div class="row" style="text-align:center;">
										<h2>
											단어 <%=rDTO.getSign_name()%>을(를) 모션인식으로 맞춰보세요
										</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
    
      <div class="step3">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" id="a">
                    <div class="data-map-single" style="text-align: center; margin: 0auto;
background: #fff;
box-shadow: 0 6px 10px rgba(0,0,0,.08), 0 0 6px rgba(0,0,0,.05);
transition: .3s transform cubic-bezier(.155,1.105,.295,1.12),.3s box-shadow,.3s -webkit-transform cubic-bezier(.155,1.105,.295,1.12);
border-radius: 20px;">
                   
                    <h4>모션인식을 통해 수화를 직접해보세요 </h4>
                    <hr>
                    <br>
                       	<canvas id="canvas"></canvas>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" >
                    <div class="data-map-single sm-res-mg-t-30" style="height:510px;text-align: center; margin: 0auto;background: #fff;
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

                        <!--그래프 그리는곳  -->
                   <div class="last">
                    <h4>정확치를 직접 확인해보세요 </h4>
                    <hr>
                    <br>
                     <canvas id="myChart" style="text-align: center; "></canvas>
                     
                       <div class="vcheck">
                       <div class="success-icon"> 
                       <div class="success-icon__tip"></div>
                       <div class="success-icon__long"></div>
                       
                      </div>   
                       </div>
                        <span id="vcheckstring" style="color:#28C76F;font-weight: bold;" >정답입니다</span>
 <br>   <br>                 
                        <div >
                        <button id="cha" class="btn btn-success notika-btn-success waves-effect" style=" background-color:#00c292; border: 0px;"  OnClick="location.href ='/quiz/type1.do'">
<i class=" fas fa-share" style="font-weight:bold;">다른문제 풀러가기</i>
</button>
						</div>
						</div>
						<!--그래프 그리는곳  -->
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