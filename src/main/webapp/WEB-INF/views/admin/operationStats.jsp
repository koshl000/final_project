<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 24.      김재은      최초작성
* Copyright (c) 2019 by DDIT All right reserved
*
 --%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/notika/css/datapicker/datepicker3.css">

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
		
		getThisTimeSemester();

		
		var openseme_no = $("[name='semester']").val();
		var lower_organization = $("[name='lowerOrganization']").val();

		graphing1();
		graphing2();

		function getThisTimeSemester() {

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

			var data = {
				"today" : today
			};

			$.ajax({
				url : "${pageContext.request.contextPath}/thisTimeSemester",
				method : "post",
				data : data,
				dataType : "json", // request header(Accept),response header(Content-type)
				success : function(resp) {
					ttsm = resp.openseme_no;
					$("[name='semester']").val(ttsm).attr("selected", "selected");
					graphing1();
					graphing2();
					
				},
				error : function(errorResp) {
					console.log(errorResp.status);
				}
			});//ajax
		}
		;

		function graphing1() {
			openseme_no = $("[name='semester']").val();
			var ctx1 = document.getElementById("barchart1");
			var data = {

				"openseme_no" : openseme_no
			};

			$.ajax({
				url : "${pageContext.request.contextPath}/operationSt",
				method : "post",
				data : data,
				dataType : "json", // request header(Accept),response header(Content-type)
				success : function(resp) {
					var barchart1 = new Chart(ctx1, {
						type : 'bar',
						data : {
							labels : [ "교양", "전공", "전체과목 ", "수강인원" ],
							datasets : [ {
								label : '2019년 1학기(전체학과)',
								data : [ resp[0].nonmajor_cnt,
										resp[0].major_cnt, resp[0].lecture_cnt,
										resp[0].lecture_currentsum ],
								backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
										'rgb(50,205,50, 0.2)',
										'rgba(255, 206, 86, 0.2)',
										'rgba(75, 192, 192, 0.2)' ],
								borderColor : [ 'rgba(255,99,132,1)',
										'rgba(54, 162, 235, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(75, 192, 192, 1)' ],
								borderWidth : 1
							} ]
						},
						options : {
							scales : {
								yAxes : [ {
									ticks : {
										beginAtZero : true
									}
								} ]
							}
						}
					});

				},
				error : function(errorResp) {
					console.log(errorResp.status);
				}
			});//ajax

		}
		;//graphing1

		function graphing2() {
			openseme_no = $("[name='semester']").val();
			lower_organization = $("[name='lowerOrganization']").val();
			var lec_name = $("[name='lowerOrganization']").children(":selected").text();
			var ctx2 = document.getElementById("barchart2");
			var data = {

				"openseme_no" : openseme_no,
				"lower_organization" : lower_organization

			};

			$.ajax({
				url : "${pageContext.request.contextPath}/operationSt",
				method : "post",
				data : data,
				dataType : "json", // request header(Accept),response header(Content-type)
				success : function(resp) {
					var barchart2 = new Chart(ctx2, {
						type : 'bar',
						data : {
							labels : [ "교양", "전공", "전체과목", "수강인원" ],
							datasets : [ {
								label : lec_name,
								data : [ resp[0].nonmajor_cnt,
										resp[0].major_cnt, resp[0].lecture_cnt,
										resp[0].lecture_currentsum ],
								backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
										'rgb(50,205,50, 0.2)',
										'rgba(255, 206, 86, 0.2)',
										'rgba(75, 192, 192, 0.2)' ],
								borderColor : [ 'rgba(255,99,132,1)',
										'rgba(54, 162, 235, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(75, 192, 192, 1)' ],
								borderWidth : 1
							} ]
						},
						options : {
							scales : {
								yAxes : [ {
									ticks : {
										beginAtZero : true
									}
								} ]
							}
						}
					});

				},
				error : function(errorResp) {
					console.log(errorResp.status);
				}
			});//ajax

		}
		;//graphing2

		$("[name='semester']").on("change", function() {
			
			graphing1();
			graphing2();

		});

		$("[name='lowerOrganization']").on("change", function() {

			graphing1();
			graphing2();

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
									<h2>학기별 운영 통계</h2>
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
				<select name="semester">
					<c:forEach var="semester" items="${semesterList}">
						<option id="${semester.openseme_no}"
							value="${semester.openseme_no}">
							${semester.openseme_year}년도 ${semester.openseme_semester}학기</option>
					</c:forEach>
				</select> <select name="lowerOrganization">
					<c:forEach var="lowerOrganization" items="${lowerOrganizationList}">
						<option value="${lowerOrganization.lower_organization}">
							${lowerOrganization.lower_organization}</option>
					</c:forEach>
				</select>
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


<!-- Charts JS
		============================================ -->
<script
	src="${pageContext.request.contextPath }/notika/js/charts/Chart.js"></script>

<script
	src="${pageContext.request.contextPath }/notika/js/datapicker/bootstrap-datepicker.js"></script>



