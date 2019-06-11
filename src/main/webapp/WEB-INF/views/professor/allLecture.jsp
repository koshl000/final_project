<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
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
<script type="text/javascript">
	$(function() {
		var table = $('#data-table-basic').DataTable({
			ajax : {
				"type" : "get",
				"url" : "${pageContext.request.contextPath}/studentMain/allLecture/allLectureList",
				"dataType" : "JSON"
			},
			columns : [
				{data : "lecture_code"}
				, {data : "lecture_name"}
				, {data : "lecture_coursetype"}
				, {data : "lecture_target"}
				, {data : "openBtn"}
			],
			"order" : []
		)};
		
		$('#tableBody').on('click', 'button', function(){
			var id = $(this).prop('id');
			location.href='${pageContext.request.contextPath}/professorMain/mantoman/'+id;
		});
	});
	
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
									<h2>화상채팅개설</h2>
									<p>
										화상채팅 개설을 위한 강의목록 페이지 <span class="bread-ntd"></span>
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
						<table id="data-table-basic" class="table table-striped dataTable" role="grid" aria-describedby="data-table-basic_info">
							<thead>
								<tr>
									<th>과목코드</th>
									<th>과목명</th>
									<th>이수구분</th>
									<th>학년</th>
									<th>화상채팅 개설</th>
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
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
