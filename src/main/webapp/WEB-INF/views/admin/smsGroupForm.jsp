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
.sgUpdate {
	display: none;
}
</style>
<script type="text/javascript">
	$(function() {
		var table = $('#data-table-basic').DataTable({
			// 			"scrollY" : "200px",
			// 			"scrollCollapse" : true,
			// 			"paging" : false,
			ajax : {
				"type" : "get",
				"url" : "${pageContext.request.contextPath}/sms/getUserList",
				"dataType" : 'JSON'
			},
			columns : [
				{ data : "checkbox" }
			    , { data : "user_id" }
			    , { data : "user_name" }
			    , { data : "user_hp" }
			    , { data : "lower_organization" }
			    , { data : "button" } 
			]
		});
		
		$('#studCheckAll').on('click', function() {
			$('.checkbox').prop('checked', this.checked);
		});
		
		var table = $('#data-table-basic').DataTable();
		$('#data-table-basic tbody').on('click', '.btn', function() {
			var tr = $(this).parents('tr');
			var name = table.row(tr).data().user_name;
			var id = table.row(tr).data().user_id;
			var hp = table.row(tr).data().user_hp;
			appendFunc({
				id : id,
				name : name,
				hp : hp
			});
		});
		
		function appendFunc(data) {
			//selector를 제외한 함수들은 값이 배열로 돌아온다 ==> find()
			var exist = $('#sendUserList').find(
					"option[value='" + data.id + "']").length > 0;
			if (!exist)
				$('#sendUserList').append(
						"<option value='"+data.id+"' class='userData'>" + data.name + "|"
								+ data.hp + "</option>");
		}
		
		$('#sendUserList').on('click', function() {
			$('#sendUserList option:selected').remove();
		});

		$('#nextBtn').on('click', function() {
			$("input[name=smsCheck]:checked").each(function() {
				var tr = $(this).parents('tr');
				var name = table.row(tr).data().user_name;
				var id = table.row(tr).data().user_id;
				var hp = table.row(tr).data().user_hp;
				appendFunc({
					id : id,
					name : name,
					hp : hp
				});
			});
		});
		
		$('.smsGroupSave').on('click', function(){
			if($(".inputTd").find('input[name=smsgroup_name]').val()=="") {
				alert('그룹명을 입력해주세요');
				return;
			};
			var smsgroup_name = $(".inputTd").find('input[name=smsgroup_name]').val();
			var smsGroupStudent = {};
			smsGroupStudent["smsgroup_name"] = smsgroup_name;
			
			$("#sendUserList>option").each(function(i, e){
				var studId = $(this).val();
				var realhp = $(this).text().substring( ($(this).text().indexOf("|"))+1 );
				smsGroupStudent[studId]=realhp;
			});

			var jsonData = JSON.stringify(smsGroupStudent);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/sms/smsGroupAdd",
				method : "post",
				data : jsonData,
				contentType : "application/json; charset=UTF-8",
				dataType : "text", // request header(Accept), response header(Content-Type),
				success : function(resp) {
					console.log(resp);
					window.location.href = 'smsGroupList';
				},
				error : function(errorResp) {
					console.log(errorResp.status);
				}
			});
		});
		
		$('.smsGroupUpdate').on('click', function(){
			if($(".inputTd").find('input[name=smsgroup_name]').val()=="") {
				alert('그룹명을 입력해주세요');
				return;
			};
			var smsgroup_name = $(".inputTd").find('input[name=smsgroup_name]').val();
			var smsgroup_no = $(".inputTd").find('input[name=smsgroup_no]').val();
			var smsGroupStudent = {};
			smsGroupStudent["smsgroup_name"] = smsgroup_name;
			smsGroupStudent["smsgroup_no"] = smsgroup_no;
			
			$("#sendUserList>option").each(function(i, e){
				var studId = $(this).val();
				var realhp = $(this).text().substring( ($(this).text().indexOf("|"))+1 );
				smsGroupStudent[studId]=realhp;
			});

			var jsonData = JSON.stringify(smsGroupStudent);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/sms/smsGroupUpdate",
				method : "post",
				data : jsonData,
				contentType : "application/json; charset=UTF-8",
				dataType : "text", // request header(Accept), response header(Content-Type),
				success : function(resp) {
					console.log(resp);
					window.location.href = 'smsGroupList';
				},
				error : function(errorResp) {
					console.log(errorResp.status);
				}
			});
		});
		
		
		
	});

	function smsSelectReset() {
		$('#sendUserList').empty();
	};

	function formLocation() {
        window.location = "smsGroupForm";
    }
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
					<div class="basic-tb-hd sgAdd">
						<h2>SMS 그룹등록</h2>
					</div>
					<div class="basic-tb-hd sgUpdate">
						<h2>SMS 그룹수정</h2>
					</div>
					<div class="table-responsive">
						<div class="smsGroupFormBox">
						<form method="post" id="smsSend">
							<table class="qwerTable">
									<tr>
										<th><img src="${pageContext.request.contextPath }/res/images/icon_title01.png">
											그룹&nbsp;이름</th>
										<td width="*.*" colspan="3" class="inputTd">
											<c:set var="groupUserList" value="${list }" />
											<c:choose>
											<c:when test="${not empty groupUserList}">
												<input type="text" name="smsgroup_name" class="form-control" value="${groupUserList[0].smsgroup_name }" placeholder="그룹명"/>
											</c:when>
											<c:otherwise>
												<input type="text" name="smsgroup_name" class="form-control inputGroupName" placeholder="그룹명" />
											</c:otherwise>
											</c:choose>
											<input type="hidden" name="smsgroup_no" value="${groupUserList[0].smsgroup_no}" />
										</td>
									</tr>
									<tr>
										<th><img
											src="${pageContext.request.contextPath }/res/images/icon_title01.png">
											학생&nbsp;선택</th>
										<td>
											<div class="row">
											<div class="data1">
												<div class="table-responsive" id="tableBox">
													<table id="data-table-basic">
														<thead>
															<tr>
																<th><input type="checkbox" id="studCheckAll" /></th>
																<th>아이디</th>
																<th>이름</th>
																<th>번호</th>
																<th>학과</th>
																<th>비고</th>
															</tr>
														</thead>
														<tbody id="dataBody">
														</tbody>
													</table>
												</div>
											</div>
											<div class="data2" id="btnBox">
												<div class="BtnTBlack20">
													<button type="button" id="nextBtn">
														<span
															style="font-size: 15px; font-weight: bold; padding: 5px 0 5px 3px">▶</span>
													</button>
												</div>
											</div>
											<div class="data3" id="selectListBox">
												<div style="background-color: #ebebeb;">
													<p class="float_l" style="margin: 10px 0 0 10px;">
														선택&nbsp;학생(<span id="SelectTotalCnt" class="fontred fs_14"></span>)명
													</p>
													<div>
														<button type="button" onclick="smsSelectReset();">
															<span>초기화</span>
														</button>
													</div>
												</div>
												<select name="sendUserList" id="sendUserList" multiple="multiple">
													<c:if test="${not empty list}">
														<c:forEach items="${list}" var="item" varStatus="vs">
															<option value="${item.user_id}" class="userData"> ${item.user_name}|${item.user_hp}</option>
														</c:forEach>
													</c:if>
												</select>
											</div>
											</div>
										</td>
									</tr>
							</table>
							<div class="list_Toolbar mt_20 align_c">
								<span class="BtnRed30 align_c">
									<button type="button" class="btn btn-default notika-btn-default waves-effect smsGroupList" onclick="listLocation()">목록보기</button>
									<c:choose>
										<c:when test="${not empty groupUserList}">
											<button type="button" class="btn btn-success notika-btn-success waves-effect smsGroupUpdate" >저장하기</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-success notika-btn-success waves-effect smsGroupSave" >저장하기</button>
										</c:otherwise>
									</c:choose>
									<button type="button" class="btn btn-success notika-btn-success waves-effect smsListDelete" >삭제하기</button>
								</span>
							</div>
						</form>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

