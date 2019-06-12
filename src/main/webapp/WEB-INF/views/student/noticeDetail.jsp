<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
#goList{
	float : right;
}
</style>

<!--    메뉴 소개 영역 -->
<c:forEach items="${notices }" varStatus="stat">
	<c:if test="${notice_no eq stat.current.board_no}">
		<c:set var="notice" value="${ stat.current}" />
		<c:if test="${not empty notices[stat.index+1] }">
			<c:set var="next" value="${notices[stat.index+1] }" />
		</c:if>
		<c:if test="${not empty notices[stat.index-1] }">
			<c:set var="prev" value="${notices[stat.index-1] }" />
		</c:if>
	</c:if>
</c:forEach>
<div class="breadcomb-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="breadcomb-list">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<div class="breadcomb-wp">
								<div class="breadcomb-ctn">
									<h2>공지사항 상세</h2>
									<p>
										<span class="bread-ntd">공지사항 상세 페이지</span>
										<button type="button" id="goList" class="btn btn-default notika-btn-default">목록으로</button>
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

<form id="goForm" action="${pageContext.request.contextPath }/studentMain/notice"></form>
<form:form modelAttribute="notice" id="boardForm">
<div class="container">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="view-mail-list sm-res-mg-t-30">
				<div class="mail-ads mail-vw-ph">
					<p class="first-ph">
						<b>분류 : 공지 </b>
					</p>
					<p>
						<b>작성자 : 관리자</b>
					</p>
					<p>
						<b id="noticeTitle">제목 : ${notice.board_title}</b>
					</p>
					<p class="last-ph">
						<b id="noticeDate">작성일 : ${notice.board_date}</b>
					</p>
				</div>
				<div class="file-download-system">
					<div class="dw-st-ic mg-t-20">
						<div id="attachList" class="dw-atc-sn">
							<p>
								<b>첨부파일 : </b>
							</p>
							<c:if test="${not empty notice.savedAttachmentList }">
							<c:forEach items="${notice.savedAttachmentList}" var="pds"
								varStatus="vs">
								<c:if test="${not empty pds.file_name }">
									<span>
										<a href="${pageContext.request.contextPath }/notice/download/${pds.attachment_no }"
											title="파일명:">${pds.file_name }</a>
										&nbsp;&nbsp;
										${not vs.last?"|":"" }
										&nbsp;&nbsp;
									</span>
								</c:if>
							</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
				
				<div id="contentDiv" class="view-mail-atn">${notice.board_content }</div>
				
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="form-element-list mg-t-30">
							<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div>
										<c:if test="${not empty prev }">
											<span> <img
												src="${pageContext.request.contextPath }/notika/images/sort_asc_disabled.png">
												<a
												href="${pageContext.request.contextPath }/notice/${prev.board_no}"
												style="margin-left: 3px;">이전글</a> <a
												href="${pageContext.request.contextPath }/notice/${prev.board_no}"
												style="margin-left: 40px;">${prev.board_title}</a> <span
												style="margin-left: 300px;">관리자</span> <span
												style="margin-left: 100px;">${prev.board_date }</span>
											</span>
										</c:if>
									</div>
									<div>
										<c:if test="${not empty next }">
											<span> <img
												src="${pageContext.request.contextPath }/notika/images/sort_desc_disabled.png">
												<a
												href="${pageContext.request.contextPath }/notice/${next.board_no}"
												style="margin-left: 3px;">다음글</a> <a
												href="${pageContext.request.contextPath }/notice/${next.board_no}"
												style="margin-left: 40px;">${next.board_title }</a> <span
												style="margin-left: 300px;">관리자</span> <span
												style="margin-left: 100px;">${next.board_date }</span>
											</span>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</form:form>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath }/res/js/ckeditor/ckeditor.js"></script>
	
<script>
	$('#goList').on('click', function() {
		$('#goForm').submit();
	});
	
</script>
