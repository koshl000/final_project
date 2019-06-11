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
* 관리자 교육과정관리 (강좌관리)화면
 --%>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
<style>
	tfoot { 
    	display: table-header-group; 
	}
	select {
	    border: 1px solid #eee;
	    height: 35px;
	    padding: 7px 15px;
	    font-size: 13px;
	    border-radius: 2px;
	    -webkit-appearance: none;
	    -moz-appearance: none;
	    line-height: 100%;
	    background-color: #fff;
	    outline: none;
	}
	
	select :hover  {
		background-color: #00c292 !important;
	    color: #fff !important;
	}
	.selectSpan {
		font-size: 16px;
		font-weight: bold;
		margin : 0 5px 0 20px;
	}
	#grade, #credit, #course {
		width: 60px;
	}
	tr {
		cursor:pointer;
	}
	
	
</style>
<script type="text/javascript">
	$(function() {
		var table = $('#data-table-basic').DataTable({
			ajax : {
				"type" : "get",
				"url" : "${pageContext.request.contextPath}/professor/getLectureList",
				"dataType" : "JSON"
			},
			columns : [
				{data : "openseme_year"}
				, {data : "openseme_semester"}
				, {data : "user_name"}
				, {data : "lecture_code"}
				, {data : "lecture_name"}
				, {data : "lecture_coursetype"}
				, {data : "lecture_credit"}
				, {data : "lecture_target"}
				, {data : "lecture_capacity"}
				, {data : "lecturePlanBtn"}
				, {data : "lectureAddBtn"}
			],
			"order" : []
			,
			initComplete: function () {
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
				$('#searchDiv').find('select:eq(7)').attr('id', 'lecplan').css('display', 'none');
				$("#grade").after($("#name"));
				$("#grade").after($("#course"));
				$("#grade").after($("#credit"));
				$("<span class='selectSpan'>학년</span>").insertBefore($('#grade'));
				$("<span class='selectSpan'>과목</span>").insertBefore($('#name'));
				$("<span class='selectSpan'>이수구분</span>").insertBefore($('#course'));
				$("<span class='selectSpan'>학점</span>").insertBefore($('#credit'));
			}
		});
		
		$table = $('#data-table-basic').DataTable();
		$table.on('click', '.lectureAddBtn', function() {
			var tr = $(this).parents('tr');
			$(tr).unbind("click").on("click", function() {});
			var no = table.row(tr).data().lecture_code;
			var name = table.row(tr).data().lecture_name;
			
			if (!($('.modal.in').length)) {
				$('.modal-dialog').css({
					top : 0,
					left : 0
				});
			}
			$('#myModalthree').modal({
				backdrop : false,
				show : true
			});
			$("#eee").text(name);
			$("#no").text(no);
			var normals = $('#adda').find('input:eq(65)').val();
			var finals = $('#adda').find('input:eq(131)').val();
			$("input[name=lecture_subname]").val(name);
			$('.normamlSub').val(normals);
			$('.finalSub').val(finals);
		});
		
		//강의주차수정버튼
		$table = $('#data-table-basic').DataTable();
		$table.on('click', '.lectureUpdateBtn', function() {
			var tr = $(this).parents('tr');
			var no = table.row(tr).data().lecture_code;
			var name = table.row(tr).data().lecture_name;
		});
		
		$table = $('#data-table-basic').DataTable();
		$table.on('click', '.lecPlanAddBtn', function() {
			var tr = $(this).parents('tr');
			var no = table.row(tr).data().lecture_code;
			var name = table.row(tr).data().lecture_name;
			
			if (!($('.modal.in').length)) {
				$('.modal-dialog').css({
					top : 0,
					left : 0
				});
			}
			$('#myModalfour').modal({
				backdrop : false,
				show : true
			});
			$("#eeee").text(name);
			$("#noo").text(no);
			$("input[name=lecture_subname]").val(name);
		});
		
		//
// 		$table = $('#data-table-basic').DataTable();
// 		$table.on('click', 'tr', function() {
// 			var no = table.row(this).data().lecture_code;
// 			var jsonData = {"no" : no};	
// 			$.ajax({
// 				url : "${pageContext.request.contextPath}/professor/getLectureCode",
// 				method : "get",
// 				data : jsonData,
// 				dataType : "text", // request header(Accept), response header(Content-Type),
// 				success : function(resp) {
// 					window.location.href = "${pageContext.request.contextPath}/professor/register/"+no;
// 				},
// 				error : function(errorResp) {
// 					alert("해당 강의 주차정보가 없습니다. 주차정보를 등록해주세요.");
// 					console.log(errorResp.status);
// 				}
// 			});
// 		});
		
		
		$(".lectureWeekAddBtn").on("click", function() {
			var inputs = $("#adda").find(":input");
			var sendDataTd = {};
			var no = $("#no").text();
			sendDataTd["no"]=no;
			$(inputs).each(function(index, input){
				var prop = $(this).attr("name");
				var value = $(this).val();
				sendDataTd[prop+index]=value;
			});
			var jsonData = JSON.stringify(sendDataTd);
			console.log(jsonData);
			$.ajax({
				url : "${pageContext.request.contextPath}/professor/lectureWeekAdd",
				method : "post",
				data : jsonData,
				contentType : "application/json; charset=UTF-8",
				dataType : "text", // request header(Accept), response header(Content-Type),
				success : function(resp) {
					alert("강의계획 등록이 완료되었습니다.");
					console.log(resp);
					$('#myModalthree').modal("hide");
					window.location.href = "${pageContext.request.contextPath}/professor/alectureList";
				},
				error : function(errorResp) {
					console.log(errorResp.status);
				}
			});
		});
		
		$(".lecturePlanAddBtn").on("click", function() {
			var inputs = $("#adada").find(":textarea");
			var sendDataTd = {};
			var no = $("#noo").text();
			sendDataTd["no"]=no;
			$(inputs).each(function(index, input){
				var prop = $(this).attr("name");
				var value = $(this).val();
				sendDataTd[prop]=value;
			});
			var jsonData = JSON.stringify(sendDataTd);
			console.log(jsonData);
			$.ajax({
				url : "${pageContext.request.contextPath}/professor/lecturePlanAdd",
				method : "post",
				data : jsonData,
				contentType : "application/json; charset=UTF-8",
				dataType : "text", // request header(Accept), response header(Content-Type),
				success : function(resp) {
					alert("강의계획 등록이 완료되었습니다.");
					console.log(resp);
					$('#myModalfour').modal("hide");
				},
				error : function(errorResp) {
					console.log(errorResp.status);
				}
			});
		});
	});
	
	function createLectureLocation() {
        window.location.href = "createLecture";
    }
	
	function page_link() {
		window.open("${pageContext.request.contextPath }/subjectPage/eduGoal", "상세강의보기", "width=1000, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=yes");
	}
</script>

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
									<h2>강의 리스트</h2>
									<p>
										교육과정을 조회하고 관리하는 게시판입니다. <span class="bread-ntd"></span>
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
						<table id="data-table-basic" class="table table-hover table-striped dataTable" role="grid" aria-describedby="data-table-basic_info">
							<div id="searchDiv"></div>
							<thead>
								<tr>
									<th>년도</th>
									<th>학기</th>
									<th>담당교수</th>
									<th>과목코드</th>
									<th>과목명</th>
									<th>이수구분</th>
									<th>학점</th>
									<th>학년</th>
									<th>수강인원</th>
									<th>강의계획</th>
									<th>주차</th>
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
</div>

<div class="modal fade" id="myModalthree" role="dialog">
    <div class="modal-dialog modal-large">
        <div class="modal-content">
            <div class="modal-header">
            </div>
            <div class="modal-body">
            	<div class="row">
	                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	                    <div class="widget-tabs-int">
	                        <div class="tab-hd" id="lPlandheader">
	                           <h2 id="eee"></h2>
	                           <span id="no" style="display: none"></span>
	                        </div>
	                        <div class="widget-tabs-list">
	                            <table class="table table-bordered" id="adda">
	                            	<tr>
	                            		<th>주차</th>
	                            		<th>차시</th>
	                            		<th>주차강의명</th>
	                            	</tr>
	                            	<c:forEach var="i" begin="1" end="16" varStatus="status">
	                            		<c:choose>
											<c:when test="${status.count eq 8}">
												<tr>
													<th>${i}주차</th>
													<td>1차시</td>
													<td>
														<input class="form-control" type="hidden" name="lecture_week" value="${i}" />
														<input class="form-control" type="hidden" name="lecture_class" value="1" />
														<input class="form-control normamlSub" type="text" name="lecture_subname" value="중간고사" readonly="readonly"/>
													</td>
												</tr>
											</c:when>
											<c:when test="${status.count eq 16}">
												<tr>
													<th>${i}주차</th>
													<td>1차시</td>
													<td>
														<input class="form-control" type="hidden" name="lecture_week" value="${i}" />
														<input class="form-control" type="hidden" name="lecture_class" value="1" />
														<input class="form-control finalSub" type="text" name="lecture_subname" value="기말고사" readonly="readonly"/>
													</td>
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<th rowspan="3" class="${i}">${i}주차</th>
													<td>1차시</td>
													<td>
														<input class="form-control" type="hidden" name="lecture_week" value="${i}" />
														<input class="form-control" type="hidden" name="lecture_class" value="1" />
														<input class="form-control" type="text" name="lecture_subname" value="" />
													</td>
												</tr>
												<tr>
													<td>2차시</td>
													<td>
														<input class="form-control" type="hidden" name="lecture_week" value="${i}" />
														<input class="form-control" type="hidden" name="lecture_class" value="2" />
														<input class="form-control" type="text"  name="lecture_subname" value="" />
													</td>
												</tr>
												<tr>
													<td>3차시</td>
													<td>
														<input class="form-control" type="hidden" name="lecture_week" value="${i}" />
														<input class="form-control" type="hidden" name="lecture_class" value="3" />
														<input class="form-control" type="text"  name="lecture_subname" value="" />
													</td>
												</tr>
											</c:otherwise>
										</c:choose>
	                            	</c:forEach>
								</table>
	                        </div>
	                    </div>
	                </div>
	            </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default lectureWeekAddBtn">저장</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModalfour" role="dialog">
    <div class="modal-dialog modal-large">
        <div class="modal-content">
            <div class="modal-header">
            </div>
            <div class="modal-body">
            	<div class="row">
	                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	                    <div class="widget-tabs-int">
	                        <div class="tab-hd" id="lPlandheader">
	                           <h2 id="eeee"></h2>
	                           <span id="noo" style="display: none"></span>
	                        </div>
	                        <div class="widget-tabs-list">
	                            <table class="table table-bordered" id="adada">
	                            	<tr>
	                            		<th>제목</th>
	                            		<th>내용</th>
	                            	</tr>
	                            	<tr>
	                            		<th>주별 강의 내용</th>
	                            		<td>
	                            			<textArea id="weekCon">${jlpVo.week_content }</textArea>
	                            		</td>
	                            	</tr>
	                            	<tr>
	                            		<th>학습과제물안내</th>
	                            		<td>
	                            			<textArea id="studyAssi">${jlpVo.assignment_info }</textArea>
	                            		</td>
	                            	</tr>
	                            	<tr>
	                            		<th>교수소개</th>
	                            		<td>
	                            			<textArea id="profInfo">${jlpVo.introduction }</textArea>
	                            		</td>
	                            	</tr>
	                            	<tr>
	                            		<th>교과목 개요</th>
	                            		<td>
	                            			<textArea id="lecSummary">${jlpVo.lec_plan_summary }</textArea>
	                            		</td>
	                            	</tr>
	                            	<tr>
	                            		<th>수업진행방식</th>
	                            		<td>
	                            			<textArea id="lecMethod">${jlpVo.lec_plan_method }</textArea>
	                            		</td>
	                            	</tr>
	                            	<tr>
	                            		<th>교재/참고자료</th>
	                            		<td>
	                            			<textArea id="book">${jlpVo.book_material }</textArea>
	                            		</td>
	                            	</tr>
								</table>
	                        </div>
	                    </div>
	                </div>
	            </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default lecturePlanAddBtn">저장</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.ckeditor.com/4.11.4/standard-all/ckeditor.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
	CKEDITOR.replace("weekCon");
	CKEDITOR.replace("studyAssi");
	CKEDITOR.replace("profInfo");
	CKEDITOR.replace("lecSummary");
	CKEDITOR.replace("lecMethod");
	CKEDITOR.replace("book");
</script>
