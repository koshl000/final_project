<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/res/js/jquery-3.3.1.min.js"></script>
<!-- Data Table JS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/notika/css/jquery.dataTables.min.css">
<!-- normalize CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/notika/css/normalize.css">
	
<div class="main-menu-area mg-tb-40">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="tab-content custom-menu-content">
					<div id="Home"
						class="tab-pane in active notika-tab-menu-bg animated flipInX">
						<ul class="notika-main-menu-dropdown">
							<li><a href="eduGoal">교육목표</a></li>
							<li><a href="professorIntro">교수소개</a></li>
							<li><a href="lecturePage">강의페이지</a></li>
							<li><a href="lectureBoard">게시판</a></li>
							<li><a href="mantoman">1:1지도</a></li>
							<li><a href="lectureAssignment">과제물</a></li>
							<li><a href="studyState">학습현황</a></li>
							<li><a href="survey">설문지</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="data-table-list">
					<div class="table-responsive">
						<h2>설문지</h2>
						<div id="data-table-basic_wrapper" class="dataTables_wrapper">
							<div class="dataTables_length" id="data-table-basic_length">
								<div id="data-table-basic_filter"
									class="dataTables_filter sangyup">
									<span>분류
									<select>
										<OPTION>공지사항</OPTION>
										<OPTION>과목</OPTION>
										<OPTION>일반</OPTION>
									</select>
									</span>
									<button class="btn btn-default notika-btn-default" id="asd">등록</button>
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
												style="width: 5%;">선택</th>
											<th class="sorting_asc" tabindex="0"
												aria-controls="data-table-basic" rowspan="1" colspan="1"
												aria-sort="ascending"
												aria-label="Name: activate to sort column descending"
												style="width: 10%;">설문번호</th>
											<th class="sorting" tabindex="0"
												aria-controls="data-table-basic" rowspan="1" colspan="1"
												aria-label="Position: activate to sort column ascending"
												style="width: 10%;">분류</th>
											<th class="sorting" tabindex="0"
												aria-controls="data-table-basic" rowspan="1" colspan="1"
												aria-label="Office: activate to sort column ascending"
												style="width: 30%;">제목</th>
											<th class="sorting" tabindex="0"
												aria-controls="data-table-basic" rowspan="1" colspan="1"
												aria-label="Age: activate to sort column ascending"
												style="width: 10%;">작성자</th>
											<th class="sorting" tabindex="0"
												aria-controls="data-table-basic" rowspan="1" colspan="1"
												aria-label="Start date: activate to sort column ascending"
												style="width: 10%;">작성일</th>
											<th class="sorting" tabindex="0"
												aria-controls="data-table-basic" rowspan="1" colspan="1"
												aria-label="Salary: activate to sort column ascending"
												style="width: 10%">마감일</th>
											<th class="sorting" tabindex="0"
												aria-controls="data-table-basic" rowspan="1" colspan="1"
												aria-label="Salary: activate to sort column ascending"
												style="width: 5%">조회수</th>
										</tr>
									</thead>
									<tbody>
										<tr role="row" class="odd" onClick="javascript:page_link();">
											<td class="">
												<div class="fm-checkbox">
													<div class="icheckbox_square-green" style="position: relative;">
														<input type="checkbox" class="i-checks" style="position: absolute; opacity: 0;" />
														<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
													</div>
												</div>
											</td>
											<td class="sorting_1">1</td>
											<td>강의평가</td>
											<td><a href="">이상엽교수는 물러나라</a></td>
											<td>정창훈</td>
											<td>2019-05-11</td>
											<td>2019-05-18</td>
											<td>70</td>
										</tr>
										<tr role="row" class="odd">
											<td class="">
												<div class="fm-checkbox">
													<div class="icheckbox_square-green" style="position: relative;">
														<input type="checkbox" class="i-checks" style="position: absolute; opacity: 0;" />
														<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
													</div>
												</div>
											</td>
											<td class="sorting_1">2</td>
											<td>강의만족도</td>
											<td><a href="#">이상엽교수는 물러나라</a></td>
											<td>정창훈</td>
											<td>2019-05-13</td>
											<td>2019-05-16</td>
											<td>50</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

	<script
		src="${pageContext.request.contextPath }/notika/js/data-table/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/notika/js/data-table/data-table-act.js"></script>