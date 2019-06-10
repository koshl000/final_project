<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}/"></c:set>


<style>
	#classesName{
		display:inline-block;
		width:400px;
	}
</style>
<script>
	function openNewQuizPage(var class_identifying_code, var lecture_class, var lecture_code){
		newPage = window.open('${path}professor/quiz/'+lecture_code+'/'+class_identifying_code+'/'+lecture_class, '',
							  'width=800, height=700'); return false;
	}
	
	function openMakeQuiz(var class_identifying_code, var lecture_class, var lecture_code){
		MakeQuestionPage = window.open('${path}professor/createQuiz'+lecture_code+'/'+class_identifying_code+'/'+lecture_class, '',
									   'width=800, height=700'); return false;
	}
	
	function openMakeExam(){
		MakeQuestionPage = window.open('${path}professor/createExam', '', 'width=800, height=700'); return false;
	}
	var identifier = "학생";
	function openNewExamPage(){
		if(identifier=="학생"){
			alert("확인을 누르시면 시험이 진행됩니다. 아직 준비가 되지 않으셨다면 취소를 눌러주세요.")
			MakeQuestionPage = window.open('${path}professor/showExam', '', 'width=800, height=700'); return false;
		} else {
			MakeQuestionPage = window.open('${path}professor/showExam', '', 'width=800, height=700'); return false;
		}
	}
	
	function openMakeSurvey(){
		MakeQuestionPage = window.open('${path}professor/createSurvey', '', 'width=800, height=700'); return false;
	}
</script>

<div class="accordion-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="accordion-wn-wp">
					<div class="accordion-hd">
							<h2>${lectureInfos.lecture_name}</h2>
					</div>
					<div class="accordion-stn">
                    	<div class="panel-group" data-collapse-color="nk-green" id="accordionGreen" role="tablist" aria-multiselectable="true">
							<c:forEach items="${lectureInfos.lectureWeekInfos}" var="weekInfo" varStatus="vs">
								<div class="panel panel-collapse notika-accrodion-cus">
			                    	<div class="panel-heading" role="tab">
			                        	<h4 class="panel-title">
			                            <a class="collapsed" data-toggle="collapse" data-parent="#accordionGreen" href="#accordionGreen-${vs.count}" aria-expanded="false">
											${vs.count}주차
										</a>
			                            </h4>
			                        </div>
			                		<div id="accordionGreen-${vs.count}" class="collapse" role="tabpanel">
			                			<c:forEach items="${weekInfo.lectureWeekClass}" var="lectureWeekClass">
				                        	<div class="panel-body">
				                            	<div style="display: inline-block; padding-left: 20px;">
													<span style="display:inline-block; padding-right:20px;">
													${lectureWeekClass.lecture_class}교시 </span>
													<strong id="classesName">${lectureWeekClass.lecture_subname }</strong>
												</div>
												<div style="display: inline-block; padding-left: 50px;">
													<strong>동영상</strong>
													<button class="btn-sm">보기</button>
													<button class="btn-sm">등록</button>
													<button class="btn-sm">수정</button>
												</div>
													<div style="display: inline-block; padding-left: 50px;">
														<strong>퀴즈</strong>
														<button class="btn-sm" onClick="openNewQuizPage(
														${lectureWeekClass.class_identifying_code},
														${lectureWeekClass.lecture_class},
														${lectureInfos.lecture_code })">보기</button>
														<button class="btn-sm" onClick="openMakeQuiz(
														${lectureWeekClass.class_identifying_code},
														${lectureWeekClass.lecture_class},
														${lectureInfos.lecture_code })">등록</button>
												</div>
												<div style="display: inline-block; padding-left: 50px;">
													<strong>시험</strong>
													<button class="btn-sm" onClick="openNewExamPage()">보기</button>
													<button class="btn-sm" onClick="openMakeExam()">등록</button>
												</div>
				                            </div>
			                            </c:forEach>
			                        </div>
			                     </div>
			                </c:forEach>
				
				
<!-- 					<div class="accordion-hd"> -->
<%-- 						<h2>${lectureInfos.lecture_name}</h2> --%>
<!-- 					</div> -->
<%-- 					<c:forEach items="${lectureInfos.lectureWeekInfos}" var="weekInfo" varStatus="vs"> --%>
<!-- 						<div class="row"> -->
<!-- 							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> -->
<!-- 								<div class="accordion-stn"> -->
<!-- 									<div class="panel-group" data-collapse-color="nk-green" -->
<!-- 										id="accordionGreen" role="tablist" aria-multiselectable="true"> -->
<!-- 										<div class="panel panel-collapse notika-accrodion-cus"> -->
<!-- 											<div class="panel-heading active" role="tab"> -->
<!-- 												<h2 class="panel-title"> -->
<!-- 													<a data-toggle="collapse" data-parent="#accordionGreen" -->
<!-- 														href="#accordionGreen-one" aria-expanded="true" class=""> -->
<%-- 														${vs.count}주차 </a> --%>
<!-- 												</h2> -->
<!-- 											</div> -->
<%-- 											<c:forEach items="${weekInfo.lectureWeekClass}" var="lectureWeekClass"> --%>
<!-- 												<div id="accordionGreen-one" class="collapse in animated flipInX" role="tabpanel" aria-expanded="true" style=""> -->
<!-- 													<div class="panel-body"> -->
<!-- 														<div> -->
<!-- 															<div style="display: inline-block; padding-left: 20px;"> -->
<%-- 																<strong>${lectureWeekClass.lecture_subname }</strong> --%>
<!-- 															</div> -->
<!-- 															<div style="display: inline-block; padding-left: 50px;"> -->
<!-- 																<strong>동영상</strong> -->
<!-- 																<button class="btn-sm">보기</button> -->
<!-- 																<button class="btn-sm">등록</button> -->
<!-- 																<button class="btn-sm">수정</button> -->
<!-- 															</div> -->
<!-- 															<div style="display: inline-block; padding-left: 50px;"> -->
<!-- 																<strong>퀴즈</strong> -->
<!-- 																<button class="btn-sm" onClick="openNewQuizPage()">보기</button> -->
<!-- 																<button class="btn-sm" onClick="openMakeQuiz()">등록</button> -->
<!-- 															</div> -->
<!-- 															<div style="display: inline-block; padding-left: 50px;"> -->
<!-- 																<strong>시험</strong> -->
<!-- 																<button class="btn-sm" onClick="openNewExamPage()">보기</button> -->
<!-- 																<button class="btn-sm" onClick="openMakeExam()">등록</button> -->
<!-- 															</div> -->
<%-- 											</c:forEach> --%>
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<%-- 					</c:forEach> --%>
					</div></div>
				</div>
			</div>
		</div>
	</div>
</div>
