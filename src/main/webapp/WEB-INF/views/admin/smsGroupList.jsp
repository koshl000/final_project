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
tr {
	height: 20px !important;
}

.table-responsive {
	display: inline;
}

#sendUserList {
	float: right;
	width: 100%;
	height: 500px;
	overflow-y: scroll;
}

#data-table-basic {
	overflow: auto;
	font-size: 12px !important;
}

.sms_div1 {
	width: 300px;
	height: 300px;
	margin: auto;
	display: block;
	background:
		url('${pageContext.request.contextPath }/res/images/phone_bg4.png')
		repeat-x 0 0 transparent;
	text-align: center;
}

.smstextarea {
	width: 280px;
	height: 230px;
	background-color: transparent;
	border: 0px solid;
	margin-top: 35px;
	overflow-y: auto;
	word-break: break-all;
}

.fontred {
	font-weight: bold;
	color: #ed5f00 !important;
}

#smsCont {
	background: #fff;
}


.comment {
	color: #959595;
	font-size: 12px !important;
}
.qwerTable {
	font-size: 12px !important;
    table-layout: fixed;
    border-top: 2px solid #7b7b7b;
    border-bottom: 2px solid #7b7b7b;
    border-collapse: collapse;
}
.qwerTable tr td {
	with:800px;
	padding: 13px 13px 13px 13px;
    text-align: left;7
    border-bottom: 1px #ebebeb solid;
}
.qwerTable tr th {
    padding: 13px 0 13px 13px;
    text-align: left;
    border-bottom: 1px solid #cecece;
    background: #ebebeb;
    font-size: 12px;
    font-weight: bold;
}
.list_Toolbar {
    margin-bottom: 10px;
    overflow: hidden;
}
.mt_20 {
    margin-top: 20px !important;
}
.align_c {
    text-align: center !important;
}
input:focus {
	border: 1px solid #00c292;
}
.form-control input:focus {
	border: 1px solid #00c292;
	outline-color:  #00c292;
}
</style>
<script type="text/javascript">
	$(function() {
		
		var groupListTable = $('#sms-group-list').DataTable({
			ajax : {
				"type" : "get",
				"url" : "${pageContext.request.contextPath}/sms/getSmsGroupList",
				"dataType" : 'JSON'
			},
			columns : [
				{ data : "checkbox" }
			    , { data : "smsgroup_no" }
			    , { data : "smsgroup_name" }
			    , { data : "user_count" }
			    , { data : "sendButton" }
			    , { data : "updateButton" }
			    , { data : "deleteButton" }
			]
		});
		
		$('#groupCheckAll').on('click', function() {
			$('.groupCheckbox').prop('checked', this.checked);
		});

		var table = $('#sms-group-list').DataTable();
		$('#sms-group-list tbody').on('click', '.updateButton', function() {
			var tr = $(this).parents('tr');
			var no = table.row(tr).data().smsgroup_no;
			var jsonData = {"no" : no};			
			$.ajax({
				url : "${pageContext.request.contextPath}/sms/smsGroupUpdate",
				method : "get",
				data : jsonData,
				dataType : "html", // request header(Accept), response header(Content-Type)
				success : function(resp) {
					console.log(resp);
					$(".main").html(resp);
				},
				error : function(errorResp) {
					console.log(errorResp.status);
				}
			});
		});
		
		var table = $('#sms-group-list').DataTable();
		$('#sms-group-list tbody').on('click', '.deleteButton', function() {
			var tr = $(this).parents('tr');
			var no = table.row(tr).data().smsgroup_no;
			var jsonData = {"no" : no};		
			$.ajax({
				url : "${pageContext.request.contextPath}/sms/smsGroupDelete",
				method : "get",
				data : jsonData,
				dataType : "html", // request header(Accept), response header(Content-Type)
				success : function(resp) {
// 					console.log(resp);
// 					$(".main").html(resp);
					window.location.href = 'smsGroupList';
				},
				error : function(errorResp) {
					console.log(errorResp.status);
				}
			});
		});
		
		$('#sms-group-list tbody').on('click', '.sendButton', function() {
			var tr = $(this).parents('tr');
			var no = table.row(tr).data().smsgroup_no;
			var jsonData = {"no" : no};	
			$.ajax({
				url : "${pageContext.request.contextPath}/sms/groupSendList",
				method : "get",
				data : jsonData,
				dataType : "html", // request header(Accept), response header(Content-Type)
				success : function(resp) {
					console.log(resp);
					$(".main").html(resp);
				},
				error : function(errorResp) {
					console.log(errorResp.status);
				}
			});
		});
		
		$(".smsGroupAdd").on('click', function() {
	        $.ajax({
				url : "${pageContext.request.contextPath}/sms/smsGroupForm",
				method : "get",
				dataType : "html", // request header(Accept), response header(Content-Type),
				success : function(resp) {
//	 				console.log(resp);
					$(".main").html(resp);
				},
				error : function(errorResp) {
					console.log(errorResp.status);
				}
			});
		})

	});
	
	function listLocation() {
        window.location = "smsGroupList";
    }
	function sendLocation() {
        window.location = "smsGroupSend";
    }
</script>

<div class="main">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="data-table-list">
					<div class="basic-tb-hd sgList">
						<h2>SMS 그룹목록</h2>
					</div>
					<div class="table-responsive">
						<div class="smsGroupListBox">
							<div style="float:right;">
								<button type="button" class="btn btn-success notika-btn-success waves-effect smsGroupAdd">그룹등록</button>
							</div>
							<table id="sms-group-list">
								<thead>
									<tr>
										<th><input type="checkbox" id="groupCheckAll" /></th>
										<th>그룹번호</th>
										<th>그룹이름</th>
										<th>소속학생</th>
										<th>SMS발송</th>
										<th>그룹수정</th>
										<th>그룹삭제</th>
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

