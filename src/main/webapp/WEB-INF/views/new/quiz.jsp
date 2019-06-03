<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<style>
p{
	margin:5px;
}
div{
	margin-bottom:20px;
}
a{
	color:black;
	padding-left:15px;
}
a:hover {
	background: yellow;
	text-decoration: none;
}

.btnSpace {
	text-align: center;
	margin-bottom:10px;
}
.timeCnt {
	text-align: center;
}

.max_tickets {display:none;}

.question .btn {
	margin: 20px;
	width: 200px;
}

#modify{
	text-align:right;
}
img{
	position: relative; 
    height: 10px; 
    width: 10px; 
    visibility:hidden; 
}
img.visible { 
    visibility:visible; 
} 
</style>
<script>
	var start = ${start}
	var end = ${end}
	var questions = [];
	var idx = 0;
	var resp;
	var saveBtn; var modifyBtn; var aTags = []; var checkBoxes; var inputTexts; var textAreas; var strongs;
	function completePage(){
		$('.timee').hide();
		$('textArea').hide();
		$("input[type='text']").attr('type', 'hidden');
	}
	
	$(function(){
		completePage();
		var identifier = $("#identifier").val();
		makeQuestionPage(identifier, $(".container"), '${btnType}');
		$('.questionBody').hide();
		
		for (start;  start <= end; start++) {
			questions[idx] = $(".questionBody"+eval(start))
			questions[idx++].show();
		}
	})
	
	$("body").on("click", ".stAnswer", function(event){
		event.preventDefault();
		if($(this).find('img').hasClass('visible')){
			$(this).find('img').removeClass('visible');
		}else{
			$(this).find('img').addClass('visible');
		}
		var checkBoxs = [];
		checkBoxs = $(this).siblings('input:checkbox');
		console.log($(this).find('.checkAnswer').val());
		for (var i = 0; i <= checkBoxs.length; i++) {
			if($(checkBoxs[i]).val()==$(this).find('.checkAnswer').val()){
				$(checkBoxs[i]).prop("checked", true);
			}
		}
	})
	
	$("body").on("click", ".mod", function(event){
		event.preventDefault();
		aTags = $(this).siblings('a'); aTags.hide();
		var havingAll = $(this).parents('.coverEach');
		aTags = $(havingAll).find('a');
		textAreas = $(havingAll).find('textarea'); $(textAreas).attr('disabled', false).show();
		strongs = $(havingAll).find('strong'); $(strongs).css('display', 'none');
		checkBoxes = $(havingAll).find(".QAnswer"); $(checkBoxes).attr('disabled', false);
		inputTexts = $(havingAll).find(".PContent"); $(inputTexts).attr('type', 'text');
		modifyBtn = $(this); $(modifyBtn).hide();
		$(havingAll).find(".save").css('display', 'block');		
	})
	
	$("body").on("click", ".save", function(event){
		saveBtn = $(this);
		$(saveBtn).hide();
		var havingAll = $(this).parents('.coverEach');
		$(havingAll).find(".mod").show();	
		
		var checkedBoxes = $(havingAll).find("input:checkbox:checked");
		console.log(checkedBoxes);
		var sendData = {
				question_no: $(havingAll).find('#questionNO').val(),
				question_content:$(havingAll).find("#questionCon").val(),
				class_identifying_code:$('#class_identifying_code').val(),
				lecture_code:$('#lecture_code').val(),
				question_answer:"",
				problemList: []
				}
		var answers = [];
		if(checkedBoxes.length>0){
			for (var i = 0; i < checkedBoxes.length; i++) {
				answers.push(checkedBoxes[i].value)
			}
		}
		sendData.question_answer = answers.join();
		pList = $(havingAll).find('.PContent');
		AList = $(havingAll).find('.QAnswer');
		for (var i = 0; i < pList.length; i++) {
			sendData.problemList.push(
									   {
										 quizProblem_no:AList[i].value,
										 quizProblem_content:pList[i].value,
										 question_no:$(havingAll).find('#questionNO').val()
										}
									 )
		}
		console.log(sendData)
		$.ajax({
		    type : 'post',
		    url : "${pageContext.request.contextPath}/professor/resetOneQuiz",
		    data : JSON.stringify(sendData),
		    contentType:'application/json;charset=utf-8',
		    dataType : "json",
		    success : function(resp){
		    	if(resp!=null){
					alert("수정이 완료 되었습니다.");
					checkBoxes.attr('disabled', true);
					inputTexts.attr('type', 'hidden');
					textAreas.css('display', 'none');
					strongs.css('display', 'block')
					strongs.children('.pTag').text(resp.question_content);
					checkBoxes.attr('disabled', true);
					inputTexts.attr('type', 'hidden');
					aTags.show();
					for (var i = 0; i < resp.problemList.length; i++) {
						$(aTags[i]).text(resp.problemList[i].quizProblem_content);
					}
		    	}
			},
		});
		
	})
	
	

</script>
<body>
	<div class="container">
		<div class='row timeCnt'>
			<div class="col-xs-12 col-sm-12 timeCnt">
				<span>퀴즈인지 시험인지 구분할 것 / ${quizList[0].lecture_code} / 주차와 차시 or 주차와 시험구분</span>
				<span style="font-size: 10pt; font-weight: 500" class="timee"> 
				<span style="padding-left: 8px; font-weight: 500" class="timee">Timer</span>
				<span id="min" style="width: 15px; font-weight: 500; text-align: right" class="timee">
				</span>분
				<span id="sec" style="width: 15px; font-weight: 500; text-align: right" class="timee">
				</span>초</span>
			</div>
		</div>

		<script type="text/javascript" language="javascript">
			$("#takeExam").on('click', function(){
				$('.timeCnt').show();
				updateTime();
			})
			function updateTime() {
				var now = new Date();
				var t = now.getTime() - startDate.getTime();
				var s = Math.round(t / 1000);

				min.innerHTML = Math.floor(s / 60);
				sec.innerHTML = s % 60;
				setTimeout("updateTime()", 500);
			}
			var startDate = new Date();
// 			updateTime();
		</script>
		<c:set var="idx" value="1" />
		<c:set var='idx2' value='0'/>
		<div class='row' id='boddy'>
			<div class="col-xs-4 col-sm-4 left">
			</div>
			<div class="col-xs-4 col-sm-4 center">
			</div>
			
			<div class="col-xs-4 col-sm-4 right">
			</div>
			
				<c:forEach var="quiz" items="${quizList}" varStatus="vs">
					<c:choose>
						<c:when test="${vs.count%5 eq 1 or vs.count%5 eq 2 or vs.count%5 eq 3}">
							<script>
								$(".left").append(
								"<form id='form${vs.index}'>"+
								"<div class='questionBody questionBody${idx} coverEach'>" + 
									"<input type='hidden' id='questionNO' name='${btnType}List[questionNum].question_no' value='${quiz.question_no }'>"+
									"<input type='hidden' name='${btnType}List[${vs.index}].question_content' value='${quiz.question_content}'>"+
									"<textarea name='quizList[${status.index}].question_content' id='questionCon' class='QContent form-control auto-size professor' disabled rows='5' placeholder='문제를 입력하세요'>${ quiz.question_content }</textarea>" + 
									"<strong><p class='pTag'>${idx}.${quiz.question_content}</p></strong>"+
									"<c:forEach var='problem' items='${quiz.problemList}' varStatus='vs2'>"+
									"<input name='quizList[${vs.index}].question_answer' ${quiz.question_answer.contains(problem.quizProblem_no)?'checked':''} type='checkbox' class='i-checks QAnswer professor' value='${vs2.count}'/>"+
									"<input name='${btnType}List[${status.index}].problemList[${status2.index}].quizProblem_content' class='PContent professor' type='text' placeholder='선택지를 입력하세요' value='${ problem.quizProblem_content}'/>"+
									"<input name='answerList[${vs.index}].quizAnswer_code' class='i-checks QAnswer checkAnswer student' type='checkbox' value='${vs2.count}'/>"+
									"<a class='stAnswer'><img src='${pageContext.request.contextPath}/res/images/checkMark.gif'/>${numList[vs2.index]} ${problem.quizProblem_content} <input name='answerList[questionNum].quizAnswer_code' type='hidden' class='i-checks QAnswer student checkAnswer' value='${vs2.count}'/></a>"+
									"<br>"+
									"</c:forEach>"+
									"<c:set var='idx' value='${idx+1}' />"+
									"</div>"+"</form>"
								);
							</script>
						</c:when>
						<c:when test="${vs.count%5 eq 4 or vs.count%5 eq 0}">
							<script>
								$(".center").append(
										"<form id='form${vs.index}'>"+
										"<div class='questionBody questionBody${idx} coverEach'>" + 
											"<input type='hidden' id='questionNO' name='${btnType}List[questionNum].question_no' value='${quiz.question_no }'>"+
											"<input type='hidden' name='${btnType}List[${vs.index}].question_content' value='${quiz.question_content}'>"+
											"<textarea name='quizList[${status.index}].question_content' id='questionCon' class='QContent form-control auto-size professor' disabled rows='5' placeholder='문제를 입력하세요'>${ quiz.question_content }</textarea>" + 
											"<strong><p class='pTag'>${idx}.${quiz.question_content}</p></strong>"+
											"<c:forEach var='problem' items='${quiz.problemList}' varStatus='vs2'>"+
											"<input name='quizList[${vs.index}].question_answer' ${quiz.question_answer.contains(problem.quizProblem_no)?'checked':''} type='checkbox' class='i-checks QAnswer professor' value='${vs2.count}'/>"+
											"<input name='${btnType}List[${status.index}].problemList[${status2.index}].quizProblem_content' class='PContent professor' type='text' placeholder='선택지를 입력하세요' value='${ problem.quizProblem_content}'/>"+
											"<a class='stAnswer'><img src='${pageContext.request.contextPath}/res/images/checkMark.gif'/>${numList[vs2.index]} ${problem.quizProblem_content} <input name='answerList[${status.index}].quizAnswer_code' type='hidden' class='i-checks QAnswer student' value='${vs2.count}'/></a>"+
											"<br>"+
											"</c:forEach>"+
											"<c:set var='idx' value='${idx+1}' />"+
											"</div>"+"</form>"
								)
							</script>
						</c:when>
				</c:choose>
			</c:forEach>
			<span id='testTextA'></span>
		</div>
	</div>
</div>
<input id="qStart" type="hidden" value="1"/>
<input id="identifier" type="hidden" value="학생"/>
<input id="attend_no" type="hidden" value="1"/>
<input id="user_id" type="hidden" value="st_001"/>
<input id="btnType" type='hidden' value="${btnType}"/>
<input id="class_identifying_code" type='hidden' value="${quizList[0].class_identifying_code}"/>
<input id="lecture_code" type='hidden' value="${quizList[0].lecture_code}"/>

<!-- autosize JS
		============================================ -->
    <script src="${pageContext.request.contextPath}/notika/js/autosize.min.js"></script>
     <!-- icheck JS
		============================================ -->
    <script src="${pageContext.request.contextPath}/notika/js/icheck/icheck.min.js"></script>
    <script src="${pageContext.request.contextPath}/notika/js/icheck/icheck-active.js"></script>
    <script src="${pageContext.request.contextPath}/res/js/makeQuestionPage.js"></script>
    
</body>
</html>