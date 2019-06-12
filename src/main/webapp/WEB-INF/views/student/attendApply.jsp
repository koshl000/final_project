<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
	
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
		$.ajax({
			url : "${pageContext.request.contextPath}/getAttendPeriod",
			method : "get",
			dataType : "text",
			success : function(resp) {
				if(resp=="OK"){
					settingAttendApplyListDataTable();
					settingAttendApplyCompListDataTable();
				}else{
					
					$('#acompl').empty();
					$('#applist').empty();
					
					var inner ="<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>"
						inner+="<div class='invoice-hs'>";
						inner+=" <h2>지금은 수강신청 기간이 아닙니다.</h2></div></div>"
					$('#acompl').html(inner);
				}
			},
			error : function(errorResp) {
				console.log(errorResp.status);
			}
		});//ajax
		
		
		function settingAttendApplyListDataTable() {
			$('#searchDiv').empty();
			
			$('#attendApplyList').DataTable(
							{
								ajax : {
									"type" : "get",
									"url" : "${pageContext.request.contextPath}/getAttendApplyList",
									"dataType" : "JSON"
								},
								columns : [{
									data : "lecture_name"
								}, {
									data : "lecture_coursetype"
								}, {
									data : "lecture_credit"
								}, {
									data : "lecture_target"
								}, {
									data : "pro_name"
								}, {
									data : "lecture_capacity"
								}, {
									data : "buttonView"
								}, {
									data : "buttonApply"
								}, {
									data : "lecture_code"
								},{
									data : "lecture_current"
								} ],
								"order" :  [ 3, 'asc' ],
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
						            $('#searchDiv').find('select:eq(0)').attr('id', 'name').css('display', 'none');
						            $('#searchDiv').find('select:eq(1)').attr('id', 'course').attr('class', 'selectpicker');
						            $('#searchDiv').find('select:eq(2)').attr('id', 'credit').attr('class', 'selectpicker');
						            $('#searchDiv').find('select:eq(3)').attr('id', 'grade').attr('class', 'selectpicker');
						            $('#searchDiv').find('select:eq(4)').attr('id', 'prof').css('display', 'none');
						            $('#searchDiv').find('select:eq(5)').attr('id', 'capacity').css('display', 'none');
						            $('#searchDiv').find('select:eq(6)').attr('id', 'planBtn').css('display', 'none');
						            $('#searchDiv').find('select:eq(7)').attr('id', 'applyBtn').css('display', 'none');
						            $('#searchDiv').find('select:eq(8)').attr('id', 'code').css('display', 'none');
						            $('#searchDiv').find('select:eq(9)').attr('id', 'cnt').css('display', 'none');
						            $("#grade").after($("#name"));
						            $("#grade").after($("#course"));
						            $("#grade").after($("#credit"));
						            $("<span class='selectSpan'>학년</span>").insertBefore($('#grade'));
						            $("<span class='selectSpan'>이수구분</span>").insertBefore($('#course'));
						            $("<span class='selectSpan'>학점</span>").insertBefore($('#credit'));
						         },
								"bDestroy" : true,
								"columnDefs": [{
					                
					                "render": function ( data, type, row ) {
					                	var result;
					                		result= row.lecture_current+"/"+data
					                    return result;
					                },
					                "targets": 5,
					               
							},{
						                
						                "render": function ( data, type, row ) {
						                	var result;
						                		result = "<button class='btn btn-default notika-btn-default viewplanBtn'"; 
						                		result+="data='"+row.lecture_code+ "' value='"+row.lecture_name+"'>강의계획서</button></td>";
						                    return result;
						                },
						                "targets": 6,
						               
								},{
					            	
					            	  "render": function ( data, type, row ) {
					            		 var result
					            		 	result = "<button class='btn btn-success notika-btn-success waves-effect applyBtn' data='"+row.lecture_code+ "' value='"+row.lecture_name+ "'>수강신청 </button>"
					            		 return result;
					            	  },
					            	  "targets": 7
					            },
								 { "visible": false,  "targets": [ 8 ]},
								 { "visible": false,  "targets": [ 9 ]}]

							});
				};
				
				
				function settingAttendApplyCompListDataTable() {
					$('#searchDiv').empty();
					$('#attendApplyCompList')
							.DataTable(
									{
										ajax : {
											"type" : "get",
											"url" : "${pageContext.request.contextPath}/getAttendApplyCompList",
											"dataType" : "JSON"
										},
										columns : [{
											data : "lecture_name"
										}, {
											data : "lecture_coursetype"
										}, {
											data : "lecture_credit"
										}, {
											data : "lecture_target"
										}, {
											data : "pro_name"
										}, {
											data : "lecture_capacity"
										}, {
											data : "buttonView"
										}, {
											data : "buttonApply"
										}, {
											data : "lecture_code"
										},{
											data : "lecture_current"
										} ],
										"bDestroy" : true,
										"columnDefs": [{
							                
							                "render": function ( data, type, row ) {
							                	var result;
							                		result= row.lecture_current+"/"+data
							                    return result;
							                },
							                "targets": 5,
							               
									},{
							                
							                "render": function ( data, type, row ) {
							                	var result;
							                		result = "<button class='btn btn-default notika-btn-default viewplanBtn'"; 
							                		result+="data='"+row.lecture_code+  "' value='"+row.lecture_name+"'>강의계획서</button></td>";
							                    return result;
							                },
							                "targets": 6,
							               
									},{
						            	
						            	  "render": function ( data, type, row ) {
						            		 var result
						            		 	result = "<button class='btn btn-success notika-btn-success waves-effect applyCancel' data='"+row.attend_no+ "' value='"+row.lecture_name+ "'>취소 </button>"
						            		 return result;
						            	  },
						            	  "targets": 7
						            },
									
									 { "visible": false,  "targets": [ 8 ]},
									 { "visible": false,  "targets": [ 9 ]}]

									});
					
						};
				
	
	$applytable = $('#attendApplyList').DataTable();
	$applytable.on('click', '.viewplanBtn', function() {
		var lecture_code = $(this).attr("data");
		var lecture_name = $(this).val();
	
		$('#lec_plan_summary').text("");
		$('#introduction').text("");
		$('#week_content').text("");
		$('#lec_plan_method').text("");
		$('#book_material').text("");
		
		$.ajax({
			url : "${pageContext.request.contextPath}/getLecturePlan?lecture_code="+lecture_code,
			method : "get",
			dataType : "json",
			success : function(resp) {
				
				$('#lPlandheader').html("<h2>"+lecture_name+" 강의 계획서</>");
				$('#lec_plan_summary').html(resp.lec_plan_summary);
				$('#introduction').html(resp.introduction);
				$('#week_content').html(resp.week_content);
				$('#lec_plan_method').html(resp.lec_plan_method);
				$('#book_material').html(resp.book_material);
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
			$('#myModalthree').modal({
				backdrop : false,
				show : true
			});
			
		});
	
	$applytable.on('click', '.applyBtn', function() {
		var lecture_code = $(this).attr("data");
		var lecture_name = $(this).val();
		var lecture_credit =$($(this).parent().parent().find($('td'))[2]).text();
		$.ajax({
			url : "${pageContext.request.contextPath}/createAttend?lecture_code="+lecture_code+"&lecture_credit="+lecture_credit,
			method : "get",
			dataType : "text",
			success : function(resp) {
				if(resp=="FULL"){
					swal("수강신청 실패", "수강신청이 마감되어 신청하실 수 없습니다.", "error"); 
					
				}else if (resp=="OVER"){
					swal("수강신청 실패", "수강신청 가능한 학점이 초과되어 신청하실 수 없습니다.", "error"); 
				}else{
					swal("수강신청 성공",lecture_name+ "과목의 수강신청이 완료되었습니다.", "success"); 
					settingAttendApplyListDataTable();
					settingAttendApplyCompListDataTable();
				}
			},
			error : function(errorResp) {
				console.log(errorResp.status);
			}
		});//ajax
		
	});
	
	
	$attendApplytable = $('#attendApplyCompList').DataTable();
	$attendApplytable.on('click', '.applyCancel', function() {
		var attend_no = $(this).attr("data");
		var lecture_name = $(this).val();
		$.ajax({
			url : "${pageContext.request.contextPath}/cancelAttend?attend_no="+attend_no,
			method : "get",
			dataType : "text",
			success : function(resp) {
				swal("수강신청 취소",lecture_name+ "과목의 수강신청을 취소하였습니다.", "success"); 
					settingAttendApplyListDataTable();
					settingAttendApplyCompListDataTable();
				
			},
			error : function(errorResp) {
				swal("수강신청 취소 실패",lecture_name+ "수강신청 취소가 실패하였습니다.", "error"); 
				console.log(errorResp.status);
			}
		});//ajax
		
		
	});
	
	
	$attendApplytable.on('click', '.viewplanBtn', function() {
		var lecture_code = $(this).attr("data");
		var lecture_name = $(this).val();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/getLecturePlan?lecture_code="+lecture_code,
			method : "get",
			dataType : "json",
			success : function(resp) {
				
				$('#lPlandheader').html("<h2>"+lecture_name+" 강의 계획서</>");
				$('#lec_plan_summary').text(resp.lec_plan_summary);
				$('#introduction').text(resp.introduction);
				$('#week_content').text(resp.week_content);
				$('#lec_plan_method').text(resp.lec_plan_method);
				$('#book_material').text(resp.book_material);
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
			$('#myModalthree').modal({
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
									<i class="notika-icon notika-edit"></i>
								</div>
								<div class="breadcomb-ctn">
									<h2>수강신청</h2>
									<p>수강신청을 하고 취소하실 수 있는 페이지 입니다. </p>
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
					<div class="basic-tb-hd">
						<h2>수강신청목록</h2>
					</div>
						<table id="attendApplyList" class="table table-striped dataTable"
							role="grid" aria-describedby="data-table-basic_info">
							   <div id="searchDiv"></div>
							<thead>
								<tr>
									<th>과목명</th>
									<th>이수구분</th>
									<th>학점</th>
									<th>학년</th>
									<th>담당교수</th>
									<th>수강인원</th>
									<th>강의계획서</th>
									<th>신청</th>
									<th>과목 코드</th>
									<th>신청 인원</th>
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


<div class="container" id="acompl">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="breadcomb-list">
				<div class="row">
					<div class="data-table-list">
					<div class="basic-tb-hd">
						<h2>수강신청 완료목록</h2>
					</div>
						<table id="attendApplyCompList" class="table table-striped dataTable"
							role="grid" aria-describedby="data-table-basic_info">
							<thead>
								<tr>
									<th>과목명</th>
									<th>이수구분</th>
									<th>학점</th>
									<th>학년</th>
									<th>담당교수</th>
									<th>수강인원</th>
									<th>강의계획서</th>
									<th>수강 신청 취소</th>
									<th>과목 코드</th>
									<th>신청 인원</th>
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
                           
                        </div>
                        <div class="widget-tabs-list">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#home">교과목 개요</a></li>
                                <li><a data-toggle="tab" href="#pro">담당교수</a></li>
                                <li><a data-toggle="tab" href="#menu1">주차별 강의내용</a></li>
                                <li><a data-toggle="tab" href="#menu2">시험 및 과제물 안내</a></li>
                                <li><a data-toggle="tab" href="#menu3">교재/참고자료</a></li>
                            </ul>
                            <div class="tab-content tab-custom-st">
                                <div id="home" class="tab-pane fade in active">
                                    <div class="tab-ctn" id="lec_plan_summary">
                                    </div>
                                </div>
                                <div id="pro" class="tab-pane fade">
                                    <div class="tab-ctn" id ="introduction">
                                    </div>
                                </div>
                                <div id="menu1" class="tab-pane fade">
                                    <div class="tab-ctn" id ="week_content">
                                    </div>
                                </div>
                                <div id="menu2" class="tab-pane fade" >
                                    <div class="tab-ctn" id="lec_plan_method">
                                    </div>
                                </div>
                                <div id="menu3" class="tab-pane fade">
                                    <div class="tab-ctn" id="book_material">
                                    </div>
                                </div>
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

<script	src="${pageContext.request.contextPath }/notika/js/dialog/sweetalert2.min.js"></script>