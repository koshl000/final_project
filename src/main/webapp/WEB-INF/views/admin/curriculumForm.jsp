<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
<style>
	table>th {
		text-align: center;
	}
</style>
<script>
   $(function(){
	   $(".saveBtn").on("click", function(e) {
		   var a = $("select[name=openseme_no]").val();
		   var b = $("input[name=lecture_name]").val();
		   var c = $("select[name=lecture_target]").val();
		   var d = $("select[name=lecture_coursetype]").val();
		   var f = $("select[name=lecture_credit]").val();
		   var g = $("select[name=user_id]").val();
		   var h = $("select[name=lecture_target]").val();
		   var i = $("select[name=lower_organization]").val();
		   if(a==""||b==""||c==""||d==""||f==""||g==""||h==""||i=="") {
			   alert("입력값을 모두 입력해주세요.")
			   e.preventDefault();
		   }
	   });

   })
   
   function listLocation() {
        window.location = "lecture";
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
									<h2>교육과정관리</h2>
									<p>
										교육과정을 조회하고 관리하는 게시판입니다. <span class="bread-ntd"></span>
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
					<form:form modelAttribute="lecture" method="post" id="lectureForm">
						<div>
							<table class="table table-bordered">
								<tr>
									<th><span>학기선택</span></th>
									<td>
							            <select name="openseme_no" class="semester form-control">
							            	<option value=""></option>
							            		<c:set var="osVo" value="${osVo}" />
												<c:choose>
													<c:when test="${not empty osVo}">
														<option value="${osVo.next_openseme_no }" ${osVo.next_openseme_no eq lecture.openseme_no ? "selected":"" }>${osVo.next_openseme_year}년${osVo.next_openseme_semester}학기</option>
													</c:when>
													<c:otherwise>
														<option value=""></option>
													</c:otherwise>
												</c:choose>
							            </select>
						            </td>
					            </tr>
					            <tr>
					            	<th><span>교과목명</span></th>
						            <td><input name="lecture_name" type="text" class="form-control" value="${lecture.lecture_code }"/></td>
					            </tr>
					            <tr>
						            <th>
						            	<span>대상학년</span>
						            </th>
						            <td>
							            <select name="lecture_target" class="academicYear form-control">
							            	<option value=""></option>
							            	<option value="0" ${"0" eq lecture.lecture_target ? "selected":"" }>0학년</option>
							            	<option value="1" ${"1" eq lecture.lecture_target ? "selected":"" }>1학년</option>
							            	<option value="2" ${"2" eq lecture.lecture_target ? "selected":"" }>2학년</option>
							            	<option value="3" ${"3" eq lecture.lecture_target ? "selected":"" }>3학년</option>
							            	<option value="4" ${"4" eq lecture.lecture_target ? "selected":"" }>4학년</option>
							            </select>
						            </td>
					            </tr>
					            
					            <tr>
						            <th><span>이수구분</span>
						            <td>
					            	<select name="lecture_coursetype" class="courseType form-control">
					            		<option value=""></option>
					            		<option value="전공" ${"전공" eq lecture.lecture_coursetype ? "selected":"" }>전공</option>
					            		<option value="교양" ${"교양" eq lecture.lecture_coursetype ? "selected":"" }>교양</option>
					            	</select>
					            	</td>
				            	</tr>
				            	<tr>
						            <th><span>학점</span></th>
						            <td>
						            <select name="lecture_credit" class="credit form-control">
						            	<option value=""></option>
						            	<option value="3">3</option>
						            </select>
						            </td>
					            </tr>
					            <tr>
						            <th><span>담당교수선택</span></th>
						            <td>
						            <select name="user_id" class="form-control prof">
						            	<option value=""></option>
						            	<c:forEach items="${profList}" var="item" >
						            		<option value="${item.user_id }">${item.user_name }</option>
						            	</c:forEach>
						            </select>
						            </td>
					            </tr>
					            <tr>
						            <th><span>학과선택</span></th>
						            <td>
						            <select name="lower_organization" class="form-control lower">
						            	<option value=""></option>
						            	<c:forEach items="${lowerList}" var="lower" >
						            		<option value="${lower.lower_organization }">${lower.lower_organization }</option>
						            	</c:forEach>
						            </select>
					            </tr>
				            </table>
				            <c:choose>
				            	<c:when test="${not empty lecture }">
						            <span>교과목 개요</span><textArea id="lectureInfo"></textArea><br>
						            <span>수업진행방법</span><textArea id="classProgress"></textArea><br>
						            <span>교재/참고자료</span><textArea id="textBook"></textArea><br>
				            	</c:when>
				            </c:choose>
				            <button type="button" class="btn btn-default notika-btn-default waves-effect listBtn" onclick="listLocation()">목록</button>
				            <button type="submit" class="btn btn-default notika-btn-default waves-effect saveBtn">설정저장</button><br>
				         </div>
			         </form:form>
				</div>  
			</div>
		</div>
	</div>
</div>

<script src="https://cdn.ckeditor.com/4.11.4/standard-all/ckeditor.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>

<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/i18n/defaults-*.min.js"></script>
<script type="text/javascript">
	CKEDITOR.replace("lectureInfo");
	CKEDITOR.replace("classProgress");
	CKEDITOR.replace("textBook");
</script>