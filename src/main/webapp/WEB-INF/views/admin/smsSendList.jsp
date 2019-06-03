<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Data Table JS
		============================================ -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/jquery.dataTables.min.css">
<!-- normalize CSS
		============================================ -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/normalize.css">
<style>
	.table-responsive {
		display: inline;
	}
	#sendUserList {
		float : right;
		width: 60%;
		height: 60%;
		overflow-y: scroll;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		var table = $('#data-table-basic').DataTable({
			ajax: {
				"type" : "get",
				"url" : "${pageContext.request.contextPath}/sms/menualSend",
				"dataType" : 'JSON'
			},
			columns : [
				{data : "checkbox"} ,
				{data : "user_id"} ,
				{data : "user_name"} ,
				{data : "user_hp"} ,
				{data : "lower_organization"} ,
				{data : "button"} 
			]
		});
		
		$('#checkAll').on('click', function(){
			$('.checkbox').prop('checked', this.checked);
		});
		
		var table = $('#data-table-basic').DataTable();
		$('#data-table-basic tbody').on( 'click','.btn', function () {
			var tr = $(this).parents('tr');
			var name = table.row(tr).data().user_name;
			var hp = table.row(tr).data().user_hp;
			
// 			console.log(tr);
// 		    console.log( table.row(tr).data().user_name );
		    $('#sendUserList').append("<option value='"+name+"|"+hp+"'>"+name+"|"+hp+"</option>");
// 		    $(this).attr('onclick', '').unbind('click');
		    $(this).unbind('click');
		});
	
	})	
	
</script>

<div class="data-table-area">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
					<div class="basic-tb-hd">
						<h2>수강신청목록</h2>
					</div>
					<div class="table-responsive">
						<table id="data-table-basic" class="table table-striped dataTable table-hover"
							role="grid" aria-describedby="data-table-basic_info">
							<thead>
								<tr>
									<th><input type="checkbox" id="checkAll" /></th>
									<th>번호</th>
									<th>카테고리</th>
									<th>제목</th>
									<th>발송대상</th>
									<th>내용</th>
									<th>발송일</th>
									<th>발송타입</th>
									<th>비고</th>
								</tr>
							</thead>
							<tbody id="dataBody">
							</tbody>
						</table>
					</div>
				</div>
			<div class="col-md-6">
				<div style="background-color:#ebebeb;">
					<p class="float_l" style="margin:10px 0 0 10px;">선택&nbsp;학생(<span id="SelectTotalCnt" class="fontred fs_14">0</span>)명</p>
					<div>
						<button type="button" onclick="smsSelectReset;"><span>초기화</span></button>
					</div>
				</div>
				<select name="sms" id="sendUserList" multiple="multiple" >
				</select>
			</div>
		</div>
	</div>
</div>

<script src="${pageContext.request.contextPath }/notika/js/data-table/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/notika/js/data-table/data-table-act.js"></script>
