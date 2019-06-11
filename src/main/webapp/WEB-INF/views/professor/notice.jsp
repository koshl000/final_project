<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="data-table-list">
				<div class="table-responsive">
					<h2>공지사항</h2>
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