<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 2.      김재은      최초작성
* Copyright (c) 2019 by DDIT All right reserved
*
* 관리자 과목통계관리 화면
 --%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/datapicker/datepicker3.css">

<style>
   tfoot { 
       display: table-header-group; 
   }
   select {
       border: 1px solid #eee;
       height: 35px;
       padding: 7px 15px;
       font-size: 13px;
       border-radius: 2px;
       -webkit-appearance: none;
       -moz-appearance: none;
       line-height: 100%;
       background-color: #fff;
       outline: none;
   }
   
   select :hover  {
      background-color: #00c292 !important;
       color: #fff !important;
   }
   .selectSpan {
      font-size: 16px;
      font-weight: bold;
      margin : 0 5px 0 20px;
   }
   #grade, #credit, #course {
      width: 60px;
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
			var prof = $("[name='lecture']").val();
			var sel = $("[name='term']").val();

		
			if (prof) {
				$('#professor').text(prof);
			}

			if (sel == "daily") {
				
				var styear =today.substring(0, 4);
				var stmonth =today.substring(4, 6);
				var stday = today.substring(6, 8);
				
				var edyear =today.substring(0, 4);
				var edmonth =today.substring(4, 6);
				var edday =today.substring(6, 8);
				$("#st_date").val(styear + "/" + stmonth + "/" + stday);
				$("#ed_date").val(edyear + "/" + edmonth + "/" + edday);
				
				start_date = today + "000000";
				end_date = today + "235959";
				
			} else if (sel == "weekly") {

				var weeklydate = fn_getThisWeek();

				var styear =weeklydate[0].substring(0, 4);
				var stmonth =weeklydate[0].substring(4, 6);
				var stday = weeklydate[0].substring(6, 8);
				
				var edyear =weeklydate[1].substring(0, 4);
				var edmonth =weeklydate[1].substring(4, 6);
				var edday =weeklydate[1].substring(6, 8);
				$("#st_date").val(styear + "/" + stmonth + "/" + stday);
				$("#ed_date").val(edyear + "/" + edmonth + "/" + edday);
				
				start_date = weeklydate[0] + "000000";
				end_date = weeklydate[1] + "235959";

			} else if (sel == "monthly") {
				var monthlyDate = fn_getThisMonth();
				
				var styear =monthlyDate[0].substring(0, 4);
				var stmonth =monthlyDate[0].substring(4, 6);
				var stday = monthlyDate[0].substring(6, 8);
				
				var edyear =monthlyDate[1].substring(0, 4);
				var edmonth =monthlyDate[1].substring(4, 6);
				var edday =monthlyDate[1].substring(6, 8);
				$("#st_date").val(styear + "/" + stmonth + "/" + stday);
				$("#ed_date").val(edyear + "/" + edmonth + "/" + edday);
				
				
				start_date = monthlyDate[0] + "000000";
				end_date = monthlyDate[1] + "235959";

			} else{
				var st_dateValue = $("[name='st_date']").val();
				var styear =st_dateValue.substring(0, 4);
				var stmonth =st_dateValue.substring(5, 7);
				var stday = st_dateValue.substring(8, 10);
				
				
				var ed_dateValue=$("[name='ed_date']").val()
				
				var edyear =ed_dateValue.substring(0, 4);
				var edmonth =ed_dateValue.substring(5, 7);
				var edday =ed_dateValue.substring(8, 10);
				
				start_date =styear+stmonth+stday+"000000";
				end_date = edyear+edmonth+edday+"235959";
				
			}

			var lec_code = $("[name='lecture']").children(":selected").attr("id");
			var lec_name = $("[name='lecture']").children(":selected").text();

			var data = {
				"lecture_code" : lec_code,
				"start_date" : start_date,
				"end_date" : end_date
			};
			var ctx = document.getElementById("barchart1");
			$.ajax({
				url : "${pageContext.request.contextPath}/letureStatistics",
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
								backgroundColor : '#fb9678',
								borderColor : '#fb9678',
								data : [ section1, section2, section3,
										section4, section5, section6 ]
							} ]
						},
						options : {
							responsive : true,
							title : {
								display : true,
								text : lec_name + ' 과목 게시판 접속자'
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

		};

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

		$("[name='upperOrganization']").on("change", function() {
			var upperOr = $(this).val();
			if (upperOr) {
				$("[name='lowerOrganization']>option:not(:first)").hide();
				$("." + upperOr).show();
			}
		});
		
		

		$("[name='lowerOrganization']").on("change", function() {
			var lec = $(this).val();
			if (lec) {
				$("[name='lecture']>option:not(:first)").hide();
				$("[name='lecture']").children(":selected").hide();
				$("." + lec).show();
			}
		});
		

		$("[name='lecture']").on("change", function() {
			graphing();

		});//change

		$("[name='term']").on("change", function() {
			graphing();

		});
		
		$("[name='st_date']").on("change", function() {
			$("[name='term']").val("selectDR").attr("selected","selected");
						graphing();
			
		});
		
		$("[name='ed_date']").on("change", function() {
			graphing();
			
		});
		

		$('#data_1 .input-group.date').datepicker({
			todayBtn : "linked",
			keyboardNavigation : false,
			forceParse : false,
			calendarWeeks : true,
			autoclose : true,
			format : "yyyy/mm/dd"

		});

		$('#data_2 .input-group.date').datepicker({
			todayBtn : "linked",
			keyboardNavigation : false,
			forceParse : false,
			calendarWeeks : true,
			autoclose : true,
			format : "yyyy/mm/dd"

		});

	});//fuction
</script>
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
									<h2>과목페이지 접속자통계</h2>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="breadcomb-list" id="selecter">
				<select name="upperOrganization">
					<option value>학부</option>
					<c:forEach var="upperOrganization" items="${upperOrganizationList}">
						<option value='${upperOrganization.lower_organization}'>${upperOrganization.lower_organization}</option>
					</c:forEach>
				</select> <select name="lowerOrganization">
					<option value>학과</option>
					<c:forEach var="lowerOrganization" items="${lowerOrganizationList}">
						<option value="${lowerOrganization.lower_organization}"
							class="${lowerOrganization.upper_organization}">
							${lowerOrganization.lower_organization}</option>
					</c:forEach>
				</select> <select name="lecture">
					<c:forEach var="lecture" items="${lectureList}">
						<option class="${lecture.lower_organization}"
							id="${lecture.lecture_code}" value="${lecture.user_name}">
							${lecture.lecture_name}</option>
					</c:forEach>
				</select> <span>담당교수:</span><span id="professor">&nbsp; &nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;</span> <select name="term">
					<option value="daily">일간</option>
					<option value="weekly">주간</option>
					<option value="monthly">월간</option>
					<option value="selectDR">기간 선택</option>
				</select>

			</div>
			<div>
				<h4>조회 기준 일자</h4>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
				<div class="form-group nk-datapk-ctm form-elet-mg" id="data_1" name="data_1">
					<div class="input-group date nk-int-st">
						<span class="input-group-addon"></span> <input type="text"
						name="st_date"	id="st_date" class="form-control">
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
				<div class="form-group nk-datapk-ctm form-elet-mg" id="data_2" name="data_2">
					<div class="input-group date nk-int-st">
						<span class="input-group-addon"></span> <input type="text" name="ed_date"
							id="ed_date" class="form-control">
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
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="bar-chart-wp">
					<canvas height="140vh" width="360vw" id="barchart1"></canvas>
				</div>
			</div>
		</div>
	</div>
</div>



<!-- Charts JS
		============================================ -->
<script
	src="${pageContext.request.contextPath }/notika/js/charts/Chart.js"></script>

<script
	src="${pageContext.request.contextPath }/notika/js/datapicker/bootstrap-datepicker.js"></script>
<%-- <script src="${pageContext.request.contextPath }/notika/js/datapicker/datepicker-active.js"></script> --%>






