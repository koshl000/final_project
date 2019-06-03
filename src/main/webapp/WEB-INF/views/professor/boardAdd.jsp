<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- dropzone CSS
		============================================ -->
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
									<h2>게시글 등록</h2>
									<p>
										게시글 등록 페이지 <span class="bread-ntd"></span>
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
<c:forEach items="${user.authorities }" varStatus="stat">
	<c:if test="${stat.current.authority eq 'ROLE_STUDENT' }">
		<c:set var="studAuth" value="${stat.current.authority }" />
	</c:if>
	<c:if test="${stat.current.authority eq 'ROLE_PROFESSOR' }">
		<c:set var="profAuth" value="${stat.current.authority }" />
	</c:if>
</c:forEach>
<form:form id="boardForm" modelAttribute="board" action="${pageContext.request.contextPath }/${lecture_code }/board/create"
	method="post" enctype="multipart/form-data">
<div class="summernote-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="view-mail-list sm-res-mg-t-30">
					<div class="cmp-int mg-t-20">
						<div class="row">
							<div class="col-lg-1 col-md-2 col-sm-2 col-xs-12">
								<div class="cmp-int-lb cmp-int-lb1 text-right">
									<span>게시판선택 </span>
								</div>
							</div>
							<div class="col-lg-11 col-md-10 col-sm-10 col-xs-12">
								<div class="form-group">
									<div class="nk-int-st cmp-int-in cmp-email-over">
										<select id="typeSelector" name="board_type"
											aria-controls="data-table-basic">
											<c:if test="${not empty profAuth }">
												<option>강좌공지</option>
											</c:if>
											<option>일반</option>
											<option>질문</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-1 col-md-2 col-sm-2 col-xs-12">
								<div class="cmp-int-lb cmp-int-lb1 text-right">
									<span>제목 : </span>
								</div>
							</div>
							<div class="col-lg-11 col-md-10 col-sm-10 col-xs-12">
								<div class="form-group">
									<div class="nk-int-st cmp-int-in cmp-email-over">
										<input id="newTitle" type="title" class="form-control"
											name="board_title" placeholder="게시글 제목을 입력하세요." />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<c:forEach begin="0" end="4" step="1">
					<input type="file" name="bo_files">
				</c:forEach>
				
				<textarea id="contextArea" rows="20" cols="50"></textarea>
				<input type="hidden" name="writer" value="${user.user_name }">
				<input type="hidden" name="lecture_code" value="${lecture_code }">
				<input type="hidden" name="user" value="${user.user_id }">
				<input id="create" type="submit" value="등록"/>
				<button type="button">취소</button>
				</form:form>
			</div>
		</div>
	</div>
</div>

<!-- dropzone JS
   ============================================ -->
<script
	src="${pageContext.request.contextPath }/res/js/ckeditor/ckeditor.js"></script>
<script>
	CKEDITOR.replace('contextArea');
	
	$('#create').on('click',function(){
		var content = CKEDITOR.instances.contextArea.getData();
		$('#boardForm').append(
			$("<input>").attr({
				type:"hidden"
				, name:"board_content"
				, value:content.trim()
			})		
		);
	});
</script>