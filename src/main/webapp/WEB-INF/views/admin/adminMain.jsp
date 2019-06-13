<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 2.      AA      최초작성
* Copyright (c) 2019 by DDIT All right reserved
*
* 관리자 메인 화면
 --%>
	
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/fullCalendar/fullcalendar/style_full.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/fullCalendar/fullcalendar/moment.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/fullCalendar/fullcalendar/fullcalendar.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/fullCalendar/fullcalendar/spectrum.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/fullCalendar/fullcalendar/frontStumain.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.2/TweenMax.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
	border: 0;
}

html, body {
	height: 100%;
	width: 100%;
}

.test {
	width: 50%;
	height: 100%;
	overflow: auto;
}

.test1 {
	width: 50%;
	height: 100%;
	overflow: auto; 
}
</style>
	
<script type="text/javascript">
	$(function() {

		var dt = new Date();
		var recentYear = dt.getFullYear();
		var recentMonth = dt.getMonth() + 1;
		var recentDay = dt.getDate();
		if (recentMonth < 10)
			recentMonth = "0" + recentMonth;
		if (recentDay < 10)
			recentDay = "0" + recentDay;

		$("#st_date").val(recentYear + "/" + recentMonth + "/" + recentDay);
		$("#ed_date").val(recentYear + "/" + recentMonth + "/" + recentDay);

		var today = recentYear + recentMonth + recentDay;

		var start_date = today + "000000";
		var end_date = today + "235959";

		graphing();

		function graphing() {
			var sel = "weekly";

			if (sel == "daily") {

				var styear = today.substring(0, 4);
				var stmonth = today.substring(4, 6);
				var stday = today.substring(6, 8);

				var edyear = today.substring(0, 4);
				var edmonth = today.substring(4, 6);
				var edday = today.substring(6, 8);
				$("#st_date").val(styear + "/" + stmonth + "/" + stday);
				$("#ed_date").val(edyear + "/" + edmonth + "/" + edday);

				start_date = today + "000000";
				end_date = today + "235959";

			} else if (sel == "weekly") {

				var weeklydate = fn_getThisWeek();

				var styear = weeklydate[0].substring(0, 4);
				var stmonth = weeklydate[0].substring(4, 6);
				var stday = weeklydate[0].substring(6, 8);

				var edyear = weeklydate[1].substring(0, 4);
				var edmonth = weeklydate[1].substring(4, 6);
				var edday = weeklydate[1].substring(6, 8);
				$("#st_date").val(styear + "/" + stmonth + "/" + stday);
				$("#ed_date").val(edyear + "/" + edmonth + "/" + edday);

				start_date = weeklydate[0] + "000000";
				end_date = weeklydate[1] + "235959";

			} else if (sel == "monthly") {
				var monthlyDate = fn_getThisMonth();

				var styear = monthlyDate[0].substring(0, 4);
				var stmonth = monthlyDate[0].substring(4, 6);
				var stday = monthlyDate[0].substring(6, 8);

				var edyear = monthlyDate[1].substring(0, 4);
				var edmonth = monthlyDate[1].substring(4, 6);
				var edday = monthlyDate[1].substring(6, 8);
				$("#st_date").val(styear + "/" + stmonth + "/" + stday);
				$("#ed_date").val(edyear + "/" + edmonth + "/" + edday);

				start_date = monthlyDate[0] + "000000";
				end_date = monthlyDate[1] + "235959";

			} else {
				var st_dateValue = $("[name='st_date']").val();
				var styear = st_dateValue.substring(0, 4);
				var stmonth = st_dateValue.substring(5, 7);
				var stday = st_dateValue.substring(8, 10);

				var ed_dateValue = $("[name='ed_date']").val()

				var edyear = ed_dateValue.substring(0, 4);
				var edmonth = ed_dateValue.substring(5, 7);
				var edday = ed_dateValue.substring(8, 10);

				start_date = styear + stmonth + stday + "000000";
				end_date = edyear + edmonth + edday + "235959";

			}

			var data = {
				"start_date" : start_date,
				"end_date" : end_date
			};
			var ctx = document.getElementById("barchart1");
			$.ajax({
				url : "${pageContext.request.contextPath}/potalStatistics",
				method : "post",
				data : data,
				dataType : "json", // request header(Accept),response header(Content-type)
				success : function(resp) {

					var section1 = 0;
					var section2 = 0;
					var section3 = 0;
					var section4 = 0;
					var section5 = 0;
					var section6 = 0;

					var respList = resp;
					$(respList).each(function(idx, resps) {
						var sec = resps.time.substring(0, 2);

						if (idx >= 0 && sec <= 3) {
							section1 = Number(section1) + Number(resps.noa);
						} else if (idx >= 4 && sec <= 7) {
							section2 = Number(section2) + Number(resps.noa);
						} else if (idx >= 8 && sec <= 11) {
							section3 = Number(section3) + Number(resps.noa);
						} else if (idx >= 12 && sec <= 15) {
							section4 = Number(section4) + Number(resps.noa);
						} else if (idx >= 16 && sec <= 19) {
							section5 = Number(section5) + Number(resps.noa);
						} else if (idx >= 20 && sec <= 23) {
							section6 = Number(section6) + Number(resps.noa);
						}

					});

					var basiclinechart = new Chart(ctx, {
						type : 'line',
						data : {
							labels : [ "00:00~04:00", "04:00~08:00",
									"08:00~12:00", "12:00~16:00",
									"16:00~20:00", "20:00~00:00" ],
							datasets : [ {
								label : "접속자 수(명)",
								fill : false,
								backgroundColor : '#00c292',
								borderColor : '#00c292',
								data : [ section1, section2, section3,
										section4, section5, section6 ]
							} ]
						},
						options : {
							responsive : true,
							title : {
								display : true,
								text : '시간대별 시스템 접속자(최근 1주)'
							},
							tooltips : {
								mode : 'index',
								intersect : false,
							},
							hover : {
								mode : 'nearest',
								intersect : true
							},
							scales : {
								xAxes : [ {
									display : true,
									scaleLabel : {
										display : true,
										labelString : '접속시간'
									}
								} ],
								yAxes : [ {
									display : true,
									scaleLabel : {
										display : true,
										labelString : '접속자'
									}
								} ]
							}
						}
					});//chart

				},
				error : function(errorResp) {
					console.log(errorResp.status);
				}
			});//ajax

		}
		;

		//주간 날짜 반환 함수
		function fn_getThisWeek() {
			var value = [];
			var formatDate = function(date) {
				var myMonth = date.getMonth() + 1;
				var myWeekDay = date.getDate();

				var addZero = function(num) {
					if (num < 10) {
						num = "0" + num;
					}
					return num;
				}
				var md = addZero(myMonth) + addZero(myWeekDay);

				return md;
			}

			var now = new Date();
			var nowDayOfWeek = now.getDay();
			var nowDay = now.getDate();
			var nowMonth = now.getMonth();
			var nowYear = now.getYear();
			nowYear += (nowYear < 2000) ? 1900 : 0;
			var weekStartDate = new Date(nowYear, nowMonth, nowDay
					- nowDayOfWeek);
			var weekEndDate = new Date(nowYear, nowMonth, nowDay
					+ (6 - nowDayOfWeek));
			value.push(nowYear + formatDate(weekStartDate));
			value.push(nowYear + formatDate(weekEndDate));

			return value;
		}

		//월간 날짜 반환 함수
		function fn_getThisMonth() {
			var value = [];

			var now = new Date();
			var nowYear = now.getYear();
			var firstDate, lastDate;

			var formatDate = function(date) {
				var myMonth = date.getMonth() + 1;
				var myWeekDay = date.getDate();

				var addZero = function(num) {
					if (num < 10) {
						num = "0" + num;
					}
					return num;
				}
				var md = addZero(myMonth) + addZero(myWeekDay);

				return md;
			}

			firstDate = new Date(now.getYear(), now.getMonth(), 1);
			lastDate = new Date(now.getYear(), now.getMonth() + 1, 0);
			nowYear += (nowYear < 2000) ? 1900 : 0;
			value.push(nowYear + formatDate(firstDate));
			value.push(nowYear + formatDate(lastDate));
			return value;
		}
		
		
	});
	
</script>
<div class="alert alert-success" role="alert" style="text-align:center">${user.user_name}님이 접속하셨습니다.</div>
<div class="container">
<div class="col-md-6 test">
				<h3>Quick menu</h3>
				<div class="color-single nk-blue mg-t-30" style="float:left; margin-left: 2px; margin-right: 26px;">
                                    <h2>강좌관리</h2>
                                    <a href="${pageContext.request.contextPath }/curriculum/lecture" style="color:#fff">  
                                    <i class="notika-icon notika-edit" style="font-size:50px;"></i></a>
                                    </div>
				<div class="color-single nk-pink mg-t-30" style="float:left; margin-right: 26px;" >
                                    <h2>통계관리</h2>
                                    <a href="${pageContext.request.contextPath }/statistics/subject" style="color:#fff">  
                                    <i class="notika-icon notika-bar-chart" style="font-size:50px;"></i></a>
                                </div>
<!--  				<div class="color-single nk-orange mg-t-30" style="float:left; margin-right: 26px;"> -->
<!--                                    <h2>증명서관리</h2> -->
<%--                                    <a href="${pageContext.request.contextPath }/adminMain/certificate" style="color:#fff">   --%>
<!--                                    <i class="notika-icon notika-form" style="font-size:50px;"></i></a> -->
<!--                                 </div>  -->
                                
				<div class="color-single nk-green mg-t-30" style="float:left; margin-right: 26px;">
                                    <h2>SMS관리</h2>
                                    <a href="${pageContext.request.contextPath }/sms/smsGroupList" style="color:#fff">  
                                    <i class="notika-icon notika-mail" style="font-size:50px;"></i></a>
                                    
                 </div>        
					<div class="bar-chart-wp" style="margin-top: 200px; ">
					<canvas height="200vh" width="360vw" id="barchart1"></canvas>
				</div>
				
			</div>

		<div class="col-md-6 test1">
		<div class="wrap">
			<div class="calendar_wrap" id="calendar"></div>
		</div>
	</div>
	</div>
<script type="text/javascript">
	$(function() {
		scheduleRegist.init(); // 일정 등록 관리 초기화
		ajaxData();

	});
</script>

<script
	src="${pageContext.request.contextPath }/notika/js/chat/jquery.chat.js"></script>
<!-- Charts JS
		============================================ -->
<script
	src="${pageContext.request.contextPath }/notika/js/charts/Chart.js"></script>

<script
	src="${pageContext.request.contextPath }/notika/js/datapicker/bootstrap-datepicker.js"></script>