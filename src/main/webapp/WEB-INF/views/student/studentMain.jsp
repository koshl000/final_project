<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- dialog CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/notika/css/dialog/sweetalert2.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/notika/css/dialog/dialog.css">

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
	<div class="alert alert-success" role="alert" style="text-align:center">${user.user_name}님이 접속하셨습니다.</div>
<div class="container">
<div class="col-md-6 test">
				<h3>Quick menu</h3>
				<div class="color-single nk-blue mg-t-30" style="float:left; margin-left: 2px; margin-right: 26px;">
                                    <h2>나의강의</h2>
                                    <a href="${pageContext.request.contextPath }/studentMain/myLecture" style="color:#fff">  
                                    <i class="notika-icon notika-draft" style="font-size:50px;"></i></a>
                                    </div>
				<div class="color-single nk-pink mg-t-30" style="float:left; margin-right: 26px;" >
                                    <h2>성적조회</h2>
                                    <a href="${pageContext.request.contextPath }/studentMain/searchGrade" style="color:#fff">  
                                    <i class="notika-icon notika-bar-chart" style="font-size:50px;"></i></a>
                                </div>
 				<div class="color-single nk-orange mg-t-30" style="float:left; margin-right: 26px;">
                                   <h2>증명서발급 </h2>
                                   <a href="${pageContext.request.contextPath }/studentMain/certificate" style="color:#fff">  
                                   <i class="notika-icon notika-form" style="font-size:50px;"></i></a>
                                </div> 
                                
				<div class="color-single nk-green mg-t-30" style="float:left; margin-right: 26px;">
                                    <h2>수강신청</h2>
                                    <a href="${pageContext.request.contextPath }/studentMain/attendApply" style="color:#fff">  
                                    <i class="notika-icon notika-edit" style="font-size:50px;"></i></a>
                                    
                 </div>        
				<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"   >
			<div class="data-table-list" style="margin-top: 30px;">
				<div class="table-responsive">
					<h3>공지사항</h3>
					<table id="data-table-basic" class="table table-striped dataTable"
						role="grid" aria-describedby="data-table-basic_info">
						<div id="searchDiv"></div>
						<thead>
							<tr>
								<th></th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
			</div>
		</div>
		<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script>
	var table = $('#data-table-basic').DataTable({
		ajax : {
			"type" : "get",
			"url" : "${pageContext.request.contextPath}/notice",
			"dataType" : "JSON"
		},
		columns : [ {
			data : "lecture_name"
		}, {
			data : "board_title"
		}, {
			data : "writer"
		}, {
			data : "board_date"
		}, {
			data : "board_hit"
		}],
		"order" : []
		, columnDefs : [ {
	        "searchable": false,
	        "orderable": false,
	        "targets": 0
	    } ]
	});

	table.on( 'order.dt search.dt', function () {
	    table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	        cell.innerHTML = i+1;
	    } );
	} ).draw();
	
	$('#data-table-basic').on('click','a',function(e) {
		e.preventDefault();
		var no = $(this).attr("href");
		location.href = "${pageContext.request.contextPath}/notice/"+ no;
	});
	
</script>
		
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
	src="${pageContext.request.contextPath }/notika/js/dialog/sweetalert2.min.js"></script>