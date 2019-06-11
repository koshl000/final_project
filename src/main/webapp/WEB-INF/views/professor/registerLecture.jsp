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
	function openNewQuizPage(class_identifying_code, lecture_class, lecture_code){
		newPage = window.open('${path}professor/quiz/'+class_identifying_code+'/'+lecture_class+'/'+lecture_code, '',
							  'width=800, height=700'); return false;
	}
	
	function openMakeQuiz(class_identifying_code, lecture_class, lecture_code){
		MakeQuestionPage = window.open('${path}professor/createQuiz/'+class_identifying_code+'/'+lecture_class+'/'+lecture_code, '',
									   'width=800, height=700'); return false;
	}
	
	function openMakeExam(evalType, evalCode, lecture_code, class_identifying_code){
		MakeQuestionPage = window.open('${path}professor/createExam/'+evalType+'/'+evalCode+'/'+lecture_code+'/'+class_identifying_code, '',
										'width=800, height=700'); return false;
	}
	
	function openQuizSt(class_identifying_code, lecture_class, lecture_code){
		newPage = window.open('${path}student/quiz/'+class_identifying_code+'/'+lecture_class+'/'+lecture_code, '',
		  'width=800, height=700'); return false;
	}
	
	function openNewExamPage(evalType, evalCode, lecture_code, class_identifying_code){
		if('${identifier}'=='ROLE_STUDENT'){
			alert("확인을 누르시면 시험이 진행됩니다. 아직 준비가 되지 않으셨다면 취소를 눌러주세요.")
			MakeQuestionPage = window.open('${path}student/showExam/'+evalType+'/'+evalCode+'/'+lecture_code+'/'+class_identifying_code, '',
											'width=800, height=700'); return false;
		} else {
			MakeQuestionPage = window.open('${path}professor/showExam/'+evalType+'/'+evalCode+'/'+lecture_code+'/'+class_identifying_code, '',
											'width=800, height=700'); return false;
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
                    	<c:forEach  begin="0" end="15" varStatus="vs">
                    		<c:set var="weekInfo" value="${lectureInfos.lectureWeekInfos[vs.index]}"></c:set>
<%-- 							<c:forEach items="${lectureInfos.lectureWeekInfos}" var="weekInfo" varStatus="vs"> --%>
                    		<c:if test="${not empty weekInfo}">
								<div class="panel panel-collapse notika-accrodion-cus">
			                    	<div class="panel-heading" role="tab">
			                        	<h4 class="panel-title">
			                            <a class="collapsed" data-toggle="collapse" data-parent="#accordionGreen" href="#accordionGreen-${vs.count}" aria-expanded='${vs.count eq 1?true:false}'>
											${vs.count}주차
										</a>
			                            </h4>
			                        </div>
			                		<div id="accordionGreen-${vs.count}" class="collapse" role="tabpanel">
			                			<c:if test="${vs.count ne 7}">
			                			<c:forEach items="${weekInfo.lectureWeekClass}" var="lectureWeekClass">
				                        	<div class="panel-body">
				                            	<div style="display: inline-block; padding-left: 20px;">
													<span style="display:inline-block; padding-right:20px;">
													${lectureWeekClass.lecture_class}교시 </span>
													<strong id="classesName">${lectureWeekClass.lecture_subname }</strong>
												</div>
												<div style="display: inline-block; padding-left: 50px;">
													<strong>동영상</strong>
													<button class="btn-sm" onClick="openQuizSt(
														'${lectureWeekClass.class_identifying_code}',
														'${lectureWeekClass.lecture_class}',
														'${lectureInfos.lecture_code}')">보기</button>
													<button class="btn-sm">등록</button>
													<button class="btn-sm">수정</button>
												</div>
													<div style="display: inline-block; padding-left: 50px;">
														<strong>퀴즈</strong>
														<button class="btn-sm" onClick="openNewQuizPage(
														'${lectureWeekClass.class_identifying_code}',
														'${lectureWeekClass.lecture_class}',
														'${lectureInfos.lecture_code}')">보기</button>
														<button class="btn-sm" onClick="openMakeQuiz(
														'${lectureWeekClass.class_identifying_code}',
														'${lectureWeekClass.lecture_class}',
														'${lectureInfos.lecture_code}')">등록</button>
												</div>
				                            </div>
			                            </c:forEach>
			                            </c:if>
			                            <c:if test="${vs.count eq 7}">
			                            	<div class="panel-body">
				                            	<div style="display: inline-block; padding-left: 20px;">
													<span style="display:inline-block; padding-right:20px;">
													</span>
													<strong id="classesName">중간고사</strong>
												</div>
												<div style="display: inline-block; padding-left: 50px;">
													<strong>시험</strong>
													<button class="btn-sm" onClick="openNewExamPage(
													'${evalTypeAndCode[0].evalStudy_type}',	
													'${evalTypeAndCode[0].evalStudy_code}',
													'${lectureInfos.lecture_code}',
													'${lectureWeekClass.class_identifying_code}'
													)">보기</button>
													<button class="btn-sm" onClick="openMakeExam(
													'${evalTypeAndCode[0].evalStudy_type}',	
													'${evalTypeAndCode[0].evalStudy_code}',
													'${lectureInfos.lecture_code}',
													'${lectureWeekClass.class_identifying_code}'
													)">등록</button>
												</div>
				                            </div>
			                            </c:if>
			                        </div>
			                     </div>
			                     </c:if>
			                     <c:if test="${empty weekInfo}">
			                     <div class="panel panel-collapse notika-accrodion-cus">
			                    	<div class="panel-heading" role="tab">
			                        	<h4 class="panel-title">
			                            <a class="collapsed" data-toggle="collapse" data-parent="#accordionGreen" href="#accordionGreen-${vs.count}" aria-expanded=${vs.count eq 1?true:false}>
											${vs.count}주차
										</a>
			                            </h4>
			                        </div>
			                		<div id="accordionGreen-${vs.count}" class="collapse" role="tabpanel">
			                			<c:if test="${vs.count ne 7}">
			                			<c:forEach begin="0" end="2" varStatus="vs2">
				                        	<div class="panel-body">
				                            	<div style="display: inline-block; padding-left: 20px;">
													<span style="display:inline-block; padding-right:20px;">
													${vs2.count}교시 </span>
													<strong id="classesName">미입력 (차시 정보를 입력해주세요.)</strong>
												</div>
												<div style="display: inline-block; padding-left: 50px;">
													<strong>동영상</strong>
													<button class="btn-sm" onClick="openQuizSt(
														'${lectureWeekClass.class_identifying_code}',
														'${lectureWeekClass.lecture_class}',
														'${lectureInfos.lecture_code}')">보기</button>
													<button class="btn-sm">등록</button>
													<button class="btn-sm">수정</button>
												</div>
													<div style="display: inline-block; padding-left: 50px;">
														<strong>퀴즈</strong>
														<button class="btn-sm" onClick="openNewQuizPage(
														'${lectureWeekClass.class_identifying_code}',
														'${lectureWeekClass.lecture_class}',
														'${lectureInfos.lecture_code}')">보기</button>
														<button class="btn-sm" onClick="openMakeQuiz(
														'${lectureWeekClass.class_identifying_code}',
														'${lectureWeekClass.lecture_class}',
														'${lectureInfos.lecture_code}')">등록</button>
												</div>
				                            </div>
			                            </c:forEach>
			                            </c:if>
			                            <c:if test="${vs.count eq 7}">
			                            	<div class="panel-body">
				                            	<div style="display: inline-block; padding-left: 20px;">
													<span style="display:inline-block; padding-right:20px;">
													</span>
													<strong id="classesName">중간고사</strong>
												</div>
												<div style="display: inline-block; padding-left: 50px;">
													<strong>시험</strong>
													<button class="btn-sm" onClick="openNewExamPage(
													'${evalTypeAndCode[0].evalStudy_type}',	
													'${evalTypeAndCode[0].evalStudy_code}',
													'${lectureInfos.lecture_code}',
													'${lectureWeekClass.class_identifying_code}'
													)">보기</button>
													<button class="btn-sm" onClick="openMakeExam(
													'${evalTypeAndCode[0].evalStudy_type}',	
													'${evalTypeAndCode[0].evalStudy_code}',
													'${lectureInfos.lecture_code}',
													'${lectureWeekClass.class_identifying_code}'
													)">등록</button>
												</div>
				                            </div>
			                            </c:if>
			                        </div>
			                     </div>
			                     </c:if>
<%-- 			                </c:forEach> --%>
			                </c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
