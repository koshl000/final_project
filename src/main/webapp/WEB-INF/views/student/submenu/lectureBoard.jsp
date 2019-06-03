<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	function page_link() {
		window
				.open(
						"${pageContext.request.contextPath }/boardDetail",
						"상세강의보기",
						"width=1000, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=yes");
	}
</script>
<div class="container">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="data-table-list">
				<div class="table-responsive">
					<h2>강의게시판</h2>
					<button type="button" class="btn btn-default notika-btn-default"
						id="createBoard">등록</button>
					<table id="data-table-basic" class="table table-striped dataTable"
						role="grid" aria-describedby="data-table-basic_info">
						<div id="searchDiv"></div>
						<thead>
							<tr>
								<th>분류</th>
								<th>글번호</th>
								<th>제목</th>
								<th>댓글수</th>
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
			"url" : "${pageContext.request.contextPath}/${lecture_code}/board",
			"dataType" : "JSON"
		},
		columns : [ {
			data : "board_type"
		}, {
			data : "board_no"
		}, {
			data : "board_title"
		}, {
			data : "replycount"
		}, {
			data : "writer"
		}, {
			data : "board_date"
		}, {
			data : "board_hit"
		} ],
		"order" : []
	});

	//등록 버튼
	$('#createBoard').on('click',function() {
		location.href = "${pageContext.request.contextPath}/${lecture_code}/board/create";
	});

	$('#data-table-basic').on('click','a',function(e) {
		e.preventDefault();
		var no = $(this).attr("href");
		location.href = "${pageContext.request.contextPath}/${lecture_code}/board/"+ no;
	});
	
	$('#data-table-basic_filter').find('label').prop('style', 'display:none;');
	$('#data-table-basic_filter').on('click',$('#searchBtn'),function() {
		$.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
			var chosenType = $('#types').val();
			var searchWord = $('#searchInput').val();
			console.log(searchWord);

			var type = data[0];
			var no = data[1];
			var title = data[2];
			var count = data[3];
			var writer = data[4];
			var date = data[5];
			var hit = data[6];

			if ((chosenType == '전체' || chosenType == type)
					&& (searchWord == ''
							|| searchWord == no
							|| searchWord == title
							|| searchWord == count
							|| searchWord == writer
							|| searchWord == date || searchWord == hit)) {
				return true;
			}
			return false;
		});
		table.draw();
	});

	var select = $('<select>').prop('id', 'types').append(
			$('<option>').text('전체'), $('<option>').text('강좌공지'),
			$('<option>').text('일반'), $('<option>').text('질문'));
	var button = $('<button>').prop({
		type : 'button',
		'class' : 'btn btn-default notika-btn-default',
		id : 'searchBtn'
	}).text("검색");
	$('#data-table-basic_filter').prepend($('<input>').prop({
		type : 'text',
		id : 'searchInput'
	})).prepend(button).prepend(select);
</script>