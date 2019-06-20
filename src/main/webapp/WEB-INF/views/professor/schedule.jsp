<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/res/fullCalendar/fullcalendar/style_full.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/fullCalendar/fullcalendar/moment.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/fullCalendar/fullcalendar/fullcalendar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/fullCalendar/fullcalendar/spectrum.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/fullCalendar/fullcalendar/front.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.2/TweenMax.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/datapicker/datepicker3.css">
	
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
$(function(){

	$('.input-group.date').datepicker({
		todayBtn : "linked",
		keyboardNavigation : false,
		forceParse : false,
		calendarWeeks : true,
		autoclose : true,
		format : "yyyy/mm/dd"

		});
	
	
	
	$('#saveschedule').on("click",function(event){
		var flag = $("[name='flag']").children(":selected").text();
		var schedule_no = $('#seq').val();
		if(flag=="중지"){
			$.ajax({
				url :"${pageContext.request.contextPath}/deleteSchedule?schedule_no="+schedule_no,
				method : "get",
				success : function(resp) {
					if(resp=="SUCCESS"){
						swal("일정 중지", "일정을 삭제하였습니다.", "success");
						 location.reload();
						scheduleRegist.hide();	
					}else if(resp=="FAIL"){
						swal("일정중지", "일정 중지에 실패 하였습니다.", "error"); 
					}
					
				},
				error : function(errorResp) {
					swal("일정 중지", "일정 중지에 실패 하였습니다.", "error"); 
					console.log(errorResp.status);
				}
			});//ajax
			
		}else{
			var lecture_name= $("[name='lecture']").children(":selected").val();	
			var lecture_code= $("[name='lecture']").children(":selected").prop("id");	
			$("[name='lecture_code']").val(lecture_code);
			$("[name='lecture_name']").val(lecture_name);
			var queryString = $('#scheduleForm').serialize();
			
			$.ajax({
				url :"${pageContext.request.contextPath}/saveSchedule",
				method : "post",
				data : queryString,
				success : function(resp) {
					if(resp.msg=="SUCCESS"){
						swal("일정 등록", "일정 등록에 성공하였습니다.", "success");
						$("#calendar").fullCalendar( 'renderEvent', resp.schedule ,'stick');
						scheduleRegist.init();			// 일정 등록 관리 초기화
						scheduleRegist.hide();	
						 location.reload();
					}else if(resp.msg=="FAIL"){
						swal("일정 등록", "일정 등록에 실패 하였습니다.", "error"); 
					}
					
				},
				error : function(errorResp) {
					swal("일정 등록", "일정 등록에 실패 하였습니다.", "error"); 
					console.log(errorResp.status);
				}
			});//ajax
			
		}
		
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
									<i class="notika-icon notika-success"></i>
								</div>
								<div class="breadcomb-ctn">
									<h2>일정 관리 </h2>
									<p> 날짜를 클릭하시면 일정을 추가하실 수 있습니다.<p>
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
		<div class="wrap">
		<div class="calendar_wrap" id="calendar"> </div>
		<!--// calendar_wrap-->

		<div class="schedule_wrap">
		<div class="schedule_form">
		<form:form id="scheduleForm" modelAttribute="schedule">
			<table class="tbl th_ver" border="0" cellpadding="0" cellspacing="0">
	            <caption></caption>
	            <colgroup>
	                <col width="30%" />
	                <col width="70%" />
	            </colgroup>	
	            <tbody>
	            	<tr>
	            		<th scope="row">과목 선택</th>
	            		<td><select name="lecture">
						<c:forEach var="lecture" items="${lectureList}">
							<option id="${lecture.lecture_code}" value="${lecture.lecture_name}">${lecture.lecture_name}</option>
						</c:forEach>
						<input type="hidden" name="lecture_code"/>
						<input type="hidden" name="lecture_name"/>
					</select></td>
	            	</tr>
	            	<tr>
	            		<th scope="row">일정명</th>
	            		<td><input type="text" id="sTitle" name="schedule_title" required/></td>
	            	</tr>
	            	<tr>
	            		<th scope="row">등록일</th>
	            		<td class="write_date" name="schedule_add"></td>
	            	</tr>
	            	<tr>
	            		<th scope="row">시작일</th>
	            		<td>
	            			<div class="input-group date nk-int-st">
								<span class="input-group-addon" style="border: 0px solid #ccc;"></span> 
								<input type="text" class="form-control" placeholder="시작일" id="start-date" name="schedule_start"/>
							</div>
	            		</td>
	            	</tr>
	            	<tr>
	            		<th scope="row">일정 시작 시간</th>
	            		<td>
	            			<input type="time" id="stTime" name="stTime"/>
	            		</td>
	            	</tr>
	            	<tr>
	            		<th scope="row">종료일</th>
	            		<td>
							<div class="input-group date nk-int-st">
								<span class="input-group-addon" style="border: 0px solid #ccc;"></span> 
								<input type="text" class="form-control" placeholder="종료일" id="end-date" name="schedule_end">
							</div>
	            		</td>
	            	</tr>
	            	<tr>
	            		<th scope="row">일정 종료 시간</th>
	            		<td>
	            			<input type="time" id="edTime" name="edTime"/>
	            		</td>
	            	</tr>
	            	<tr>
	            		<th scope="row">색상</th>
	            		<td>
	            			<input type="text" id="sBg" name="schedule_color"/>
	            		</td>
	            	</tr>
	            	<tr>
	            		<th scope="row">상태</th>
	            		<td>
	            			<div>
	                            <label>
	                                <span></span>
	                                <select name="flag">
	                                    <option value="사용" selected>사용</option>
	                                    <option value="중지">중지</option>
	                                </select>
	                            </label>
	                        </div>
	                        <!--// style_select-->
	            		</td>
	            	</tr>
	            </tbody>
            </table>
            <input type="hidden" name="schedule_no" id="seq"/>
            </form:form>
		</div>
		<!--// schedule_form-->

		<div class="btn_area center">
			<button type="button" class="btn notica" id="saveschedule">저장</button>
			<button type="button" class="btn cancel" id="closeBtn">취소</button>
		</div>
		<!--// btn_area-->
	</div>
	<!--// schedule_wrap-->
	<!--// con_box-->
</div>
</div>
</div>
</div>
<script type="text/javascript">
$(function(){
	scheduleRegist.init();			// 일정 등록 관리 초기화
	ajaxData();
	
});
</script>

<script	src="${pageContext.request.contextPath }/notika/js/dialog/sweetalert2.min.js"></script>
<script
	src="${pageContext.request.contextPath }/notika/js/datapicker/bootstrap-datepicker.js"></script>