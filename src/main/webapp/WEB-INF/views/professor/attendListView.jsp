<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Data Table JS
	============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/notika/css/jquery.dataTables.min.css">
<!--    메뉴 소개 영역 -->
<div class="breadcomb-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="breadcomb-list">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<div class="breadcomb-wp">
								<div class="breadcomb-ctn">
									<h2>성적조회</h2>
									<p>
										성적조회 페이지<span class="bread-ntd"></span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="data-table-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="data-table-list">
					<div class="table-responsive">
						<table id="data-table-basic">
							<thead>
								<tr>
									<th></th>
									<th>수강번호</th>
									<th>학번</th>
									<th>학년</th>
									<th>이름</th>
									<th>중간고사</th>
									<th>기말고사</th>
									<th>출석</th>
									<th>과제물</th>
								</tr>
							</thead>
							<tbody id="tableBody">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script
	src="${pageContext.request.contextPath }/notika/js/data-table/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath }/notika/js/data-table/data-table-act.js"></script>
<script>
var t = $('#data-table-basic').DataTable({
	scrollY : '400px',
	scrollCollapse : true,
	paging : false,
	ajax : {
		type : 'get',
		url : '${pageContext.request.contextPath}/searchGrade/attendList/${lecture_code}',
		dataType : 'json'
	}
	, columns : [ {
		data : "student.enrollment"
	}, {
		data : "attend.attend_no"
	}, {
		data : "attend.user_id"
	}, {
		data : "student.current_year"
	}, {
		data : "user.user_name"
	}, {
		data : "grade.grade_midterm"
	}, {
		data : "grade.grade_final"
	}, {
		data : "grade.grade_absence"
	}, {
		data : "grade.grade_assignment"
	} ]
	, columnDefs : [ {
        "searchable": false,
        "orderable": false,
        "targets": 0
    } ]
	, order : []
});

t.on( 'order.dt search.dt', function () {
    t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
    } );
} ).draw();

</script>