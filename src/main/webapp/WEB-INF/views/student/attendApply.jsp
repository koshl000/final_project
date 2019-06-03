<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	function page_link() {
		window.open("${pageContext.request.contextPath }/subjectPage/eduGoal", "상세강의보기", "width=1000, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=yes");
	}
</script>
<!-- Data Table JS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/notika/css/jquery.dataTables.min.css">
<!-- normalize CSS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/notika/css/normalize.css">

<div class="data-table-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="data-table-list">
					<div class="basic-tb-hd">
						<h2>수강신청목록</h2>
					</div>
					<div id="data-table-basic_filter" class="dataTables_filter sangyup">
						<div>
							<span>학년</span>
							<select>
								<OPTION>1학년</OPTION>
								<OPTION>2학년</OPTION>
								<OPTION>3학년</OPTION>
								<OPTION>4학년</OPTION>
							</select>
							<span>학기</span>
							<select>
								<OPTION>1학기</OPTION>
								<OPTION>2학기</OPTION>
							</select>
							<span>학과</span>
							<select>
								<OPTION>콤퓨타공학과</OPTION>
								<OPTION>마계입문과</OPTION>
								<OPTION>내로남불과</OPTION>
								<OPTION>무단횡단과</OPTION>
							</select>
							<span>이수구분</span>
							<select>
								<OPTION>교양</OPTION>
								<OPTION>전공</OPTION>
							</select>
							<button class="btn btn-default notika-btn-default" id="asd">조회하기</button>
						</div>
						<div>
							<span>이름</span><span>이상엽</span>
							<span>학부</span><span>전산학부</span>
							<span>학과</span><span>콤퓨타</span>
							<span>학년</span><span>4학년</span>
						</div>
					</div>
					<div class="table-responsive">
						<table id="data-table-basic" class="table table-striped dataTable"
							role="grid" aria-describedby="data-table-basic_info">
							<thead>
								<tr role="row">
									<th class="sorting_asc" tabindex="0"
										aria-controls="data-table-basic" rowspan="1" colspan="1"
										aria-sort="ascending"
										aria-label="Name: activate to sort column descending"
										style="width: 80px;">과목명</th>
									<th class="sorting_asc" tabindex="0"
										aria-controls="data-table-basic" rowspan="1" colspan="1"
										aria-sort="ascending"
										aria-label="Name: activate to sort column descending"
										style="width: 80px;">이수구분</th>
									<th class="sorting" tabindex="0"
										aria-controls="data-table-basic" rowspan="1" colspan="1"
										aria-label="Position: activate to sort column ascending"
										style="width: 100px;">학점</th>
									<th class="sorting" tabindex="0"
										aria-controls="data-table-basic" rowspan="1" colspan="1"
										aria-label="Office: activate to sort column ascending"
										style="width: 80px;">학년</th>
									<th class="sorting" tabindex="0"
										aria-controls="data-table-basic" rowspan="1" colspan="1"
										aria-label="Age: activate to sort column ascending"
										style="width: 80px;">담당교수</th>
									<th class="sorting" tabindex="0"
										aria-controls="data-table-basic" rowspan="1" colspan="1"
										aria-label="Start date: activate to sort column ascending"
										style="width: 125px;">수강인원</th>
									<th class="sorting" tabindex="0"
										aria-controls="data-table-basic" rowspan="1" colspan="1"
										aria-label="Salary: activate to sort column ascending"
										style="width: 117px;">강의계획서</th>
									<th class="sorting" tabindex="0"
										aria-controls="data-table-basic" rowspan="1" colspan="1"
										aria-label="Salary: activate to sort column ascending"
										style="width: 117px;">신청</th>
								</tr>
							</thead>
							<tbody>
								<tr role="row" class="odd">
									<td class="sorting_1"><a onClick="javascript:page_link();">초급자바</a></td>
									<td>교양</td>
									<td>2</td>
									<td>1학년</td>
									<td>이영만</td>
									<td>55/70</td>
									<td><button class="btn btn-default notika-btn-default" id="asd">보기</button></td>
									<td><button class="btn btn-default notika-btn-default" id="asd">신청</button></td>
								</tr>
								<tr role="row" class="odd">
									<td class="sorting_1"><a onClick="javascript:page_link();">중급자바</a></td>
									<td>전공</td>
									<td>3</td>
									<td>2학년</td>
									<td>이진우</td>
									<td>65/70</td>
									<td><button class="btn btn-default notika-btn-default" id="asd">보기</button></td>
									<td><button class="btn btn-default notika-btn-default" id="asd">신청</button></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div>
						<span>잔여학점</span><span>14학점</span>
					</div>
				</div>
				<div class="normal-table-list">
					<div class="basic-tb-hd">
						<h2>수강신청목록</h2>
					</div>
					<div class="bsc-tbl">
						<table class="table table-sc-ex">
							<thead>
								<tr>
									<th>과목명</th>
									<th>이수구분</th>
									<th>학점</th>
									<th>학년</th>
									<th>담당교수</th>
									<th>수강인원</th>
									<th>강의계획서</th>
									<th>선택란</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><a onClick="javascript:page_link();">초급자바</a></td>
									<td>교양</td>
									<td>2</td>
									<td>1학년</td>
									<td>이영만</td>
									<td>55/70</td>
									<td><button class="btn btn-default notika-btn-default"
											id="asd">보기</button></td>
									<td><button class="btn btn-default notika-btn-default"
											id="asd">신청</button></td>
								</tr>
								<tr>
									<td><a onClick="javascript:page_link();">중급자바</a></td>
									<td>전공</td>
									<td>3</td>
									<td>2학년</td>
									<td>이진우</td>
									<td>65/70</td>
									<td><button class="btn btn-default notika-btn-default"
											id="asd">보기</button></td>
									<td><button class="btn btn-default notika-btn-default"
											id="asd">신청</button></td>
								</tr>
							</tbody>
						</table>
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