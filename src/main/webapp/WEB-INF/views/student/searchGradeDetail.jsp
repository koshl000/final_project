<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Data Table JS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/notika/css/jquery.dataTables.min.css">

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
									<h2>성적상세조회</h2>
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
					<div class="table-responsive">
						<div id="data-table-basic_wrapper" class="dataTables_wrapper">
							<div class="dataTables_length" id="data-table-basic_length">
								<table id="data-table-basic">
									<thead>
										<tr>
											<th>강좌코드</th>
											<th>강좌명</th>
											<th>이수구분</th>
											<th>학점</th>
											<th>평점</th>
											<th>등급</th>
											<th>교강사명</th>
										</tr>
									</thead>
									<tbody id="listBody">
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
	$('#data-table-basic').DataTable({
		scrollY : '200px',
		scrollCollapse : true,
		paging : false,
		ajax : {
			type : 'get',
			url : '${pageContext.request.contextPath}/searchGrade/detail/${openseme_no}',
			dataType : 'json'
		}
		, columns : [ {
			data : "lecture.lecture_code"
		}, {
			data : "lecture.lecture_name"
		}, {
			data : "lecture.lecture_coursetype"
		}, {
			data : "lecture.lecture_credit"
		}, {
			data : "grade.average"
		}, {
			data : "rank"
		},{
			data : "professor_name"
		} ]
		, order : []
	});
</script>