<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Data Table JS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/notika/css/jquery.dataTables.min.css">
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
									<h2>성적조회</h2>
									<p>
										성적조회 페이지 <span class="bread-ntd"></span>
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
						<span>이름</span><span>${user.user_name }</span> <span>학부</span><span>전산학부</span> <span>학과</span><span>콤퓨타</span>
						<span>학년</span><span>4학년</span>
					</div>
					<div class="table-responsive">
						<div id="data-table-basic_wrapper" class="dataTables_wrapper">
							<div class="dataTables_length" id="data-table-basic_length">
								<table id="table">
									<thead>
										<tr>
											<th>학년도/학기</th>
											<th>학년</th>
											<th>총과목</th>
											<th>이수과목</th>
											<th>취득학점</th>
											<th>총점</th>
											<th>평점평균</th>
											<th>누적평점평균</th>
										</tr>
									</thead>
									<tbody>
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
<!-- Data Table JS
		============================================ -->
<script
	src="${pageContext.request.contextPath }/notika/js/data-table/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath }/notika/js/data-table/data-table-act.js"></script>
<script>
	$('#table').DataTable({
		ajax : {
			type : 'get',
			url : '${pageContext.request.contextPath}/searchGrade/${user.user_id}',
			dataType : 'json'
		}
		, columns : [ {
			data : "seme"
		}, {
			data : "grade"
		}, {
			data : "totalLecture"
		}, {
			data : "completeLecture"
		}, {
			data : "completeCredit"
		}, {
			data : "totalAverage"
		}, {
			data : "accumulateAverage"
		} ],
	});
</script>