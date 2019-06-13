<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
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
    
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 2.      AA      최초작성
* Copyright (c) 2019 by DDIT All right reserved
*
* 관리자 기초정보관리 화면
 --%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/datapicker/datepicker3.css">
<script type="text/javascript">
	$(function(){
	$('body').on('hidden.bs.modal',function(){
			
			if($('.modal.in').length>0){
				
				$('body').addClass('modal-open');
			}
			
		});
		
		settingDataTable();
		function settingDataTable() {
			$('#basicInfoList').DataTable(
							{
								ajax : {
									"type" : "get",
									"url" : "${pageContext.request.contextPath}/getbasicInfoList",
									"dataType" : "JSON"
								},
								columns : [ {
									data : "openseme_year"
								}, {
									data : "openseme_semester"
								}, {
									data : "openseme_period1"
								}, {
									data : "openseme_period2"
								}, {
									data : "viewBtn"
								},{
									data : "openseme_no"
								}],
								"order" : [ [ 0, 'desc' ], [ 1, 'desc' ] ],
								"bDestroy" : true,
								"columnDefs": [{
									"render": function ( data, type, row ) {
					                	var result;
					                		result = "<button class='btn btn-default notika-btn-default viewplanBtn'"; 
					                		result+="' value='"+row.openseme_no+"'>상세보기/수정</button></td>";
					                    return result;
					                },
					                "targets": 4
									
								}, { "visible": false,  "targets": [ 5 ]}]
					});
			};
			
		
	$('#createBtn').on("click",function(event){
// 		$('#insertForm input').val("");

				$("[name='openseme_period1']").val("2019/08/01");  
				$("[name='openseme_period2']").val("2019/12/31");  
				$("[name='openseme_attend1']").val("2019/07/10");
				$("[name='openseme_attend2']").val("2019/07/17");
				$("[name='openseme_registgrade1']").val("2019/10/15");
				$("[name='openseme_registgrade2']").val("2019/10/22");
				$("[name='openseme_checkgrade1']").val("2019/10/23");
				$("[name='openseme_checkgrade2']").val("2019/10/30");
				$("[name='openseme_registgrade3']").val("2019/12/18");
				$("[name='openseme_registgrade4']").val("2019/12/24");
				$("[name='openseme_checkgrade3']").val("2019/12/25");
				$("[name='openseme_checkgrade4']").val("2019/12/31");
				$("[name='openseme_evaluate1']").val("2019/12/25");
				$("[name='openseme_evaluate2']").val("2019/12/30");
		
		if (!($('.modal.in').length)) {
			$('.modal-dialog').css({
				top : 0,
				left : 0
			});
		}
		$('#insertmodal').modal({
			backdrop : false,
			show : true
		});
	
	});		
			

	$('.input-group.date').datepicker({
		todayBtn : "linked",
		keyboardNavigation : false,
		forceParse : false,
		calendarWeeks : true,
		autoclose : true,
		format : "yyyy/mm/dd"

		});
	
	
	$('#saveInfo').on("click",function(event){
		var queryString = $('#insertForm').serialize();
		
		$.ajax({
			url :"${pageContext.request.contextPath}/saveInfo",
			method : "post",
			data : queryString,
			success : function(resp) {
				 swal("학기 및 기간 등록", "학기 및 기간 등록에 성공하였습니다.", "success"); 
				settingDataTable();
									
			},
			error : function(errorResp) {
				swal("학기 및 기간 등록", "학기 및 기간 등록에 실패 하였습니다.", "error"); 
				console.log(errorResp.status);
			}
		});
		
		
	});
	
	$table = $('#basicInfoList').DataTable();
	$table.on('click', '.viewplanBtn', function() {
		
		var year =$($(this).parent().parent().find($('td'))[0]).text();
		var semester =$($(this).parent().parent().find($('td'))[1]).text();
		$('#viewtitle').html("<h2>"+year+"학년도"+semester+"학기 상세정보</h2>");
		
		var openseme_no = $(this).val();		
		
		$.ajax({
			url :"${pageContext.request.contextPath}/retriveBIinfo?openseme_no="+openseme_no,
			method : "get",
			success : function(resp) {
				
				$('#pi1').val(resp.openseme_period1);  
				$('#pi2').val(resp.openseme_period2);  
				$('#a1').val(resp.openseme_attend1);
				$('#a2').val(resp.openseme_attend2);
				$('#mr1').val(resp.openseme_registgrade1);
				$('#mr2').val(resp.openseme_registgrade2);
				$('#mv1').val(resp.openseme_checkgrade1);
				$('#mv2').val(resp.openseme_checkgrade2);
				$('#fr1').val(resp.openseme_registgrade3);
				$('#fr2').val(resp.openseme_registgrade4);
				$('#fv1').val(resp.openseme_checkgrade3);
				$('#fv2').val(resp.openseme_checkgrade4);
				$('#ev1').val(resp.openseme_evaluate1);
				$('#ev2').val(resp.openseme_evaluate2);
			},
			error : function(errorResp) {
				
				console.log(errorResp.status);
			}
		});
		
		
		
		
		if (!($('.modal.in').length)) {
			$('.modal-dialog').css({
				top : 0,
				left : 0
			});
		}
		$('#viewmodal').modal({
			backdrop : false,
			show : true
		});
		
		
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
									<i class="notika-icon notika-house"></i>
								</div>
                           <div class="breadcomb-ctn">
                           
                              <h2>기초정보관리</h2>
                              <p>학년, 학기별로 각종 기간을 설정하는 게시판입니다. <span class="bread-ntd"></span></p>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>


<div class="container" id="applist">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="breadcomb-list">
				<div class="row">
					<div class="data-table-list">
					 <button class="btn btn-success notika-btn-success waves-effect" style="float:right;"  id="createBtn" >등록</button>
						<table id="basicInfoList" class="table table-striped dataTable"
							role="grid" aria-describedby="data-table-basic_info">
							   <div id="searchDiv"></div>
							<thead>
								<tr>
									<th>연도</th>
									<th>학기</th>
									<th>학기 시작</th>
									<th>학기 종료</th>
									<th>상세보기</th>
									<th>학기번호</th>
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

<div class="modal fade" id="insertmodal" role="dialog">
    <div class="modal-dialog modal-large">
        <div class="modal-content">
            <div class="modal-header">
            </div>
            <div class="modal-body">
                <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="normal-table-list">
                       <div class="basic-tb-hd">
                            <h2>학기 및 기간 등록</h2>
                        </div>
                        <form:form id="insertForm" modelAttribute="saveInfo">
                        <table class="table table-sc-ex">
                                <thead>
                                </thead>
                                <tbody>
                                <tr role="row" class="odd">
                                        <td class="sorting_1">학기입력</td>
                                        <td colspan="2"><input type ="text" name="openseme_year"/>년</td>
                                        <td><select name="openseme_semester" >
                            			<option value="1">1</option><option value="2">2</option></select>학기</td>
                                        <td></td>
                                      
                                   </tr>
                                   <tr role="row" class="even">
                                        <td class="sorting_1">학기기간</td>
										<td>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> 
													<input type="text" class="form-control" name="openseme_period1"/> 
													</div>
												</div>
											</div>
										</td>
										<td></td>
                                        <td>
                                        	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> 
													<input type="text" class="form-control" placeholder="학기 종료일" name="openseme_period2">
													</div>
												</div>
											</div>
										</td>
                                    </tr>
                                    
                                    <tr role="row" class="odd">
                                        <td class="sorting_1">수강신청기간</td>
										<td>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> 
													<input type="text" class="form-control" placeholder="수강신청 시작일" name="openseme_attend1">
													</div>
												</div>
											</div>
										</td>
										<td></td>
                                        <td>
                                        	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> 
													<input type="text" class="form-control" placeholder="수강신청 종료일" name="openseme_attend2">
													</div>
												</div>
											</div>
										</td>
                                    </tr>
                                    
                                    
                                    <tr role="row" class="even">
                                        <td class="sorting_1">중간고사 성적등록</td>
										<td>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> 
													<input type="text" class="form-control" placeholder="성적등록 시작일" name="openseme_registgrade1">
													</div>
												</div>
											</div>
										</td>
										<td></td>
                                        <td>
                                        	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> 
													<input type="text" class="form-control" placeholder="성적등록 종료일" name="openseme_registgrade2">
													</div>
												</div>
											</div>
										</td>
                                    </tr>
                                    
                                     <tr role="row" class="odd">
                                        <td class="sorting_1">중간고사 <br/>성적 열람기간</td>
										<td>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> 
													<input type="text" class="form-control" placeholder="성적열람 시작일" name="openseme_checkgrade1">
													</div>
												</div>
											</div>
										</td>
										<td></td>
                                        <td>
                                        	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> 
													<input type="text" class="form-control" placeholder="성적열람 종료일" name="openseme_checkgrade2">
													</div>
												</div>
											</div>
										</td>
                                    </tr>
                                    <tr role="row" class="even">
                                        <td class="sorting_1">기말고사 성적등록</td>
										<td>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> 
													<input type="text" class="form-control" placeholder="성적등록 시작일" name="openseme_registgrade3">
													</div>
												</div>
											</div>
										</td>
										<td></td>
                                        <td>
                                        	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> 
													<input type="text" class="form-control" placeholder="성적등록 종료일" name="openseme_registgrade4">
													</div>
												</div>
											</div>
										</td>
                                    </tr>
                                    
                                     <tr role="row" class="odd">
                                        <td class="sorting_1">기말고사 <br/>성적 열람기간</td>
										<td>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> 
													<input type="text" class="form-control" placeholder="성적열람 시작일" name="openseme_checkgrade3">
													</div>
												</div>
											</div>
										</td>
										<td></td>
                                        <td>
                                        	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> 
													<input type="text" class="form-control" placeholder="성적열람 종료일" name="openseme_checkgrade4">
													</div>
												</div>
											</div>
										</td>
                                    </tr>
                                    
                                    <tr role="row" class="even">
                                        <td class="sorting_1">강의평가기간</td>
										<td>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> 
													<input type="text" class="form-control" placeholder="강의평가 시작일" name="openseme_evaluate1">
													</div>
												</div>
											</div>
										</td>
										<td></td>
                                        <td>
                                        	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> 
													<input type="text" class="form-control" placeholder="강의평가 종료일" name="openseme_evaluate2">
													</div>
												</div>
                                    	</tr>
                                    	<tr>
                                    	<td>
                                    	</td>
                                    	</tr>
                                    	<tr>
                                    	<td>
                                    	</td>
                                    	</tr>
                                    	<tr>
                                    	<td></td>
                                    	</tr>
                                    	<tr>
                                    	<td></td>
                                    	</tr>
                                    	<tr>
                                    	<td colspan="4">
										 <h2>날짜를 입력하시고 저장 버튼을 누르면 등록됩니다.</h2>
										</td>
                                    	</td>
                                    	</tr>
                                    
                                   </tbody>
                               		<tfoot>
                               		</tfoot>
                           		 </table>
                            
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
            	<button type="button" class="btn btn-default" data-dismiss="modal" id="saveInfo">저장</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="viewmodal" role="dialog">
    <div class="modal-dialog modal-large">
        <div class="modal-content">
            <div class="modal-header">
            <div class="view-mail-hrd" id="viewtitle"></div>
            </div>
            <div class="modal-body">
             <table class="table table-sc-ex">
                                <thead>
                                </thead>
                                <tbody>
                                   <tr role="row" class="even">
                                        <td class="sorting_1">학기기간</td>
										<td>
                               				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group">
                                    			<div class="nk-int-st">
                                        			<input type="text" class="form-control" readonly id="pi1">
                                   				 </div>
                               				 </div>
											</div>
										</td>
										<td></td>
                                        <td>
                                        	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group">
                                    			<div class="nk-int-st">
                                        			<input type="text" class="form-control" readonly id="pi2" >
                                   				 </div>
                               				 </div>
											</div>
										</td>
                                    </tr>
                                    
                                    <tr role="row" class="odd">
                                        <td class="sorting_1">수강신청기간</td>
										<td>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group">
                                    			<div class="nk-int-st">
                                        			<input type="text" class="form-control" readonly id="a1">
                                   				 </div>
                               				 </div>
											</div>
										</td>
										<td></td>
                                        <td>
                                        	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group">
                                    			<div class="nk-int-st">
                                        			<input type="text" class="form-control" readonly id="a2">
                                   				 </div>
                               				 </div>
											</div>
										</td>
                                    </tr>
                                    
                                    
                                    <tr role="row" class="even">
                                        <td class="sorting_1">중간고사 성적등록</td>
										<td>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group">
                                    			<div class="nk-int-st">
                                        			<input type="text" class="form-control" readonly id="mr1">
                                   				 </div>
                               				 </div>
											</div>
										</td>
										<td></td>
                                        <td>
                                        	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group">
                                    			<div class="nk-int-st">
                                        			<input type="text" class="form-control" readonly id="mr2">
                                   				 </div>
                               				 </div>
											</div>
										</td>
                                    </tr>
                                    
                                     <tr role="row" class="odd">
                                        <td class="sorting_1">중간고사 <br/>성적 열람기간</td>
										<td>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group">
                                    			<div class="nk-int-st">
                                        			<input type="text" class="form-control" readonly id="mv1">
                                   				 </div>
                               				 </div>
											</div>
										</td>
										<td></td>
                                        <td>
                                        	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group">
                                    			<div class="nk-int-st">
                                        			<input type="text" class="form-control" readonly id="mv2">
                                   				 </div>
                               				 </div>
											</div>
										</td>
                                    </tr>
                                    <tr role="row" class="even">
                                        <td class="sorting_1">기말고사 성적등록</td>
										<td>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group">
                                    			<div class="nk-int-st">
                                        			<input type="text" class="form-control" readonly id="fr1">
                                   				 </div>
                               				 </div>
											</div>
										</td>
										<td></td>
                                        <td>
                                        	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group">
                                    			<div class="nk-int-st">
                                        			<input type="text" class="form-control" readonly id="fr2">
                                   				 </div>
                               				 </div>
											</div>
										</td>
                                    </tr>
                                    
                                     <tr role="row" class="odd">
                                        <td class="sorting_1">기말고사 <br/>성적 열람기간</td>
										<td>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group">
                                    			<div class="nk-int-st">
                                        			<input type="text" class="form-control" readonly id="fv1">
                                   				 </div>
                               				 </div>
											</div>
										</td>
										<td></td>
                                        <td>
                                        	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group">
                                    			<div class="nk-int-st">
                                        			<input type="text" class="form-control" readonly id="fv2">
                                   				 </div>
                               				 </div>
											</div>
										</td>
                                    </tr>
                                    
                                    <tr role="row" class="even">
                                        <td class="sorting_1">강의평가기간</td>
										<td>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group">
                                    			<div class="nk-int-st">
                                        			<input type="text" class="form-control" readonly id="ev1">
                                   				 </div>
                               				 </div>
											</div>
										</td>
										<td></td>
                                        <td>
                                        	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
											<div class="form-group">
                                    			<div class="nk-int-st">
                                        			<input type="text" class="form-control" readonly id="ev2">
                                   				 </div>
                               				 </div>
											</div>
                                    	</tr>
                                    	
                                   </tbody>
                               		<tfoot>
                               		</tfoot>
                           		 </table>
            	</div>
            <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal"
					id="modi">수정</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>


<script	src="${pageContext.request.contextPath }/notika/js/dialog/sweetalert2.min.js"></script>
<script
	src="${pageContext.request.contextPath }/notika/js/datapicker/bootstrap-datepicker.js"></script>
	

