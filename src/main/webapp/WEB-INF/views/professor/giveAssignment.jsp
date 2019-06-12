<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 27.     김재은      최초작성
* Copyright (c) 2019 by DDIT All right reserved
* 교수 과제물 관리 화면
*
 --%>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<script
	src="${pageContext.request.contextPath }/res/js/ckeditor/ckeditor.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/notika/css/datapicker/datepicker3.css">
	
	<!-- dialog CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/dialog/sweetalert2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/dialog/dialog.css">
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
  
</style>
<script type="text/javascript">

	$(function() {
		
		$('body').on('hidden.bs.modal',function(){
			
			if($('.modal.in').length>0){
				
				$('body').addClass('modal-open');
			}
			
		});
		
		
		CKEDITOR.replace("contextArea", {
         filebrowserImageUploadUrl:"<c:url value='/assignment/imageUpload'/>"
      });
		
		var updtitle;
		var upstDate;
		var upendDate;
		var upCon;
		
		var lecture_name=$("[name='lecture']").children(":selected").text();
		settingDataTable();
		
		function settingDataTable() {
			var lecture_code = $("[name='lecture']").val();
			$('#assignmentList')
					.DataTable(
							{
								ajax : {
									"type" : "get",
									"url" : "${pageContext.request.contextPath}/getAssignmentList?lecture_code="
											+ lecture_code,
									"dataType" : "JSON"
								},
								columns : [ {
									data : "lecture_week"
								}, {
									data : "lecture_class"
								}, {
									data : "lecture_subname"
								}, {
									data : "btnInsert"
								}, {
									data : "btnView"
								}, {
									data : "assignment_date"
								}, {
									data : "submit_period1"
								}, {
									data : "submit_period2"
								} ],
								"order" : [ [ 0, 'asc' ], [ 1, 'asc' ] ],
								"bDestroy" : true

							});
				};

		$("[name='lecture']").on("change", function() {
			settingDataTable();

		});

		$table = $('#assignmentList').DataTable();
		
		$table.on('click', '.viewbtn', function() {
			$('#assignfile_view').empty();
			$('#submitheaderView').empty();
			$('#filearea').empty();
			$("[name='submitassignment_no']").val("");
			$("[name='assignment_no']").val("");
			
			
			var assignment_no = $(this).attr("name");
			$("[name='submitassignment_no']").val(assignment_no);
			$("[name='assignment_no']").val(assignment_no);
			
			if (!($('.modal.in').length)) {
				$('.modal-dialog').css({
					top : 0,
					left : 0
				});
			}
			$('#assignmentView').modal({
				backdrop : false,
				show : true
			});
			
			$.ajax({
				url : "${pageContext.request.contextPath}/getAssignmentnFile?assignment_no="+assignment_no,
				method : "get",
				dataType : "json",
				success : function(resp) {
					var title = "<p><b>제목:</b>"+resp.assignment_title+"</p>";
					title+="<p><b>주차:</b>"+resp.class_identifying_code.substring(0,1)+"주차</p>";
					title+="<p><b>차시:</b>"+ resp.class_identifying_code.substring(1,2)+"차시</p>";
					title+="<p><b>과제 등록일 :</b>"+ resp.assignment_date+"</p>";
					title+="<p><b>과제제출 기한 :</b>" +resp.submit_period1+"~"+ resp.submit_period2+"</p>";
					
					updtitle =resp.assignment_title;
					upstDate= resp.submit_period1;
					upendDate =resp.submit_period2;
					upCon =resp.assignment_content;
					
					$("[name='assignment_title']").val(updtitle);
					$("[name='submit_period1']").val(upstDate);
					$("[name='submit_period2']").val(upendDate);
					CKEDITOR.instances.contextArea.setData(upCon);	
					
					$('#headerView').html(title);
					$('#submitheaderView').html(title);
					$('#contentView').html(resp.assignment_content);
					
					var assignmentFileList = resp.assignmentFileList;
					var btnText="첨부파일 다운로드";
					if(assignmentFileList[0].file_no){
						$(assignmentFileList).each(function(idx,assignmentFile){
							
							var asfv = "<span><i class='notika-icon notika-paperclip'></i>"+ assignmentFile.file_name
							asfv+= "<i class='notika-icon notika-arrow-right atc-sign'></i></span>"
							var href= "${pageContext.request.contextPath}/assFiledownload?what="+assignmentFile.file_no;
							
							var asfd = "<a class='btn dw-al-ft' href='"+href+"'>첨부파일다운로드"
								asfd+= "<i class='notika-icon notika-file'></i></a>"
								
// 								var asfv="<a class='btn dw-al-ft' href='"+href+"' >"+assignmentFile.file_name;
// 								asfv+= "<i class='notika-icon notika-file'></i></a></div>"
								
							var asfu = "<span><i class='notika-icon notika-paperclip'></i>"+ assignmentFile.file_name
								asfu+= "<i class='notika-icon notika-close' id='"+assignmentFile.file_no+"'></i></span>"	
								
								$('#assignfile_view').append(
										$('<div class="dw-atc-sn">').html(asfv+asfd)
								)
								
								$('#filearea').append(
										$('<div class="dw-atc-sn">').html(asfu)
								)
						});
					}
					
				},
				error : function(errorResp) {
					console.log(errorResp.status);
				}
			});//ajax
			
			
		});//view
		
		
		
	$table.on('click', '.insertbtn', function() {
		$("[name='assignment_title']").val("");
		$("[name='submit_period1']").val("");
		$("[name='submit_period2']").val("");
		$("[name='ass_files']").val("");
		$('#filearea').empty();
		CKEDITOR.instances.contextArea.setData("");	
		$('#updatAssignment').text("저장");
		$('#updatAssignment').attr('id','saveAssignment'); 
		
		lecture_name=$("[name='lecture']").children(":selected").text();
		var week =$($(this).parent().parent().find($('td'))[0]).text();
		var turn =$($(this).parent().parent().find($('td'))[1]).text();
		$('#form_title').html("<h2>"+lecture_name+" "+week+"주차"+turn+"차시 과제물</h2>")
		
		var lecture_code = $("[name='lecture']").val();
		$("[name='class_identifying_code']").val(week+turn);
		$("[name='lecture_code']").val(lecture_code);
		
			if (!($('.modal.in').length)) {
				$('.modal-dialog').css({
					top : 0,
					left : 0
				});
			}
			$('#assignmentInsert').modal({
				backdrop : false,
				show : true
			});
		});

	$('#data_1 .input-group.date').datepicker({
		todayBtn : "linked",
		keyboardNavigation : false,
		forceParse : false,
		calendarWeeks : true,
		autoclose : true,
		format : "yyyy/mm/dd"

	});

	$('#data_2 .input-group.date').datepicker({
		todayBtn : "linked",
		keyboardNavigation : false,
		forceParse : false,
		calendarWeeks : true,
		autoclose : true,
		format : "yyyy/mm/dd"

		});
	$('#saveAssignment').on("click",function(event){
		
		var content = CKEDITOR.instances.contextArea.getData();	
		$("[name='assignment_content']").val(content.trim());
		        // Get form
		        var form = $('#assignment')[0];
		        // Create an FormData object 
		        var data = new FormData(form);
		 if($(this).attr("id")=="saveAssignment"){
			  $.ajax({
				            type: "POST",
				            enctype: 'multipart/form-data',
				            url: "${pageContext.request.contextPath}/saveAssignment",
				            data: data,
				            processData: false,
				            contentType: false,
				            cache: false,
				            timeout: 600000,
				            success: function (data) {
				                swal("과제물 등록", "과제물 등록에 성공하였습니다.", "success"); 
								settingDataTable();
				             
				            },
				            error: function (e) {
				                console.log("ERROR : ", e);
				               
				               swal("저장실패!", " 과제물 저장에 실패 하였습니다.", "error"); 
				            }
				        });//ajax
			
				}else{
					
					 $.ajax({
						            type: "POST",
						            enctype: 'multipart/form-data',
						            url: "${pageContext.request.contextPath}/updateAssignment",
						            data: data,
						            processData: false,
						            contentType: false,
						            cache: false,
						            timeout: 600000,
						            success: function (data) {
						                swal("과제물 수정", "과제물 수정이 성공적으로 완료되었습니다.", "success"); 
										$("#delhidediv").empty();
										$('#assignmentView').modal("hide"); 
										settingDataTable();
						            },
						            error: function (e) {
						                console.log("ERROR : ", e);
						               swal("수정실패!", " 과제물 수정에 실패 하였습니다.", "error"); 
										$("#delhidediv").empty();
										$(".notika-close").show();
										$(".notika-close").prev().show();
										$(".notika-close").parent().show();
										
										$("[name='assignment_title']").val(updtitle);
										$("[name='submit_period1']").val(upstDate);
										$("[name='submit_period2']").val(upendDate);
										CKEDITOR.instances.contextArea.setData(upCon);	
						            }
						        });//ajax
				}
		      
		
		
		});
	
	
	
	function setSubDataTable(){
		var submitassignment_no = $("[name='submitassignment_no']").val();
		var table= $('#submitdataTable')
		.DataTable(
				{
					ajax : {
						"type" : "get",
						"url" : "${pageContext.request.contextPath}/getSubmitStuList?assignment_no="+submitassignment_no,
						"dataType" : "JSON"
					},
					columns : [ {
						data : "user_name"
					}, {
						data : "user_id"
					}, {
						data : "lower_organization"
					}, {
						data : "file_name"
					}, {
						data : "file_date"
					}, {
						data : "file_markscore"
					}, {
						data : "submitfile_no"
					}],
					"order" : [ [ 0, 'asc' ], [ 1, 'asc' ] ],
					"columnDefs": [
			            {
			                
			                "render": function ( data, type, row ) {
			                	var result;
			                	
			                	if(data==null||data=="F"){
			                		result="<div class='fm-checkbox'><input type='checkbox' class='i-checks'></div>";
			                		result+="<input type='hidden' name='file_markscore' class='pfvalue'>";
			                		result+="<input type='hidden' name='submitfile_no' value='"+row.submitfile_no+"'>";
			                	}else{
			                		result="<div class='fm-checkbox'><input type='checkbox'checked=''class='i-checks'></div>"
			                		result+="<input type='hidden' name='file_markscore' class='pfvalue'>";
			                		result+="<input type='hidden' name='submitfile_no' value='"+row.submitfile_no+"'>";
			                	}
			                	
			                    return result;
			                },
			                "targets": 5
			            },{
			            	
			            	  "render": function ( data, type, row ) {
			            		 var href = "${pageContext.request.contextPath}/stuSubmitFiledownload?submitfile_no="+row.submitfile_no;
			            		 var subFilename= "<div class='dw-atc-sn'><a class='btn dw-al-ft' href='"+href+"' >"+data
			            		 subFilename+= "<i class='notika-icon notika-file'></i></a></div>"
									return subFilename;
			            	  },
			            	  "targets": 3
			            },
			            
			            { "visible": false,  "targets": [ 6 ] }
			            ],
			            "bDestroy" : true

				});
		
			table.on("draw",function(){
			 $('.i-checks').iCheck({
					checkboxClass: 'icheckbox_square-green',
					radioClass: 'iradio_square-green',
				});
			});
		
		};
		
	
	$('#viewSubmit').on("click",function(event){
		
		setSubDataTable();
		
		$('#assignmentView').modal('hide');
		
// 		$('body').addClass('modal-open');
		
		if (!($('.modal.in').length)) {
			$('.modal-dialog').css({
				top : 0,
				left : 0
			});
		}
		$('#submitList').modal({
			backdrop : false,
			show : true
		});
		
	});
	
	$('#pfCheckBtn').on("click",function(event){
		
		 $('input:checkbox').each(function() {

		     if(this.checked == true){ 
		            $(this).parents().parents().siblings('.pfvalue').val("P");
		            
		      }else{
		    	  
		    	  $(this).parents().parents().siblings('.pfvalue').val("F");
		      }

		 });
		 
			var queryString = $('#pfCheckform').serialize();
		 
			$.ajax({
				url :"${pageContext.request.contextPath}/savepfChecked",
				method : "post",
				data : queryString,
// 				dataType : "json", // request header(Accept),response header(Content-type)
				success : function(resp) {
					 swal("Pass/Fail 저장", "Pass/Fail 일괄 저장에 성공하였습니다.", "success"); 
										
				},
				error : function(errorResp) {
					swal("저장실패!", "Pass/Fail 저장에 실패 하였습니다.", "error"); 
					console.log(errorResp.status);
				}
			});
		
		});
	
	
	
		$('#delBtn').on("click",function(event){
			swal({   
				title: "해당 과제물을 삭제하시겠습니까?",   
				text: "해당 과제물과 첨부파일, 학생의 제출파일이 모두 삭제됩니다.\n삭제 이후에는 복구되지 않습니다.",   
				type: "warning",   
				showCancelButton: true,   
				confirmButtonText: "과제물 삭제",
				cancelButtonText: "취소",   
			}).then(function(){
				var submitassignment_no = $("[name='submitassignment_no']").val();
				
				$.ajax({
					url :"${pageContext.request.contextPath}/delAssignment?assignment_no="+submitassignment_no,
					method : "get",
					success : function(resp) {
						swal("과제물이 삭제되었습니다!", "삭제된 과제물은 복구되지 않습니다.", "success"); 
						$('#assignmentView').modal("hide"); 
						settingDataTable();
											
					},
					error : function(errorResp) {
						swal("과제물이 삭제실패!", "과제물 삭제에 실패하였습니다.", "error"); 
						$('#assignmentView').modal("hide"); 
						settingDataTable();
						console.log(errorResp.status);
					}
				});
				
				
			});
			
		});
		
		
		$('#updateBtn').on("click",function(event){
			
			$('#saveAssignment').text("수정");
			$('#saveAssignment').attr('id','updatAssignment'); 
			$("[name='ass_files']").val("");
			
			if (!($('.modal.in').length)) {
				$('.modal-dialog').css({
					top : 0,
					left : 0
				});
			}
			$('#assignmentInsert').modal({
				backdrop : false,
				show : true
			});
			
		});
		
		$('#filearea').on("click",".notika-close",function(event){
			
			var input = $("<input>").attr({
				type :"hidden"
				,name : "assDelFiles"
				,value :$(this).prop("id")
			}) 
			
		$("#delhidediv").append(input);
			
		$(this).prev().hide();
		$(this).parent().hide();
		$(this).hide();			
		
		});
		
		$('#closeBtn').on("click",function(event){
			$("#delhidediv").empty();
			$(".notika-close").show();
			$(".notika-close").prev().show();
			$(".notika-close").parent().show();
			
			$("[name='assignment_title']").val(updtitle);
			$("[name='submit_period1']").val(upstDate);
			$("[name='submit_period2']").val(upendDate);
			CKEDITOR.instances.contextArea.setData(upCon);	
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
								<div class="breadcomb-icon">
									<i class="notika-icon notika-edit"></i>
								</div>
								<div class="breadcomb-ctn">
									<h2>과제물 관리</h2>
									<P>과제물 등록과 채점을 하실 수 있습니다.</P>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="breadcomb-list">
				<div class="row">
					<span class='selectSpan'>과목</span><select name="lecture">
						<c:forEach var="lecture" items="${lectureList}">
						 <c:if test="${lecture.user_id eq user_id}">
							<option class="${lecture.user_id}" id="${lecture.lecture_code}"
								value="${lecture.lecture_code}">${lecture.lecture_name}</option>
							</c:if>	
						</c:forEach>
					</select>
					<div class="data-table-list">
						<table id="assignmentList" class="table table-striped dataTable"
							role="grid" aria-describedby="data-table-basic_info">
							<thead>
								<tr>
									<th>주차</th>
									<th>차시</th>
									<th>강의명</th>
									<th>등록</th>
									<th>과제보기</th>
									<th>등록일</th>
									<th>제출시작일</th>
									<th>제출마감일</th>
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
	</div>
</div>


<div class="modal fade" id="assignmentView" role="dialog">
	<div class="modal-dialog modal-large">
		<div class="modal-content">
			<div class="modal-header"></div>
			<div class="modal-body">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="view-mail-list sm-res-mg-t-30">
						<div class="view-mail-hd">
							<div class="view-mail-hrd">
								<h1>과제물 보기</h1>
							</div>
						</div>
						<div class="mail-ads mail-vw-ph" id="headerView"></div>
						<div class="view-mail-atn" id="contentView"></div>
						<div class="file-download-system">
							<div class="dw-st-ic mg-t-20">

								<div id="assignfile_view" class="dw-atc-sn"></div>
							</div>
						</div>
						<div class="vw-ml-action-ls text-right mg-t-20">
							<div class="btn-group ib-btn-gp active-hook nk-email-inbox">
								<button class="btn btn-default btn-sm waves-effect" id="updateBtn">
									<i class="notika-icon notika-edit"></i> 과제물 내용 수정
								</button>

								<button class="btn btn-default btn-sm waves-effect" id="delBtn">
									<i class="notika-icon notika-trash"></i> 과제물 삭제
								</button>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="viewSubmit">제출 내역 보기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="assignmentInsert" role="dialog">
	<div class="modal-dialog modal-large">
		<form:form id="assignment" modelAttribute="assignment" method="post"
			enctype="multipart/form-data">

			<div class="modal-content">
				<div class="modal-header"></div>
				<div class="modal-body">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="view-mail-list sm-res-mg-t-30">
							<div class="view-mail-hd">
								<div class="view-mail-hrd" id="form_title"></div>
							</div>
							<div class="cmp-int mg-t-20">
								<div class="row">
									<div class="col-lg-1 col-md-2 col-sm-2 col-xs-12">
										<div class="cmp-int-lb cmp-int-lb1 text-right"></div>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<div class="nk-int-st cmp-int-in cmp-email-over">
												<input type="text" name="assignment_title"
													class="form-control" placeholder="제목을 입력해주세요" />
												<form:errors path="assignment_title" element="span"
													cssClass="error" />
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
										<div class="form-group nk-datapk-ctm form-elet-mg" id="data_1"
											name="data_1">
											<div class="input-group date nk-int-st">
												<span class="input-group-addon"></span> <input type="text"
													name="submit_period1" id="st_date" class="form-control"
													placeholder="제출 시작일">
												<form:errors path="submit_period1" element="span"
													cssClass="error" />
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
										<div class="form-group nk-datapk-ctm form-elet-mg" id="data_2"
											name="data_2">
											<div class="input-group date nk-int-st">
												<span class="input-group-addon"></span> <input type="text"
													name="submit_period2" id="ed_date" class="form-control"
													placeholder="제출 종료일">
												<form:errors path="submit_period2" element="span"
													cssClass="error" />
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<input type="hidden" name="class_identifying_code" />
									<input type="hidden" name="lecture_code" />
									<input type="hidden" name="assignment_no" />
								</div>
							</div>
							<div class="cmp-int-box mg-t-20">
								<div class="html-editor-cm">
									<textarea id="contextArea" rows="20" cols="50"></textarea>
									<input type="hidden" name="assignment_content" />
									
								</div>
							</div>
							<div id="filearea">
							
							</div>
							<div class="upload-sys">
								<input type="file" name="ass_files"> 
								<input type="file" name="ass_files"> 
								<input type="file" name="ass_files">
							</div>
							<div class="vw-ml-action-ls text-right mg-t-20" id="delhidediv"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="saveAssignment">저장</button>
					<button type="button" class="btn btn-default" data-dismiss="modal" id="closeBtn">닫기</button>
				</div>
			</div>
		</form:form>
	</div>
</div>


<div class="modal fade" id="submitList" role="dialog">
	<div class="modal-dialog modal-large">
		<div class="modal-content" style="padding: 70px 25px 50px 25px">
			<div class="modal-header"></div>
			<div class="modal-body">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="view-mail-hrd">
						<h1>제출 내역 보기</h1>
						<h4>체크박스를 눌러 Pass/Fail를 지정하고 등록을 누르시면 저장됩니다.</h4>
					</div>
					<div class="mail-ads mail-vw-ph" id="submitheaderView"></div>
					<div class="data-table-list">
						<input type="hidden" name="submitassignment_no" />
						<form:form id="pfCheckform" method="post">
						<table id="submitdataTable" class="table table-striped dataTable"
							role="grid" aria-describedby="data-table-basic_info"
							style="width: 100%">
							<thead>
								<tr>
									<th>성명</th>
									<th>학번</th>
									<th>소속학과</th>
									<th>제출파일</th>
									<th>제출날짜</th>
									<th>Pass/Fail</th>
									<th>no</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
							<tfoot>
							</tfoot>
						</table>
						</form:form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<div class="btn-group ib-btn-gp active-hook nk-email-inbox">
					<button class="btn btn-default btn-sm waves-effect" id="pfCheckBtn">
						<i class="notika-icon notika-edit"></i>Pass/Fail등록
					</button>
				</div>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>





<script
	src="${pageContext.request.contextPath }/notika/js/datapicker/bootstrap-datepicker.js"></script>

<!-- icheck JS
		============================================ -->
<script
	src="${pageContext.request.contextPath }/notika/js/icheck/icheck.min.js"></script>
<script
	src="${pageContext.request.contextPath }/notika/js/icheck/icheck-active.js"></script>
	
<script	src="${pageContext.request.contextPath }/notika/js/dialog/sweetalert2.min.js"></script>
