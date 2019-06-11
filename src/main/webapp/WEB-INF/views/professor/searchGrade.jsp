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
									<th>강좌코드</th>
									<th>강좌명</th>
									<th>이수구분</th>
									<th>학년</th>
									<th>수강인원</th>
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
		url : '${pageContext.request.contextPath}/searchGrade/${user.user_id}',
		dataType : 'json'
	}
	, columns : [ {
		data : "mid_date"
	}, {
		data : "lecture_code"
	}, {
		data : "lecture_name"
	}, {
		data : "lecture_coursetype"
	}, {
		data : "lecture_target"
	}, {
		data : "lecture_current"
	} ]
	//indexing
	, columnDefs : [ {
        "searchable": false,
        "orderable": false,
        "targets": 0
    } ]
	, order : []
});

//indexing
t.on( 'order.dt search.dt', function () {
    t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
    } );
} ).draw();
</script>