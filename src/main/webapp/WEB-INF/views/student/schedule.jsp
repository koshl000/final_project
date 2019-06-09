<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/res/fullCalendar/fullcalendar/style_full.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/fullCalendar/fullcalendar/moment.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/fullCalendar/fullcalendar/fullcalendar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/fullCalendar/fullcalendar/spectrum.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/fullCalendar/fullcalendar/frontStu.js"></script>
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
			<table class="tbl th_ver" border="0" cellpadding="0" cellspacing="0">
	            <caption></caption>
	            <colgroup>
	                <col width="30%" />
	                <col width="70%" />
	            </colgroup>	
	            <tbody>
	            	<tr>
	            		<th scope="row">과목</th>
	            		<td id="lectureName"></td>
	            	</tr>
	            	<tr>
	            		<th scope="row">일정명</th>
	            		<td id="sTitle"></td>
	            	</tr>
	            	<tr>
	            		<th scope="row">등록일</th>
	            		<td class="write_date" name="schedule_add"></td>
	            	</tr>
	            	<tr>
	            		<th scope="row">시작일</th>
	            		<td id="start-date">
	            		</td>
	            	</tr>
	            	<tr>
	            		<th scope="row">일정 시작 시간</th>
	            		<td id="stTime">
	            		</td>
	            	</tr>
	            	<tr>
	            		<th scope="row">종료일</th>
	            		<td id="end-date"></td>
	            	</tr>
	            	<tr>
	            		<th scope="row">일정 종료 시간</th>
	            		<td id="edTime"> </td>
	            	</tr>
	            </tbody>
            </table>
		</div>
		<!--// schedule_form-->

		<div class="btn_area center">
			<button type="button" class="btn cancel" id="closeBtn">닫기</button>
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