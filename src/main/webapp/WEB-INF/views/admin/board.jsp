<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="data-table-list">
				<div class="table-responsive">
					<h2>게시판관리</h2>
					<button type="button" class="btn btn-default notika-btn-default"
						id="createBoard">등록</button>
					<table id="data-table-basic" class="table table-striped dataTable"
						role="grid" aria-describedby="data-table-basic_info">
						<div id="searchDiv"></div>
						<thead>
							<tr>
								<th></th>
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
			"url" : "${pageContext.request.contextPath}/manageBoard",
			"dataType" : "JSON"
		},
		columns : [ {
			data : "lecture.lecture_target"
		}, {
			data : "board_type"
		}, {
			data : "board_title"
		}, {
			data : "replycount"
		}, {
			data : "user_name"
		}, {
			data : "board_date"
		}, {
			data : "board_hit"
		} ]
		, columnDefs : [ {
	        "searchable": false,
	        "orderable": false,
	        "targets": 0
	    } ]
		, "order" : []
		,initComplete: function () {
            this.api().columns().every( function () {
                var column = this;
                var select = $('<select><option value=""></option></select>')
                   .appendTo( $('#searchDiv') )
                   .on( 'change', function () {
                      var val = $.fn.dataTable.util.escapeRegex(
                         $(this).val()
                      );
                      
                      column
                         .search( val ? '^'+val+'$' : '', true, false )
                         .draw();
                   });

                column.data().unique().sort().each( function ( d, j ) {
                   select.append( '<option value="'+d+'">'+d+'</option>' )
                });
                
             });
             $('#searchDiv').find('select:eq(0)').attr('id', 'code').css('display', 'none');
             $('#searchDiv').find('select:eq(1)').attr('id', 'name').attr('class', 'selectpicker');
             $('#searchDiv').find('select:eq(2)').attr('id', 'course').attr('class', 'selectpicker');
             $('#searchDiv').find('select:eq(3)').attr('id', 'credit').attr('class', 'selectpicker');
             $('#searchDiv').find('select:eq(4)').attr('id', 'grade').attr('class', 'selectpicker');
             $('#searchDiv').find('select:eq(5)').attr('id', 'prof').css('display', 'none');
             $('#searchDiv').find('select:eq(6)').attr('id', 'capacity').css('display', 'none');
             $("#grade").after($("#name"));
             $("#grade").after($("#course"));
             $("#grade").after($("#credit"));
             $("<span class='selectSpan'>학년</span>").insertBefore($('#grade'));
             $("<span class='selectSpan'>과목</span>").insertBefore($('#name'));
             $("<span class='selectSpan'>이수구분</span>").insertBefore($('#course'));
             $("<span class='selectSpan'>학점</span>").insertBefore($('#credit'));
          }
	});

	//등록 버튼
	$('#createBoard').on('click',function() {
		location.href = "${pageContext.request.contextPath}/manageBoard/create";
	});

	$('#data-table-basic').on('click','a',function(e) {
		e.preventDefault();  
		var no = $(this).attr("href");
		location.href = "${pageContext.request.contextPath}/manageBoard/"+ no;
	});
</script>