<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
	
	<!-- dialog CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/dialog/sweetalert2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/dialog/dialog.css">
	

<script type="text/javascript">
$(function(){
	var lecture_code = $("[name='lecture_code']").val();
	var lecture_name = $("[name='lecture_name']").val();
	var user_name=$('#user_name').val();
	
	settingDataTable();
	function settingDataTable() {
		$('#assignmentList') .DataTable(
						{
							ajax : {
								"type" : "get",
								"url" : "${pageContext.request.contextPath}/getAssignmentsutList?lecture_code="
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
								data : "btnView"
							}, {
								data : "submit_period1"
							}, {
								data : "submit_period2"
							}, {
								data :  "btnInsert"
							}],
							"order" : [ [ 0, 'asc' ], [ 1, 'asc' ] ],
							"bDestroy" : true
							
						});
				};
				
				
				$table = $('#assignmentList').DataTable();
				
				
				$table.on('click', '.viewbtn', function() {
							$('#assignfile_view').empty();
								var assignment_no = $(this).attr("name");
					// 			window.open("${pageContext.request.contextPath }/assignmentView","과제보기",'width=700,height=500,toolbar=no, menubar=no,location=no,resizable=yes,status=no');
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
							title+="<p><b>차시:</b>"+ resp.class_identifying_code.substring(1,0)+"차시</p>";
							title+="<p><b>과제 등록일 :</b>"+ resp.assignment_date+"</p>";
							title+="<p><b>과제제출 기한 :</b>" +resp.submit_period1+"~"+ resp.submit_period2+"</p>";
							$('#headerView').html(title);
							$('#contentView').html(resp.assignment_content);
							
							var assignmentFileList = resp.assignmentFileList;
							var btnText="첨부파일 다운로드";
							if(assignmentFileList[0].file_no){
								$(assignmentFileList).each(function(idx,assignmentFile){
									
									var asfv = "<span><i class='notika-icon notika-paperclip'></i>"+ assignmentFile.file_name
									asfv+= "<i class='notika-icon notika-arrow-right atc-sign'></i></span>"
									var href= "${pageContext.request.contextPath}/assFiledownload?what="+assignmentFile.file_no;
									
									var asfd = "<a class='btn dw-al-ft' href='"+href+"'>첨부파일다운로드";
										asfd+= "<i class='notika-icon notika-file'></i></a>"
										
										$('#assignfile_view').append(
												$('<div class="dw-atc-sn">').html(asfv+asfd),
										);
								});
							}
							
						},
						error : function(errorResp) {
							console.log(errorResp.status);
						}
					});//ajax
				});	
				
				
				$table.on('click', '.insertbtn', function() {
					$("[name='fileItem']").val("");
					$('#filename').empty();
					$('#updateSaveFile').text("저장");
					$('#updateSaveFile').attr('id','saveAssignment'); 
				
					var week =$($(this).parent().parent().find($('td'))[0]).text();
					var turn =$($(this).parent().parent().find($('td'))[1]).text();
					var stDate =$($(this).parent().parent().find($('td'))[4]).text();
					var edDate =$($(this).parent().parent().find($('td'))[5]).text();
					
					var assignment_no = $(this).attr("name");
					
					$("[name='assignment_no']").val(assignment_no);
					
					
					$('#form_title').html("<h2>"+lecture_name+" "+week+"주차"+turn+"차시 과제물</h2>");
					$('#stDate').text(stDate);
					$('#edDate').text(edDate);
					$("[name='file_title']").val(user_name+"_"+lecture_name+" "+week+"주차"+turn+"차시 과제물");
					var data = {
							"lecture_code" : lecture_code,
							"assignment_no" :assignment_no
						};
					
					$.ajax({
						url : "${pageContext.request.contextPath}/getAssignmentnSubmitFile",
						method : "post",
						data : data,
						dataType : "json",
						success : function(resp) {
							$("[name='attend_no']").val(resp.attend_no);
							$("[name='submitfile_no']").val(resp.submitfile_no);
							
							if(resp.file_date!="미재출"){
								var href= "${pageContext.request.contextPath}/submitFiledownload?attend_no="+resp.attend_no+"&"+"assignment_no="+assignment_no;                 
								var sfd ="<a class='btn dw-al-ft' href='"+href+"'>"+resp.file_name;
								sfd +="<i class='notika-icon notika-file'></i></a>";
								
								$('#subDate').text(resp.file_date);
								$('#filename').append( $('<div class="dw-atc-sn">').html(sfd));
								
								$('#saveAssignment').text("파일수정");
								$('#saveAssignment').attr('id','updateSaveFile'); 
								
							}else{
								$('#subDate').text(resp.file_date);
								$('#filename').text(resp.file_name);
								
							}
							
						},
						error : function(errorResp) {
							console.log(errorResp.status);
						}
					});//ajax
					
					
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
				
				
	$('#saveAssignment').on("click",function(event){
		        
		// Get form
		        var form = $('#submitFile')[0];
		        // Create an FormData object 
		        var data = new FormData(form);
		 
		if($(this).attr("id")=="saveAssignment"){
			
		        $.ajax({
		            type: "POST",
		            enctype: 'multipart/form-data',
		            url: "${pageContext.request.contextPath}/saveSubmitFile",
		            data: data,
		            processData: false,
		            contentType: false,
		            cache: false,
		            timeout: 600000,
		            success: function (data) {
		               swal("과제물 제출", "과제물 제출이 성공적으로 완료되었습니다.", "success"); 
						settingDataTable();
		            },
		            error: function (e) {
		                console.log("ERROR : ", e);
		               
		                alert("과제물 제출에 실패하였습니다.");
		            }
		        });
		
		}else{
			
			 $.ajax({
				            type: "POST",
				            enctype: 'multipart/form-data',
				            url: "${pageContext.request.contextPath}/updateSubmitFile",
				            data: data,
				            processData: false,
				            contentType: false,
				            cache: false,
				            timeout: 600000,
				            success: function (data) {
				                swal("과제물 수정", "과제물 수정이 성공적으로 완료되었습니다.", "success"); 
								settingDataTable();
				            },
				            error: function (e) {
				                console.log("ERROR : ", e);
				               
				                 swal("수정실패!", " 과제물 수정에 실패 하였습니다.", "error"); 
				            }
				        });
			
			}
		
		
		});
	
	
});

</script>
<input type="hidden" id="user_name" value="${user.user_name}"> 	
<div class="breadcomb-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="breadcomb-list">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<div class="breadcomb-wp">
								<div class="breadcomb-icon">
									<i class="notika-icon notika-bar-chart"></i>
								</div>
								<div class="breadcomb-ctn">
									<h2>${lecture_name} 과제물 </h2>
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
					<input type="hidden" value="${lecture_code}" name ="lecture_code" />
					<input type="hidden" value="${lecture_name}" name ="lecture_name" />
					<div class="data-table-list">
						<table id="assignmentList" class="table table-striped dataTable"
							role="grid" aria-describedby="data-table-basic_info">
							<thead>
								<tr>
									<th>주차</th>
									<th>차시</th>
									<th>강의명</th>
									<th>과제보기</th>
									<th>제출시작일</th>
									<th>제출마감일</th>
									<th>과제제출</th>
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
						<div class="mail-ads mail-vw-ph" id="headerView">
							
						</div>
						<div class="view-mail-atn" id="contentView">
							
						</div>
						<div class="file-download-system">
							<div class="dw-st-ic mg-t-20">
							
								<div id="assignfile_view" class="dw-atc-sn">
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="assignmentInsert" role="dialog">
	<div class="modal-dialog modal-large">
	<form:form id="submitFile" modelAttribute="submitFile" method="post" enctype="multipart/form-data">
	
		<div class="modal-content">
			<div class="modal-header"></div>
			<div class="modal-body">
				     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="view-mail-list sm-res-mg-t-30">
                        <div class="view-mail-hd">
                            <div class="view-mail-hrd" id="form_title">
                            
                            </div>
                        </div>
                        <div class="cmp-int mg-t-20">
                            <div class="row">
                               <table id="data-table-basic" class="table table-striped dataTable" role="grid" aria-describedby="data-table-basic_info">
                                <thead>
                                    <tr role="row" class="odd">
                                        <th>제출시작일</th>
                                        <th>제출마감일</th>
                                        <th>제출일</th>
                                        <th>제출 파일 </th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<tr role="row" class="even">
                                        <td id="stDate"></td>
                                        <td id="edDate"></td>
                                        <td id="subDate"></td>
                                        <td id="filename"></td>
                                   </tbody>
                                <tfoot>
                                <tr>
                            <td colspan="4"><input type="file" name ="fileItem"></td>
                            <tr>
                                </tfoot>
                            </table>
                            
                            <div class="row">
                                
                                <input type="hidden" name="assignment_no"/>
								<input type="hidden" name ="attend_no"/>
								<input type="hidden" name ="file_title"/>
								<input type="hidden" name ="submitfile_no"/>
                            </div>
                        </div>
                        <div class="cmp-int-box mg-t-20">
                            <div class="html-editor-cm">
                             
                            </div>
                        </div>
                        <div class="upload-sys">
                           	
                        </div>
                        <div class="vw-ml-action-ls text-right mg-t-20">
                            
                        </div>
                    </div>
                </div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" id="saveAssignment">저장</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
		</div>
		</form:form>
	</div>
</div>


	
<script	src="${pageContext.request.contextPath }/notika/js/dialog/sweetalert2.min.js"></script>

	