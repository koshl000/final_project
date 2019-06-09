<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}/"></c:set>

<script>
	function openNewQuizPage(){
		newPage = window.open('${path}professor/quiz', '', 'width=800, height=700'); return false;
	}
	
	function openMakeQuiz(){
		MakeQuestionPage = window.open('${path}professor/createQuiz', '', 'width=800, height=700'); return false;
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
						<h2>과목명</h2>
					</div>
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="accordion-stn">
								<div class="panel-group" data-collapse-color="nk-green"
									id="accordionGreen" role="tablist" aria-multiselectable="true">
									<div class="panel panel-collapse notika-accrodion-cus">
										<div class="panel-heading active" role="tab">
											<h2 class="panel-title">
												<a data-toggle="collapse" data-parent="#accordionGreen"
													href="#accordionGreen-one" aria-expanded="true" class="">
													1주차 </a>
												<!-- 													<div style="display:inline-block; padding-left:50px;"><h4><a>자바시작하기</a></h4></div> -->
											</h2>
										</div>
										<div id="accordionGreen-one"
											class="collapse in animated flipInX" role="tabpanel"
											aria-expanded="true" style="">
											<div class="panel-body">
												<div>
													<div style="display: inline-block; padding-left: 20px;">
														<strong>강좌명1</strong>
													</div>
													<div style="display: inline-block; padding-left: 50px;">
														<strong>동영상</strong>
														<button class="btn-sm">보기</button>
														<button class="btn-sm">등록</button>
														<button class="btn-sm">수정</button>
													</div>
													<div style="display: inline-block; padding-left: 50px;">
														<strong>퀴즈</strong>
														<button class="btn-sm" onClick="openNewQuizPage()">보기</button>
														<button class="btn-sm" onClick="openMakeQuiz()">등록</button>
													</div>
													<div style="display: inline-block; padding-left: 50px;">
														<strong>시험</strong>
														<button class="btn-sm" onClick="openNewExamPage()">보기</button>
														<button class="btn-sm" onClick="openMakeExam()">등록</button>
													</div>
													<div style="display: inline-block; padding-left: 50px;">
														<strong>설문</strong>
														<button class="btn-sm" onClick="">보기</button>
														<button class="btn-sm" onClick="openMakeSurvey()">등록</button>
													</div>
												</div>
												<div>
													<div style="display: inline-block; padding-left: 20px;">
														<strong>강좌명2</strong>
														<div style="display: inline-block; padding-left: 50px;">
															<strong>동영상</strong>
															<button class="btn-sm">보기</button>
															<button class="btn-sm">등록</button>
															<button class="btn-sm">수정</button>
														</div>
														<div style="display: inline-block; padding-left: 50px;">
															<strong>퀴즈</strong>
															<button class="btn-sm">보기</button>
															<button class="btn-sm">등록</button>
															<button class="btn-sm">수정</button>
														</div>
														<div style="display: inline-block; padding-left: 50px;">
															<strong>시험</strong>
															<button class="btn-sm">보기</button>
															<button class="btn-sm">등록</button>
															<button class="btn-sm">수정</button>
														</div>
													</div>
													<div>
														<div style="display: inline-block; padding-left: 20px;">
															<strong>강좌명3</strong>
															<div style="display: inline-block; padding-left: 50px;">
																<strong>동영상</strong>
																<button class="btn-sm">보기</button>
																<button class="btn-sm">등록</button>
																<button class="btn-sm">수정</button>
															</div>
															<div style="display: inline-block; padding-left: 50px;">
																<strong>퀴즈</strong>
																<button class="btn-sm">보기</button>
																<button class="btn-sm">등록</button>
																<button class="btn-sm">수정</button>
															</div>
															<div style="display: inline-block; padding-left: 50px;">
																<strong>시험</strong>
																<button class="btn-sm">보기</button>
																<button class="btn-sm">등록</button>
																<button class="btn-sm">수정</button>
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
					</div>
				</div>
			</div>
		</div>
	</div>
</div>