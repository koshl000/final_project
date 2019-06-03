<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	function page_link() {
		window.open("${pageContext.request.contextPath }/subjectPage/eduGoal", "상세강의보기", "width=1000, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=yes");
	}
</script>
<style>
.sangyup {
	display: inline;
	float: right;
}

.dataTables_wrapper .dataTables_filter {
	width: 45%;
}

.dataTables_wrapper .dataTables_filter input, .dataTables_wrapper .dataTables_filter label
	{
	width: 20%;
}
</style>

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
									<h2>수강과목</h2>
									<p>
										수강과목 조회 페이지 <span class="bread-ntd"></span>
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
					<div>
						<span>이름</span><span>이상엽</span> <span>학부</span><span>전산학부</span> <span>학과</span><span>콤퓨타</span>
						<span>학년</span><span>4학년</span>
					</div>
					<div class="table-responsive">
						<div id="data-table-basic_wrapper" class="dataTables_wrapper">
							<div class="dataTables_length" id="data-table-basic_length">
								<label>Show <select name="data-table-basic_length"
									aria-controls="data-table-basic" class="">
										<option value="10">10</option>
										<option value="25">25</option>
										<option value="50">50</option>
										<option value="100">100</option>
								</select> entries
								</label>
								<div id="data-table-basic_filter"
									class="dataTables_filter sangyup">
									<span>Search:</span> <input type="search" placeholder=""
										aria-controls="data-table-basic" /> <span>연도<select><OPTION>2019년</OPTION>
											<OPTION>2018년</OPTION>
											<OPTION>2017년</OPTION></select></span> <span>학기<select><option>1학기</option>
											<option>2학기</option></select></span>
									<button class="btn btn-default notika-btn-default" id="asd">조회하기</button>
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
												style="width: 80px;">선택</th>
											<th class="sorting_asc" tabindex="0"
												aria-controls="data-table-basic" rowspan="1" colspan="1"
												aria-sort="ascending"
												aria-label="Name: activate to sort column descending"
												style="width: 80px;">과목명</th>
											<th class="sorting" tabindex="0"
												aria-controls="data-table-basic" rowspan="1" colspan="1"
												aria-label="Position: activate to sort column ascending"
												style="width: 100px;">이수구분</th>
											<th class="sorting" tabindex="0"
												aria-controls="data-table-basic" rowspan="1" colspan="1"
												aria-label="Office: activate to sort column ascending"
												style="width: 80px;">학점</th>
											<th class="sorting" tabindex="0"
												aria-controls="data-table-basic" rowspan="1" colspan="1"
												aria-label="Age: activate to sort column ascending"
												style="width: 80px;">학년</th>
											<th class="sorting" tabindex="0"
												aria-controls="data-table-basic" rowspan="1" colspan="1"
												aria-label="Start date: activate to sort column ascending"
												style="width: 125px;">과목별점</th>
											<th class="sorting" tabindex="0"
												aria-controls="data-table-basic" rowspan="1" colspan="1"
												aria-label="Salary: activate to sort column ascending"
												style="width: 117px;">수강인원</th>
											<th class="sorting" tabindex="0"
												aria-controls="data-table-basic" rowspan="1" colspan="1"
												aria-label="Salary: activate to sort column ascending"
												style="width: 80px;">강의계획서</th>
										</tr>
									</thead>
									<tbody>
										<tr role="row" class="odd">
											<td class="">
												<div class="fm-checkbox">
													<label class=""><div class="icheckbox_square-green"
															style="position: relative;">
															<input type="checkbox" class="i-checks"
																style="position: absolute; opacity: 0;">
															<ins class="iCheck-helper"
																style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
														</div></label>
												</div>
											</td>
											<td><a onClick="javascript:page_link();">초급자바</a></td>
											<td>교양</td>
											<td>2</td>
											<td>1학년</td>
											<td>과목별점</td>
											<td>65/70</td>
											<td><button class="btn btn-default notika-btn-default">보기</button></td>
										</tr>
										<tr role="row" class="odd">
											<td class="">
												<div class="fm-checkbox">
													<label class=""><div class="icheckbox_square-green"
															style="position: relative;">
															<input type="checkbox" class="i-checks"
																style="position: absolute; opacity: 0;">
															<ins class="iCheck-helper"
																style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
														</div></label>
												</div>
											</td>
											<td><a onClick="javascript:page_link();">초급자바</a></td>
											<td>교양</td>
											<td>2</td>
											<td>1학년</td>
											<td>과목별점</td>
											<td>65/70</td>
											<td><button class="btn btn-default notika-btn-default">보기</button></td>
										</tr>
									</tbody>
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
		</div>
	</div>
</div>

