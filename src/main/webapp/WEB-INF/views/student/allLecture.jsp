<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<script type="text/javascript">
	$(function() {
		var table = $('#data-table-basic').DataTable({
			ajax : {
				"type" : "get",
				"url" : "${pageContext.request.contextPath}/mail/allLecture/allLectureList",
				"dataType" : "JSON"
			},
			columns : [
				{data : "lecture_code"}
				, {data : "lecture_name"}
				, {data : "lecture_coursetype"}
				, {data : "lecture_credit"}
				, {data : "lecture_target"}
				, {data : "user_id"}
				, {data : "lecture_capacity"}
				, {data : "lecture_plan"}
			],
			"order" : []
		});
	})
	
	function page_link() {
		window.open("${pageContext.request.contextPath }/subjectPage/eduGoal", "상세강의보기", "width=1000, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=yes");
	}
</script>

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
						<table id="data-table-basic" class="table table-striped dataTable"
							role="grid" aria-describedby="data-table-basic_info">
							<div id="searchDiv"></div>
							<thead>
								<tr>
									<th>과목코드</th>
									<th>과목명</th>
									<th>이수구분</th>
									<th>학점</th>
									<th>학년</th>
									<th>담당교수</th>
									<th>수강인원</th>
									<th>강의계획서</th>
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

<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
