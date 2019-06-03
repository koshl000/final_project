<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$(function() {
		var lec_code = $("[name='lecture_code']").val();
		
		var ctx = document.getElementById("barchart1");
		var data = {
				"lecture_code" : lec_code
			};
		$.ajax({
			url : "${pageContext.request.contextPath}/studyStatestatis",
			method : "post",
			data : data,
			dataType : "json", // request header(Accept),response header(Content-type)
			success : function(resp) {
				
				var barchart1 = new Chart(ctx, {
					type : 'bar',
					data : {
						labels : [ "수강률", "전체수강률", "과제점수 ", "과제점수평균","중간고사","중간고사평균", "기말고사","기말고사평균" ],
						datasets : [ {
							label : resp.lecture_name,
							data : [resp.userGrade.grade_absence,
									resp.avgGrade.grade_absence,
									resp.userGrade.grade_assignment,
									resp.avgGrade.grade_assignment,
									resp.userGrade.grade_midterm,
									resp.avgGrade.grade_midterm,
									resp.userGrade.grade_final,
									resp.avgGrade.grade_final],
							backgroundColor : [ 'rgba(255, 99, 132, 0.2)','rgba(255, 99, 132, 0.2)',
									'rgb(50,205,50, 0.2)','rgb(50,205,50, 0.2)',
									'rgba(255, 206, 86, 0.2)','rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)','rgba(75, 192, 192, 0.2)' ],
							borderColor : [ 'rgba(255,99,132,1)','rgba(255,99,132,1)',
									'rgba(54, 162, 235, 1)','rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)','rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)','rgba(75, 192, 192, 1)' ],
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
		
	});

</script>


	<input name="lecture_code" type="hidden" value="${lecture_code}"/>
	
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="bar-chart-wp">
					<h2>학습현황</h2>
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
