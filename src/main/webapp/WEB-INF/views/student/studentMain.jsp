<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/fullCalendar/fullcalendar/style_full.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/fullCalendar/fullcalendar/moment.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/fullCalendar/fullcalendar/fullcalendar.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/fullCalendar/fullcalendar/spectrum.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/fullCalendar/fullcalendar/frontStumain.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.2/TweenMax.min.js"></script>

<!-- dialog CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/notika/css/dialog/sweetalert2.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/notika/css/dialog/dialog.css">

<style>
* {
	margin: 0;
	padding: 0;
	border: 0;
}

html, body {
	height: 100%;
	width: 100%;
}

.test {
	width: 50%;
	height: 100%;
	overflow: auto;
}

.test1 {
	width: 50%;
	height: 100%;
	overflow: auto; 
}

</style>
	<div class="container">
		<div class="col-md-6 test">
			<div class="data-table-list">

				<div class="table-responsive">
					<div id="data-table-basic_wrapper" class="dataTables_wrapper">
						<div class="dataTables_length" id="data-table-basic_length">
							<label><select name="data-table-basic_length"
								aria-controls="data-table-basic" class="">
									<option value="10">10</option>
									<option value="25">25</option>
									<option value="50">50</option>
									<option value="100">100</option>
							</select> 건씩 정렬</label>
							<div id="data-table-basic_filter"
								class="dataTables_filter sangyup">

								<span>검색<select><OPTION>년도/학기</OPTION>
										<OPTION>2019년/1학기</OPTION>
										<OPTION>2019년/2학기</OPTION></select></span> <input type="search" placeholder=""
									aria-controls="data-table-basic" />
								<button class="btn btn-default notika-btn-default">검색</button>

							</div>
							<table id="data-table-basic"
								class="table table-striped dataTable" role="grid"
								aria-describedby="data-table-basic_info">
								<thead>
									<tr role="row">
										<th class="sorting_asc" tabindex="0"
											aria-controls="data-table-basic" rowspan="1" colspan="1"
											aria-sort="ascending"
											aria-label="Name: activate to sort column descending"
											style="width: 189px;">교과목명</th>
										<th class="sorting" tabindex="0"
											aria-controls="data-table-basic" rowspan="1" colspan="1"
											aria-label="Age: activate to sort column ascending"
											style="width: 125px;">담당교수</th>
										<th class="sorting" tabindex="0"
											aria-controls="data-table-basic" rowspan="1" colspan="1"
											aria-label="Age: activate to sort column ascending"
											style="width: 125px;">수강기간</th>
										<th class="sorting" tabindex="0"
											aria-controls="data-table-basic" rowspan="1" colspan="1"
											aria-label="Start date: activate to sort column ascending"
											style="width: 125px;">학기구분</th>
										<th class="sorting" tabindex="0"
											aria-controls="data-table-basic" rowspan="1" colspan="1"
											aria-label="Start date: activate to sort column ascending"
											style="width: 125px;">평가현황</th>
									</tr>
								</thead>
								<tbody>
									<tr role="row" class="odd">
										<td class="sorting_1">초급자바</td>
										<td>이영만</td>
										<td>2019-05-05 ~ 2019-08-21</td>
										<td>1학기</td>
										<td>0/43</td>
									</tr>
									<tr role="row" class="even">
										<td class="sorting_1">궁극자바</td>
										<td>이상엽</td>
										<td>2019-05-05 ~ 2019-08-21</td>
										<td>2학기</td>
										<td>70/70</td>
									</tr>
									<tr role="row" class="odd">
										<td class="sorting_1">궁극자바</td>
										<td>이상엽</td>
										<td>2019-05-05 ~ 2019-08-21</td>
										<td>계절학기(하계)</td>
										<td>0/43</td>
								</tbody>
								<tfoot>

								</tfoot>
							</table>
							<div class="dataTables_info" id="data-table-basic_info"
								role="status" aria-live="polite">Showing 1 to 10 of 57
								entries</div>
							<div class="dataTables_paginate paging_simple_numbers"
								id="data-table-basic_paginate">
								<a class="paginate_button previous disabled"
									aria-controls="data-table-basic" data-dt-idx="0" tabindex="0"
									id="data-table-basic_previous">Previous</a><span><a
									class="paginate_button current"
									aria-controls="data-table-basic" data-dt-idx="1" tabindex="0">1</a><a
									class="paginate_button " aria-controls="data-table-basic"
									data-dt-idx="2" tabindex="0">2</a><a class="paginate_button "
									aria-controls="data-table-basic" data-dt-idx="3" tabindex="0">3</a><a
									class="paginate_button " aria-controls="data-table-basic"
									data-dt-idx="4" tabindex="0">4</a><a class="paginate_button "
									aria-controls="data-table-basic" data-dt-idx="5" tabindex="0">5</a><a
									class="paginate_button " aria-controls="data-table-basic"
									data-dt-idx="6" tabindex="0">6</a></span><a
									class="paginate_button next" aria-controls="data-table-basic"
									data-dt-idx="7" tabindex="0" id="data-table-basic_next">Next</a>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
		
		<div class="col-md-6 test1">
		<div class="wrap">
			<div class="calendar_wrap" id="calendar"></div>

		</div>
	</div>
	</div>
<script type="text/javascript">
	$(function() {
		scheduleRegist.init(); // 일정 등록 관리 초기화
		ajaxData();

	});
</script>


<script
	src="${pageContext.request.contextPath }/notika/js/dialog/sweetalert2.min.js"></script>