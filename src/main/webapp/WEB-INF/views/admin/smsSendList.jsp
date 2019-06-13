<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Data Table JS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/notika/css/jquery.dataTables.min.css">
<!-- normalize CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/notika/css/normalize.css">
<style>
	td {
		overflow: hidden;
		text-overflow: ellipsis;
	}
</style>
<script type="text/javascript">

	$(function() {
		
		var groupListTable = $('#sms-group-send-list').DataTable({
			ajax : {
				"type" : "get",
				"url" : "${pageContext.request.contextPath}/sms/getSmsSendList",
				"dataType" : 'JSON'
			},
			columns : [
				{ data : "sms_no" }
				, { data : "sms_groupid" }
			    , { data : "sms_title" }
			    , { data : "sms_content" }
			    , { data : "sms_date" }
			    , { data : "sms_type" }
			    , { data : "sms_category" }
			    , { data : "reservCancelBtn" }
			],
			"order" : []
			,
		});
		
		var table = $('#sms-group-send-list').DataTable();
		$('#sms-group-send-list tbody').on('click', '.reservCancel', function() {
			var tr = $(this).parents('tr');
			var no = table.row(tr).data().sms_groupid;
			var jsonData = {"no" : no};	
			
			alert("예약이 취소되었습니다");
			$(this).hide();
			
// 			$.ajax({
// 				url : "${pageContext.request.contextPath}/sms/smsSendCancle",
// 				method : "get",
// 				data : jsonData,
// 				dataType : "text", // request header(Accept), response header(Content-Type)
// 				success : function(resp) {
// 					console.log(resp);
// 					$(this).hide();
// 					window.location.href = 'groupSendListRe';
// 				},
// 				error : function(errorResp) {
// 					console.log(errorResp.status);
// 				}
// 			});
		});
	});
	
	var now = getTimeStamp();
	console.log(now);
	
	function getTimeStamp() {
	  var d = new Date();
	  var s =
	    leadingZeros(d.getFullYear(), 4) + '-' +
	    leadingZeros(d.getMonth() + 1, 2) + '-' +
	    leadingZeros(d.getDate(), 2) + ' ' +

	    leadingZeros(d.getHours(), 2) + ':' +
	    leadingZeros(d.getMinutes(), 2) + ':' +
	    leadingZeros(d.getSeconds(), 2);

	  return s;
	}

	function leadingZeros(n, digits) {
	  var zero = '';
	  n = n.toString();

	  if (n.length < digits) {
	    for (i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}


</script>

<div class="main">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="data-table-list">
					<div class="basic-tb-hd sgList">
						<h2>SMS 발송내역</h2>
					</div>
					<div class="table-responsive">
						<div class="smsGroupListBox">
							<div style="float:right;">
								<button type="button" class="btn btn-success notika-btn-success waves-effect smsGroupAdd">그룹등록</button>
							</div>
							<table id="sms-group-send-list">
								<thead>
									<tr>
										<th>번호</th>
										<th>그룹번호</th>
										<th>발송대상</th>
										<th>메세지</th>
										<th>발송날짜[예약날짜]</th>
										<th>발송타입</th>
										<th>발송결과</th>
										<th>취소</th>
									</tr>
								</thead>
								<tbody id="dataBody">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

