<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Data Table JS
		============================================ -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/jquery.dataTables.min.css">
<!-- normalize CSS
		============================================ -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/normalize.css">
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
									<h2>모든강의</h2>
									<p>
										모든강의 조회 페이지 <span class="bread-ntd"></span>
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
					<div class="table-responsive">
						<div>
							<span>Search:</span> <input type="search" placeholder=""
								aria-controls="data-table-basic" /> <span>연도<select><OPTION>2019년</OPTION>
									<OPTION>2018년</OPTION>
									<OPTION>2017년</OPTION></select></span> <span>학기<select><option>1학기</option>
									<option>2학기</option></select></span>
							<button class="btn btn-default notika-btn-default" id="asd">조회하기</button>
						</div>
						<table id="data-table-basic" class="table table-striped dataTable"
							role="grid" aria-describedby="data-table-basic_info">
							<thead>
								<tr role="row">
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
										style="width: 125px;">담당교수</th>
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
									<td><a onClick="javascript:page_link();">초급자바</a></td>
									<td>교양</td>
									<td>2</td>
									<td>1학년</td>
									<td>이성엽</td>
									<td>65/70</td>
									<td><button class="btn btn-default notika-btn-default">보기1</button></td>
								</tr>
								<tr role="row" class="odd">
									<td><a onClick="javascript:page_link();">중급자바</a></td>
									<td>교양</td>
									<td>2</td>
									<td>1학년</td>
									<td>이진우</td>
									<td>65/70</td>
									<td><button class="btn btn-default notika-btn-default">보기2</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="${pageContext.request.contextPath }/notika/js/data-table/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/notika/js/data-table/data-table-act.js"></script>
