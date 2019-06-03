<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 2.      AA      최초작성
* Copyright (c) 2019 by DDIT All right reserved
*
* 로그인에 성공하면 나타나는 메인 페이지(학생, 교수)
 --%>
<head>
<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>차트</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/bootstrap.min.css">
    <!-- font awesome CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/font-awesome.min.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/owl.theme.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/owl.transitions.css">
    <!-- meanmenu CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/meanmenu/meanmenu.min.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/normalize.css">
	<!-- wave CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/wave/waves.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/wave/button.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- Notika icon CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/notika-custom-icon.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/main.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="${pageContext.request.contextPath }/notika/js/vendor/modernizr-2.8.3.min.js"></script>

</head>
<body>
	<!-- Main Menu area End-->
	<!-- Breadcomb area Start-->
	<div class="breadcomb-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="breadcomb-list">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="breadcomb-wp">
									<div class="breadcomb-icon">
										<i class="notika-icon notika-bar-chart"></i>
									</div>
									<div class="breadcomb-ctn">
										<h2>차트 2분할</h2>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-3">
								<div class="breadcomb-report">
									<button data-toggle="tooltip" data-placement="left"
										title="Download Report" class="btn">
										<i class="notika-icon notika-sent"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcomb area End-->
	<!-- Bar Chart area End-->
	<div class="bar-chart-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="bar-chart-wp">
						<canvas height="140vh" width="180vw" id="barchart1"></canvas>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="bar-chart-wp sm-res-mg-t-30 chart-display-nn">
						<canvas height="140vh" width="180vw" id="barchart2"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- End Footer area-->
    <!-- jquery
		============================================ -->
    <script src="${pageContext.request.contextPath }/notika/js/vendor/jquery-1.12.4.min.js"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="${pageContext.request.contextPath }/notika/js/bootstrap.min.js"></script>
    <!-- wow JS
		============================================ -->
    <script src="${pageContext.request.contextPath }/notika/js/wow.min.js"></script>
    <!-- price-slider JS
		============================================ -->
    <script src="${pageContext.request.contextPath }/notika/js/jquery-price-slider.js"></script>
    <!-- owl.carousel JS
		============================================ -->
    <script src="${pageContext.request.contextPath }/notika/js/owl.carousel.min.js"></script>
    <!-- scrollUp JS
		============================================ -->
    <script src="${pageContext.request.contextPath }/notika/js/jquery.scrollUp.min.js"></script>
    <!-- meanmenu JS
		============================================ -->
    <script src="${pageContext.request.contextPath }/notika/js/meanmenu/jquery.meanmenu.js"></script>
    <!-- counterup JS
		============================================ -->
    <script src="${pageContext.request.contextPath }/notika/js/counterup/jquery.counterup.min.js"></script>
    <script src="${pageContext.request.contextPath }/notika/js/counterup/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath }/notika/js/counterup/counterup-active.js"></script>
    <!-- mCustomScrollbar JS
		============================================ -->
    <script src="${pageContext.request.contextPath }/notika/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <!-- sparkline JS
		============================================ -->
    <script src="${pageContext.request.contextPath }/notika/js/sparkline/jquery.sparkline.min.js"></script>
    <script src="${pageContext.request.contextPath }/notika/js/sparkline/sparkline-active.js"></script>
    <!-- flot JS
		============================================ -->
    <script src="${pageContext.request.contextPath }/notika/js/flot/jquery.flot.js"></script>
    <script src="${pageContext.request.contextPath }/notika/js/flot/jquery.flot.resize.js"></script>
    <script src="${pageContext.request.contextPath }/notika/js/flot/flot-active.js"></script>
    <!-- knob JS
		============================================ -->
    <script src="${pageContext.request.contextPath }/notika/js/knob/jquery.knob.js"></script>
    <script src="${pageContext.request.contextPath }/notika/js/knob/jquery.appear.js"></script>
    <script src="${pageContext.request.contextPath }/notika/js/knob/knob-active.js"></script>
    <!--  Chat JS
		============================================ -->
    <script src="${pageContext.request.contextPath }/notika/js/chat/jquery.chat.js"></script>
    <!-- Charts JS
		============================================ -->
    <script src="${pageContext.request.contextPath }/notika/js/charts/Chart.js"></script>
    <script src="${pageContext.request.contextPath }/notika/js/charts/bar-chart.js"></script>
    <!--  todo JS
		============================================ -->
    <script src="${pageContext.request.contextPath }/notika/js/todo/jquery.todo.js"></script>
    <!-- plugins JS
		============================================ -->
    <script src="${pageContext.request.contextPath }/notika/js/plugins.js"></script>
	<!--  wave JS
		============================================ -->
    <script src="${pageContext.request.contextPath }/notika/js/wave/waves.min.js"></script>
    <script src="${pageContext.request.contextPath }/notika/js/wave/wave-active.js"></script>
    <!-- main JS
		============================================ -->
    <script src="${pageContext.request.contextPath }/notika/js/main.js"></script>
</body>
</html>