<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 2.      AA      최초작성
* Copyright (c) 2019 by DDIT All right reserved
*
* 관리자 강의운영관리(평가정책관리) 화면
 --%>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<script type="text/javascript">
	$(function() {
		settingDataTable();
				$('#add').click(function() {
					  // reset modal if it isn't visible
					  if (!($('.modal.in').length)) {
					    $('.modal-dialog').css({
					      top: 0,
					      left: 0
					    });
					  }
					  $('#addmodal').modal({
					    backdrop: false,
					    show: true
					  });
					 
					});
				
				$('.btnSubmit').click(function(){
					var pageParam= $(this).prop("id");
					var ratioA = $(this).parent().parent().find ($("[name='A']")).val();
					if(ratioA==""||ratioA==null){
						ratioA=0;
					}
					var ratioB = $(this).parent().parent().find ($("[name='B']")).val();
					if(ratioB=="" ||ratioB==null){
						ratioB=0;
					}
					var ratioC = $(this).parent().parent().find ($("[name='C']")).val();
					if(ratioC==""||ratioC==null){
						ratioC=0;
					}
					var ratioD = $(this).parent().parent().find ($("[name='D']")).val();
					if(ratioD=="" || ratioD==null){
						ratioD=0;
					}
					var ratioF = $(this).parent().parent().find ($("[name='F']")).val();
					if(ratioF==""||ratioF==null ){
						ratioF=0;
					}
					var sum =parseInt(ratioA)+parseInt(ratioB)+parseInt(ratioC)+parseInt(ratioD)+parseInt(ratioF);
					if(sum!=100){
						alert("평가 비율 합계가 100보다 크거나 작습니다. 다시 입력해주세요");
						$(".form-control").val("");
					}else{
						if(pageParam=="addGraderank"){
							var openseme_no = $("[name='semester']").val();
							var data = {
									"ratioA" : ratioA,
									"ratioB" : ratioB,
									"ratioC" : ratioC,
									"ratioD" : ratioD,
									"ratioF" : ratioF,
									"openseme_no": openseme_no	
								};
							
						}else{
							var evalpolicy_code = $("[name='ecode']").val();
							var data = {
									"ratioA" : ratioA,
									"ratioB" : ratioB,
									"ratioC" : ratioC,
									"ratioD" : ratioD,
									"ratioF" : ratioF,
									"evalpolicy_code": evalpolicy_code	
								};
							
						}
						
						$.ajax({
							url : "${pageContext.request.contextPath}/"+pageParam,
							method : "post",
							data : data,
							dataType : "text",
							success : function(resp) {
								$('#addmodal').modal("hide");
								location.href = '/projecttemplate/operation/policy';
							},
							error : function(errorResp) {
								console.log(errorResp.status);
							}
						});//ajax
						
					}
					
				});
					
function settingDataTable(){
	$('#policyList').DataTable(
			{
				ajax : {
					"type" : "get",
					"url" : "${pageContext.request.contextPath}/policyManagementList",
					"dataType" : "JSON"
				},
				columns : [ {
					data : "yearSemestr"
				}, {
					data : "openseme_period1"
				}, {
					data : "openseme_period2"
				}, {
					data : "rank_a"
				}, {
					data : "rank_b"
				}, {
					data : "rank_c"
				}, {
					data : "rank_d"
				}, {
					data : "rank_f"
				},{
					data : "btnUpdate"
				}

				],
				 "order": [[ 2, "desc" ]]
			});
	
	
};
	$table = $('#policyList').DataTable();
	$table.on('click', '.updatebtn', function () { 
		var upsemester = $($(this).parent().parent().find($('td'))[0]).text();
		var valA= $($(this).parent().parent().find($('td'))[3]).text();
		var valB= $($(this).parent().parent().find($('td'))[4]).text();
		var valC= $($(this).parent().parent().find($('td'))[5]).text();
		var valD= $($(this).parent().parent().find($('td'))[6]).text();
		var valF= $($(this).parent().parent().find($('td'))[7]).text();
		var ecode = $(this).prop("name");
		
		$("[name ='A']").attr( 'placeholder', 'A:'+valA);
		$("[name ='B']").attr( 'placeholder', 'B:'+valB);
		$("[name ='C']").attr( 'placeholder', 'C:'+valC);
		$("[name ='D']").attr( 'placeholder', 'D:'+valD);
		$("[name ='F']").attr( 'placeholder', 'F:'+valF);
		
		$("[name='upsemester']").text(upsemester);
		
		$("[name='ecode']").val(ecode);
		
		if (!($('.modal.in').length)) {
		    $('.modal-dialog').css({
		      top: 0,
		      left: 0
		    });
		  }
		  $('#updatemodal').modal({
		    backdrop: false,
		    show: true
		  });
	
	});
	
	$('.cancle').click(function() {
		
		$(".form-control").val("");
		
		$("[name ='A']").attr( 'placeholder', 'A');
		$("[name ='B']").attr( 'placeholder', 'B');
		$("[name ='C']").attr( 'placeholder', 'C');
		$("[name ='D']").attr( 'placeholder', 'D');
		$("[name ='F']").attr( 'placeholder', 'F');
		
	});
		

});
</script>
<div class="breadcomb-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="breadcomb-list">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<div class="breadcomb-wp">
								<div class="breadcomb-ctn">
									<h2>평가정책관리</h2>
									<p>
										<span class="bread-ntd"></span>
									</p>
								</div>

								<div class="col-sm-6 col-md-6 col-sm-6 col-xs-12">
									<div class="notika-todo-btn" id="add" >
										<p  class="pull-right btn btn-primary btn-sm">평가정책
											추가</p>
									</div>
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
					<table id="policyList" class="table table-striped dataTable"
						role="grid" aria-describedby="data-table-basic_info">
						<thead>
							<tr>
								<th>학기</th>
								<th>학기 시작일</th>
								<th>학기 종료일</th>
								<th>A</th>
								<th>B</th>
								<th>C</th>
								<th>D</th>
								<th>F</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div id="addmodal" class="modal modelss">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4>평가정책 추가</h4>
				</div>
				<div class="modal-body">
				<span>학기구분</span>
					<select name="semester">
					<c:forEach var="semester" items="${addSemesterList}">
						<option id="${semester.openseme_no}"
							value="${semester.openseme_no}">
							${semester.openseme_year}년도 ${semester.openseme_semester}학기</option>
					</c:forEach>
					</select>
					<p>평가비율-%를 제외한 숫자로만 입력해주세요. 모든 등급의 합은 100(%)가 되어야 합니다.</p>
						<input type="number" name ="A" min="0" max="100" class="form-control" placeholder="A" >
                        <input type="number" name="B" min="0" max="100" class="form-control" placeholder="B">
                        <input type="number" name ="C" min="0" max="100" class="form-control" placeholder="C">
                        <input type="number" name="D" min="0" max="100" class="form-control" placeholder="D">
                        <input type="number" name="F" min="0" max="100" class="form-control" placeholder="F">
						<input type="hidden" name="ecode"/>
					</div>
						
					<div class="modal-footer">
						<button type="button" class="btn btn-primary btnSubmit" id="addGraderank">저장</button>
						<button type="button" class="btn btn-secondary cancle"
							data-dismiss="modal" >취소</button>
					</div>
				</div>
			</div>
		</div>
		
		
		<div id="updatemodal" class="modal modelss">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4>평가정책 수정</h4>
				</div>
				<div class="modal-body">
				<div>학기구분</div>
				<div name ="upsemester"></div>	
				<div id="preRank"></div>	
				
					<p>평가비율-%를 제외한 숫자로만 입력해주세요. 모든 등급의 합은 100(%)가 되어야 합니다.</p>
						<input type="number" name ="A" min="0" max="100" class="form-control" placeholder="A" >
                        <input type="number" name="B" min="0" max="100" class="form-control" placeholder="B">
                        <input type="number" name ="C" min="0" max="100" class="form-control" placeholder="C">
                        <input type="number" name="D" min="0" max="100" class="form-control" placeholder="D">
                        <input type="number" name="F" min="0" max="100" class="form-control" placeholder="F">
					</div>
						
					<div class="modal-footer">
						<button type="button" class="btn btn-primary btnSubmit" id="updateGraderank">수정</button>
						<button type="button" class="btn btn-secondary cancle"
							data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		
		
		