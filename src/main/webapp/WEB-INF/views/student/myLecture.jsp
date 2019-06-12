<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!--    메뉴 소개 영역 -->
<div class="breadcomb-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="breadcomb-list">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<div class="breadcomb-wp">
							<div class="breadcomb-icon">
										<i class="notika-icon notika-draft"></i>
									</div>
								<div class="breadcomb-ctn">
									<h2>나의강의</h2>
									<p>
									강의명을 클릭하시면  해당 과목페이지로 이동합니다. <span class="bread-ntd"></span>
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
						<table id="data-table-basic">
							<thead>
								<tr>
									<th>강좌명</th>
									<th>이수구분</th>
									<th>학점</th>
									<th>수강인원</th>
									<th>강의계획서</th>
								</tr>
							</thead>
							<tbody id="tableBody">

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script>
	$('#data-table-basic')
			.DataTable(
					{
						ajax : {
							"type" : "get",
							"url" : "${pageContext.request.contextPath}/myLecture/${user.user_id}",
							"dataType" : "JSON"
						},
						columns : [ {
							data : "lecture_name"
						}, {
							data : "lecture_coursetype"
						}, {
							data : "lecture_credit"
						}, {
							data : "lecture_current"
						}, {
							data : "syllabusBtn"
						} ],
						"order" : []
					});

	$('#tableBody').on('click', 'a', function(e) {
		var href = $(this).attr('href');
		$(this).attr('href', '${pageContext.request.contextPath}/' + href);
	})
</script>