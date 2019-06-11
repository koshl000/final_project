<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<c:if test="${close eq 'close'}">
	self.close();
</c:if>
	var start = ${not empty start?start:1};
	var end = ${not empty end?end:5};
	var questions = [];
	var idx = 0;
	var resp;
	var saveBtn; var modifyBtn; var aTags = []; var checkBoxes; var inputTexts; var textAreas; var strongs;
	function completePage(){
		$('.timee').hide();
		$('textArea').hide();
		$("input[type='text']").attr('type', 'hidden');
		if(btnType=="exam"){
		$("#boddy").after("<div class='row'>"+"<div class='col-xs-6 col-sm-6 btnSpace'>" +
				"<button class='btn' disabled type='button' id='prev'>이전</button>"+
				"<button class='btn' type='button' id='next'>다음</button>");	
		}
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
		if(end<20){
			$("#next").attr('disabled', false);
		}
	})
	
	$("body").on("click", '#next', function(event){
		event.preventDefault();
		if(end<20){
			start += 5;
			end += 5;
		}
		$('.questionBody').hide();
		for (start;  start <= end; start++) {
			questions[idx] = $(".questionBody"+eval(start))
			questions[idx++].show();
		}
		if(end==20){
			$("#next").attr('disabled', true);
		}
		if(start>5){
			$("#prev").attr('disabled', false);
		}
	})
	
	$("body").on("click", '#prev', function(event){
		event.preventDefault();
		if(start>5){
			start -= 5;
			end -= 5;
		}
		$('.questionBody').hide();
		for (start;  start <= end; start++) {
			questions[idx] = $(".questionBody"+eval(start))
			questions[idx++].show();
		}
		console.log(start)
		if(start<5){
			$("#prev").attr('disabled', false);
		}
		if(end<20){
			$("#next").attr('disabled', false);
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
		checkBoxs = $(this).siblings('.checkAnswer');
		aTagName = $(this).attr('name');

// 		$(this).find('.checkAnswer').prop('checked');
		for (var i = 0; i <= checkBoxs.length; i++) {
			aTagName = $(this).attr('name');
			if($(checkBoxs[i]).val()==aTagName){
				$(checkBoxs[i]).prop("checked", true);
// 				console.log($(checkBoxs[i]).is(":checked"));
// 				console.log($(checkBoxs[i]).val());
// 				console.log($(checkBoxs[2]).is(":checked"));
			}
		}
	})
	
	$("body").on("click", "#submt", function(event){
		event.preventDefault();
		var form1 = $(".container").find('form');
		var form2 = form1.find("input:checkbox:checked");
		var questionNos = $(this).siblings('.questionNo');
			$(form2).each(function(idx){
				var name = $(this).attr('name');
				var valueDa = $(this).val();
				var name2 = $(this).siblings('.questionNo').attr('name');
				var valueDa2 = $(this).siblings('.questionNo').val();
				var name3 = $(this).siblings('.attend_no').attr('name');
				var valueDa3 =  $(this).siblings('.attend_no').val();
				
				if($(this).prop("checked")==true){
					var standard = $("#yaoZhuannSong").find("[name='"+name2+"']");
					if(!standard||standard.length==0){
						$("<input></input").attr({
							type:'hidden',
							name:name2,
							value:valueDa2
						}).appendTo("#yaoZhuannSong");
						$("<input></input").attr({
							type:'hidden',
							name:name3,
							value:valueDa3
						}).appendTo("#yaoZhuannSong");
					}
					$("<input></input").attr({
						type:"hidden",
						name:name,
						value:valueDa
					}).appendTo("#yaoZhuannSong");
				}
			});
			console.log($('#yaoZhuannSong').html())
			if($('#identifier').val()=='ROLE_PROFESSOR'){
				alert("등록하시겠습니까?");
				$("#yaoZhuannSong").attr("action", "${pageContext.request.contextPath}/student/submit");
				$("#yaoZhuannSong").submit();
			} else if($('#identifier').val()=='ROLE_STUDENT'){
				alert("제출 이후에는 수정이 불가합니다.\n제출하시겠습니까?")
				$("#yaoZhuannSong").attr("action", "${pageContext.request.contextPath}/student/submit");
				$("#yaoZhuannSong").submit();
				console.log($('#yaoZhuannSong').html())
			}
		});
	
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
					var otherType = ["①", "②", "③", "④"];
					for (var i = 0; i < resp.problemList.length; i++) {
						$(aTags[i]).text(otherType[i]+resp.problemList[i].quizProblem_content);
					}
		    	}
			},
		});
		
	})
	
	

</script>

	<form id="yaoZhuannSong" action="${pageContext.request.contextPath}/student/submit" method="post"></form>
	<div class="container">
		<div class='row timeCnt'>
			<div class="col-xs-12 col-sm-12 timeCnt">
				<span><h3>${lectureInfos.lectureWeekInfos[0].lectureWeekClass[0].lecture_subname} / ${lectureInfos.lectureWeekInfos[0].lecture_week}주차 ${lectureInfos.lectureWeekInfos[0].lectureWeekClass[0].lecture_class}교시 : 퀴즈</h3>
				${lectureInfos.lectureWeekInfos[0].lectureWeekClass[0].class_identifying_code}
				${lectureInfos.lectureWeekInfos[0].lecture_code}
				</span>
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
			<div class="col-xs-1 col-sm-1 veryLeft">
			</div>
			<div class="col-xs-5 col-sm-5 left">
			</div>
			<div class="col-xs-5 col-sm-5 center">
			</div>
			<div class="col-xs-1 col-sm-1 right">
			</div>
			
				<c:forEach var="quiz" items="${quizList}" varStatus="vs">
					<c:choose>
						<c:when test="${vs.count%5 eq 1 or vs.count%5 eq 2 or vs.count%5 eq 3}">
							<script>
								$(".left").append(
										"<form id='form${vs.index}' class='formT'>"+
										"<div class='questionBody questionBody${idx} coverEach'>" + 
											"<input type='hidden' id='attendNo' name='answerList[${vs.index}].attend_no' value='${2}' class='student attend_no'>"+
											"<input type='hidden' id='questionNO' name='${btnType}List[questionNum].question_no' value='${quiz.question_no }' class='professor'>"+
											"<input type='hidden' id='questionNO' name='answerList[${vs.index}].question_no' value='${quiz.question_no}' class='student questionNo'>"+
											"<input type='hidden' name='${btnType}List[${vs.index}].question_content' value='${quiz.question_content}' class='professor'>"+
											"<textarea name='quizList[${status.index}].question_content' id='questionCon' class='QContent form-control auto-size professor' disabled rows='5' placeholder='문제를 입력하세요'>${ quiz.question_content }</textarea>" + 
											"<strong><p class='pTag'>${idx}.${quiz.question_content}</p></strong>"+
											"<c:forEach var='problem' items='${quiz.problemList}' varStatus='vs2'>"+
											"<input name='${btnType}List[${vs.index}].question_answer' ${quiz.question_answer.contains(problem.quizProblem_no)?'checked':''} type='checkbox' class='i-checks QAnswer professor' value='${vs2.count}'/>"+
// 											"${quiz.question_answer.contains(problem.quizProblem_no)} ? \"<input name='answeList[${vs.index}].quizProblem_no' type='hidden' class='realQAnswer student' value='${vs2.count}'/>\" : ''}"+
											"<input name='${btnType}List[${status.index}].problemList[${status2.index}].quizProblem_content' class='PContent professor' type='text' placeholder='선택지를 입력하세요' value='${ problem.quizProblem_content}'/>"+
											"<input name='answerList[${vs.index}].stSelect_no' class='i-checks QAnswer checkAnswer student' type='checkbox' value='${vs2.count}'/>"+
											"<a class='stAnswer' name='${vs2.count}'><img src='${pageContext.request.contextPath}/res/images/checkMark.gif'/>${numList[vs2.index]} ${problem.quizProblem_content}</a>"+
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
										"<form id='form${vs.index}' class='formT'>"+
										"<div class='questionBody questionBody${idx} coverEach'>" + 
											"<input type='hidden' id='attendNo' name='answerList[${vs.index}].attend_no' value='${2}' class='student attend_no'>"+
											"<input type='hidden' id='questionNO' name='${btnType}List[questionNum].question_no' value='${quiz.question_no }' class='professor'>"+
											"<input type='hidden' id='questionNO' name='answerList[${vs.index}].question_no' value='${quiz.question_no}' class='student questionNo'>"+
											"<input type='hidden' name='${btnType}List[${vs.index}].question_content' value='${quiz.question_content}' class='professor'>"+
											"<textarea name='quizList[${status.index}].question_content' id='questionCon' class='QContent form-control auto-size professor' disabled rows='5' placeholder='문제를 입력하세요'>${ quiz.question_content }</textarea>" + 
											"<strong><p class='pTag'>${idx}.${quiz.question_content}</p></strong>"+
											"<c:forEach var='problem' items='${quiz.problemList}' varStatus='vs2'>"+
											"<input name='${btnType}List[${vs.index}].question_answer' ${quiz.question_answer.contains(problem.quizProblem_no)?'checked':''} type='checkbox' class='i-checks QAnswer professor' value='${vs2.count}'/>"+
// 											"${quiz.question_answer.contains(problem.quizProblem_no)} ? \"<input name='answeList[${vs.index}].quizProblem_no' type='hidden' class='realQAnswer student' value='${vs2.count}'/>\" : ''}"+
											"<input name='${btnType}List[${status.index}].problemList[${status2.index}].quizProblem_content' class='PContent professor' type='text' placeholder='선택지를 입력하세요' value='${ problem.quizProblem_content}'/>"+
											"<input name='answerList[${vs.index}].stSelect_no' class='i-checks QAnswer checkAnswer student' type='checkbox' value='${vs2.count}'/>"+
											"<a class='stAnswer' name='${vs2.count}'><img src='${pageContext.request.contextPath}/res/images/checkMark.gif'/>${numList[vs2.index]} ${problem.quizProblem_content}</a>"+
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
<input id="identifier" type="hidden" value="${identifier[0]}"/>
<input id="attend_no" type="hidden" value="2"/>
<%-- <input id="attend_no" type="hidden" value="${userVo.attend_no}"/> --%>
<input id="user_id" type="hidden" value="${userVo.user_id}"/>
<input id="btnType" type='hidden' value="${btnType}"/>
<input id="class_identifying_code" type='hidden' value="${lectureInfos.lectureWeekInfos[0].lectureWeekClass[0].class_identifying_code}"/>
<input id="lecture_code" type='hidden' value="${lectureInfos.lectureWeekInfos[0].lecture_code}"/>

<!-- autosize JS
		============================================ -->
    <script src="${pageContext.request.contextPath}/notika/js/autosize.min.js"></script>
     <!-- icheck JS
		============================================ -->
    <script src="${pageContext.request.contextPath}/notika/js/icheck/icheck.min.js"></script>
    <script src="${pageContext.request.contextPath}/notika/js/icheck/icheck-active.js"></script>
    <script src="${pageContext.request.contextPath}/res/js/makeQuestionPage.js"></script>
    
