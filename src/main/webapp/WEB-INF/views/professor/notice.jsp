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
								<th>글번호</th>
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
			data : "board_no"
		}, {
			data : "board_title"
		}, {
			data : "board_writer"
		}, {
			data : "board_date"
		}, {
			data : "board_hit"
		}],
		"order" : []
	});

	$('#data-table-basic').on('click','a',function(e) {
		e.preventDefault();
		var no = $(this).attr("href");
		location.href = "${pageContext.request.contextPath}/notice/"+ no;
	});
	
	$('#data-table-basic_filter').find('label').prop('style', 'display:none;');
	$('#data-table-basic_filter').on('click',$('#searchBtn'),function() {
		$.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
			var searchWord = $('#searchInput').val();

			var no = data[0];
			var title = data[1];
			var writer = data[2];
			var date = data[3];
			var hit = data[4];

			if (searchWord == '' || searchWord == no || searchWord == title
				|| searchWord == writer || searchWord == date || searchWord == hit) {
				return true;
			}
			return false;
		});
		table.draw();
	});

	var button = $('<button>').prop({
		type : 'button',
		'class' : 'btn btn-default notika-btn-default',
		id : 'searchBtn'
	}).text("검색");
	$('#data-table-basic_filter').prepend($('<input>').prop({
		type : 'text',
		id : 'searchInput'
	})).prepend(button);
</script>