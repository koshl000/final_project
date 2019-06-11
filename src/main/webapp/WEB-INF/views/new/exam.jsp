<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<c:if test="${result eq '성공'}">
	self.close();
</c:if>
	var source;
	var start = ${not empty start?start:0};
	var end = ${not empty end?end:5};
	var questions = [];
	var idx = 0;
	var resp;
	var saveBtn; var modifyBtn; var aTags = []; var checkBoxes; var inputTexts; var textAreas; var strongs;
	function completePage(){
		if($("#identifier")=="ROLE_PROFESSOR"&&'${btnType}'=='exam'){
			$('.timee').hide();
			$("#boddy").after("<div class='row'>"+"<div class='col-xs-6 col-sm-6 btnSpace'>" +
					"<button class='btn' disabled type='button' id='prev'>이전</button>"+
					"<button class='btn' type='button' id='next'>다음</button>"+
					"<button class='btn' type='button' id='complete'></button>"
						);	
		}
		$('textArea').hide();
		$("input[type='text']").attr('type', 'hidden');
	}
	
	function showPage(questionBody, start, end){
		$(questionBody).hide();
		start = start;
		end = end;
		var questions = [];
		for (start;  start < end; start++) {
			questions[start] = $(".question"+eval(start))
			questions[start].show();
		}
	}
	
	function showBtn(start, end, prevBtn, nextBtn, subBtn){
		if(start==0){
			$(prevBtn).prop('disabled', true);
		} 
		if(start!=0){
			$(prevBtn).prop('disabled', false);
			if(end==20){
				$(nextBtn).prop('disabled', true);
				$(subBtn).prop('disabled', false);
			} else if(end!=20){
				$(nextBtn).prop('disabled', false);
				$(subBtn).prop('disabled', true);
			} 
		} 
	}
	
	$(".container").on('click', '#next', function(event){
		event.preventDefault;
		if(end<20){
			start += 5;
			end += 5;
			showPage('.questionBody', start, end);
			showBtn(start, end, '#prev', '#next', '#complete')
		}
	})
	
	$(".container").on('click', '#prev', function(event){
		event.preventDefault;
		if(end!=5){
			start -= 5;
			end -= 5;
			showPage('.questionBody', start, end);
			showBtn(start, end, '#prev', '#next', '#complete');
		}
	})
	
	$(function(){
		completePage();
		var identifier = $("#identifier").val();
		makeQuestionPage(identifier, $(".container"), '${btnType}');
		$('.questionBody').hide();
		showPage('.questionBody', start, end);
		showBtn(start, end, '#prev', '#next', '#complete');
	});
	
	$("body").on("click", ".stAnswer", function(event){
		event.preventDefault();
		if($(this).find('img').hasClass('visible')){
			$(this).find('img').removeClass('visible');
		}else{
			$(this).find('img').addClass('visible');
		}
		var checkBoxs = [];
		checkBoxs = $(this).siblings('.checkQAnswer');
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
	
	$("body").on("click", "#complete", function(event){
		event.preventDefault();
		var form1 = [];
		form1 = $(".container").find('.formT');
		var children = [];
		var checked;
		for (var idx = 0; idx < form1.length; idx++) {
			children = $(form1[idx]).find('div').children();
			checked = $(form1[idx]).find('div').children('input:checkbox:checked');
			console.log(children.length)
			for (var idx2 = 0; idx2 < children.length; idx2++) {
				console.log($(children[idx2]).prop('tagName'));
				if($(children[idx2]).prop('tagName')=='INPUT'||$(children[idx2]).prop('tagName')=='TEXTAREA'){
				var name = $(children[idx2]).attr('name');
				var valueDa = [];
				var standard = $("#yaoZhuannSong").find("[name='"+name+"']");
				var idx3;
				if(!standard||standard.length==0&&name.indexOf("attend_no")!=-1){
					$("<input></input>").attr({
						type:'hidden',
						name:name,
						value:$("#attend_no").val()
					}).appendTo("#yaoZhuannSong");
		 		} else if(!standard||standard.length==0&&name.indexOf("subjective_answer")!=-1){
		 			$("<input></input>").attr({
						type:'hidden',
						name:name,
						value:$(children[idx2]).val()
					}).appendTo("#yaoZhuannSong");
		 		} else if(!standard||standard.length==0&&name.indexOf("exam_no")!=-1){
		 			$("<input></input>").attr({
						type:'hidden',
						name:name,
						value:$("#exam_no").val()
					}).appendTo("#yaoZhuannSong");
		 		} else if(!standard||standard.length==0&&name.indexOf("problem_no")!=-1){
		 			for (idx3=0; idx3<checked.length; idx3++) {
						valueDa[idx3]=$(checked[idx3]).val()
					}
		 			$("<input></input>").attr({
						type:'hidden',
						name:name,
						value:valueDa
					}).appendTo("#yaoZhuannSong");
		 		} else if(!standard||standard.length==0){
					$("<input></input>").attr({
						type:'hidden',
						name:name,
						value:$(children[idx2]).val()
					}).appendTo("#yaoZhuannSong");
				} 
		  	 }
			}
		}
		console.log($("#yaoZhuannSong"))
		if($('#identifier').val()=='ROLE_PROFESSOR'){
			alert("등록하시겠습니까?");
			$("#yaoZhuannSong").attr("action", "${pageContext.request.contextPath}/student/submit");
			$("#yaoZhuannSong").submit();
		} else if($('#identifier').val()=='ROLE_STUDENT'){
			alert("제출 이후에는 수정이 불가합니다.\n제출하시겠습니까?")
			$("#yaoZhuannSong").attr("action", "${pageContext.request.contextPath}/professor/createExamAnswer");
			$("#yaoZhuannSong").submit();
		}
	})
	
	$("body").on("change", "#whichType", function(event){
		var havingAll = $(this).parents('.coverEach');
		if($(this).val()=="주관식"){
			subjecAnswer.attr('type', 'text');
			checkBoxes = $(havingAll).find(".i-checks")
			checkBoxes.val("");
			$(havingAll).find('.textQAnswer').show();
			$(havingAll).find('.i-checks').iCheck('destroy').hide();
			$(havingAll).find('.i-checks').iCheck('uncheck'); 
			inputTexts = $(havingAll).find(".PContent");  $(inputTexts).val(""); $(inputTexts).attr('type', 'hidden');
		} else if($(this).val()=="객관식"){
			$(havingAll).find('.textQAnswer').hide();
			subjecAnswer.val("");
			subjecAnswer.attr('type', 'hidden');
			checkBoxes = $(havingAll).find(".i-checks").attr('type', 'checkbox');
			inputTexts = $(havingAll).find(".PContent"); $(inputTexts).attr('type', 'text');
			checkBoxes = $(havingAll).find(".i-checks")
			$(checkBoxes).attr('disabled', false);
			$(checkBoxes).iCheck({checkboxClass: 'icheckbox_square-green'});
		}
	})
	
	$("body").on("click", ".mod", function(event){
		event.preventDefault();
		var havingAll = $(this).parents('.coverEach');
		aTags = $(havingAll).find(".stAnswer"); aTags.hide();
		var select = $(this).siblings("#whichType");
		$(select).prop('disabled', false)
		pTag = $(havingAll).find('.pTag'); $(pTag).hide()
		textAreas = $(havingAll).find('textarea'); $(textAreas).attr('disabled', false).show();
		strongs = $(havingAll).find('.examContent'); $(strongs).css('display', 'none');
		subjecAnswer = $(havingAll).find('.textQAnswer');
		if($(select).val()=="주관식"){
			subjecAnswer.attr('type', 'text').show();
			inputTexts = $(havingAll).find(".PContent"); $(inputTexts).attr('type', 'hidden');
		} else if($(select).val()=="객관식"){
			$(havingAll).find('.textQAnswer').hide();
			subjecAnswer.attr('type', 'hidden');
			checkBoxes = $(havingAll).find(".i-checks"); $(checkBoxes).attr('disabled', false);
			inputTexts = $(havingAll).find(".PContent"); $(inputTexts).attr('type', 'text');
		}
		modifyBtn = $(this); $(modifyBtn).hide();
		$(havingAll).find(".save").css('display', 'block');		
	})
	
	$("body").on("click", ".save", function(event){
		saveBtn = $(this);
		$(saveBtn).hide();
		var havingAll = $(this).parents('.coverEach');
		$(havingAll).find(".mod").show();	
		
		checkedBoxes = $(havingAll).find("input:checkbox:checked");
		var sendData = {
						exam_no: '${examVo.exam_no}',
						question_no:$(havingAll).find(".question_no").val(),
						subjective_answer:$(havingAll).find('.textQAnswer').val(),
						objective_answer:"",
						question_content:$(havingAll).find('.question_content').val(),
						problemList: [],
						exam_type:"중간고사"
				}
		var answers = [];
		if(checkedBoxes.length>0){
			for (var i = 0; i < checkedBoxes.length; i++) {
				answers.push(checkedBoxes[i].value)
			}
		}
		sendData.objective_answer = answers.join();
		pList = $(havingAll).find('.PContent');
		var pNoList = $(havingAll).find(".problem_no");
		for (var i = 0; i < pList.length; i++) {
			sendData.problemList.push(
									   {
										 problem_no:pNoList[i].value,
										 exam_no:'${examVo.exam_no}',
										 problem_content:pList[i].value,
										 question_no:$(havingAll).find(".question_no").val()
										}
									 )
		}
		console.log(sendData)
		$.ajax({
		    type : 'post',
		    url : "${pageContext.request.contextPath}/professor/updateQuestion",
		    data : JSON.stringify(sendData),
		    contentType:'application/json;charset=utf-8',
		    dataType : "json",
		    success : function(resp){
		    	if(resp!=null){
		    		alert("수정이 완료 되었습니다.");
					inputTexts.attr('type', 'hidden');
					textAreas.css('display', 'none');
					$(havingAll).find('.textQAnswer').hide();
					$(textAreas).siblings(".examContent").children().show();
					strongs.css('display', 'block')
					strongs.children('.pTag').text(resp.questionList[0].question_content);
					checkedBoxes = $(havingAll).find('.i-checks');
					$(checkedBoxes).prop('disabled', true);
					inputTexts.attr('type', 'hidden');
					$(havingAll).find('#whichType').attr('disabled', true)
					if(resp.questionList[0].objective_answer!=null){
					<c:forEach var='numIcon' items='${numList}' varStatus='vs3'>
						$(aTags[${vs3.index}]).text('${numIcon}'+resp.questionList[0].problemList[${vs3.index}].problem_content).show()
						if($(checkedBoxes[i]).val()!=null&&resp.questionList[0].objective_answer.includes($(checkedBoxes[i]).val())){
							$(checkedBoxes[i]).iCheck('check');
						}
					</c:forEach>
					} else if(resp.questionList[0].subjective_answer!=null){
						$(havingAll).find('.ForSubjec').text(resp.questionList[0].subjective_answer).show()
					}
		    	}
			},
		});
		
	})
	
	

</script>

	<form id="yaoZhuannSong" method="post"></form>
	<div class="container">
		<div class='row timeCnt'>
			<div class="col-xs-12 col-sm-12 timeCnt">
				<span><h3>과목명 중간고사</h3>
				</span>
				<span style="font-size: 10pt; font-weight: 500" class="timee"> 
				<span style="padding-left: 8px; font-weight: 500" class="timee">Timer</span>
				<span id="min" style="width: 15px; font-weight: 500; text-align: right" class="timee">
				</span>분
				<span id="sec" style="width: 15px; font-weight: 500; text-align: right" class="timee">
				</span>초</span>
			</div>
		</div>
<!--   function hideDiv (){  -->
<!--   document.getElementById("l01").style.display="none";  -->
<!-- }  -->
<!-- self.setTimeout("hideDiv()",2000); // 초 지정 -->

<!-- </script> -->


<!-- <div id="l01" style="width:300px; height:300px; border:2px solid#eee">2초뒤에 사라집니다</div> -->
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
			updateTime();
		</script>
		<div class='row' id='boddy'>
			<div class="col-xs-1 col-sm-1 veryLeft">
			</div>
			<div class="col-xs-5 col-sm-5 left">
			</div>
			<div class="col-xs-5 col-sm-5 center">
			</div>
			<div class="col-xs-1 col-sm-1 right">
			</div>
			
			<c:set var="questionList" value="${examVo.questionList}"></c:set>
<%-- 				<c:set var="idx" value="0"/> --%>
<%-- 				<c:set var='idx2' value='0'/> --%>
				<c:forEach var="questionVo" items="${questionList}" varStatus="vs">
					<c:choose>
						<c:when test="${vs.count%5 eq 1 or vs.count%5 eq 2 or vs.count%5 eq 3}">
							<script>
							source = "";
							source = "<form id='formquestionNum' class='formT'>"+
									"<div class='questionBody question${vs.index} coverEach'>" +
									"<select id='whichType' class='whichType' disabled>";
							if(${not empty fn:trim(questionVo.subjective_answer)}){
								source += "<option selected>주관식</option><option>객관식</option></select>";
							} else if(${not empty fn:trim(questionVo.objective_answer)}){
								source += "<option>주관식</option><option selected>객관식</option></select>";
							}
							source += "<input type='hidden' id='exam_no' class='question_exam_no examParent professor' name='examList[0].exam_no' value='${examVo.exam_no}'/>" +
							"<input type='hidden' id='exam_type' class='exam_type examParent professor' name='examList[0].exam_type'/>" +
								"<input type='hidden' id='exam_no' class='question_exam_no examParent professor' name='examList[0].questionList[${vs.index}].exam_no' value='${questionVo.exam_no}'/>" +
								"<span id='contentYet'>${vs.count}번</span>" +
								"<input type='hidden' name='examList[0].questionList[${vs.index}].question_no' class='question_no examParent professor' id='question_no' value='${questionVo.question_no}'>" +
								"<textarea name='examList[0].questionList[${vs.index}].question_content' class='QContent form-control auto-size question_content target examParent professor' rows='3' placeholder='문제를 입력하세요'>" +
								"${questionVo.question_content}</textarea>" + 
								"<strong class='examContent'><p class='pTag ForMod'>${questionVo.question_content}</p></strong>"+
								"<input name='examList[0].questionList[${vs.index}].subjective_answer' type='text' class='examproblem_nno textQAnswer question_answer professor' value='${questionVo.subjective_answer}' placeholder='정답을 입력하세요.'/>" +
								"<p class='pTag subjectAnswer'>${questionVo.subjective_answer}</p>"+
								"<input name='examList[0].questionList[${vs.index}].objective_answer' type='hidden' class='examproblem_nno QAnswer question_answer professor' value='${questionVo.objective_answer}'/>" +
								"<input class='student' name='answerList[${vs.index}].exam_no' type='hidden' value='${examVo.exam_no}'/>"+
								"<input class='student' name='answerList[${vs.index}].attend_no' type='hidden'/>"+
								"<input class='student' name='answerList[${vs.index}].question_no' type='hidden' value='${questionVo.question_no}'/>"+
								"<input class='student' name='answerList[${vs.index}].subjective_answer' type='text'/>"+
								"<input class='student' name='answerList[${vs.index}].exam_no' type='hidden'/>"+
								"<c:forEach var='problemVo' items='${questionVo.problemList}' varStatus='vs3'>";
									if(${not empty fn:trim(questionVo.subjective_answer)}){
										source += "<div class='yaoRemove'><input name='' type='hidden' class='examproblem_nno i-checks checkQAnswer question_answer professor' ${questionVo.objective_answer.contains(problemVo.problem_no.substring(0,1))?'checked':''} value='${vs3.count}'/>" +
										"<input name='examList[0].questionList[${vs.index}].problemList[${vs3.index}].problem_content' class='examproblem_nno PContent problem_content checkQAnswer professor' type='hidden' placeholder='선택지를 입력하세요' value='${problemVo.problem_content}'/>";
									} else if(${not empty fn:trim(questionVo.objective_answer)}){
										source += "<div class='yaoRemove'><input name='' type='checkbox' class='examproblem_nno i-checks checkQAnswer question_answer professor' ${questionVo.objective_answer.contains(problemVo.problem_no.substring(0,1))?'checked':''} value='${vs3.count}'/>" +
										 "<input name='answerList[${vs.index}].problem_no' type='checkbox' class='examproblem_nno checkQAnswer student' value='${vs3.count}'/>" +
										"<input name='examList[0].questionList[${vs.index}].problemList[${vs3.index}].problem_content' class='examproblem_nno PContent problem_content checkQAnswer professor' type='text' placeholder='선택지를 입력하세요' value='${problemVo.problem_content}'/>" + 
										"<a class='stAnswer' name='${vs3.count}'><img src='${pageContext.request.contextPath}/res/images/checkMark.gif'/>${numList[vs3.index]} ${problemVo.problem_content}</a>"+
										"<br>";
									}
									source += "<input type='hidden' class='examproblem_nno problem_question_no professor' name='examList[0].questionList[${vs.index}].problemList[${vs3.index}].question_no' value='${problemVo.question_no}'>" +
									"<input type='hidden' class='examproblem_nno problem_no professor' name='examList[0].questionList[${vs.index}].problemList[${vs3.index}].problem_no' value='${problemVo.problem_no}'>" +
									"<input type='hidden' id='exam_no' class='examproblem_nno problem_exam_no professor' name='examList[0].questionList[${vs.index}].problemList[${vs3.index}].exam_no' value='${examVo.exam_no}'/>" +
								"</c:forEach>"+"</div></div></form>";
								$(".left").append(source);
							</script>
						</c:when>
						<c:when test="${vs.count%5 eq 4 or vs.count%5 eq 0}">
 							<script>
 							var source = "";
							source = "<form id='formquestionNum' class='formT'>"+
								"<div class='questionBody question${vs.index} coverEach'>" +
								"<span id='spanYet'></span><select id='whichType' class='whichType' disabled>";
						if(${not empty fn:trim(questionVo.subjective_answer)}){
							source += "<option selected>주관식</option><option>객관식</option></select>";
						} else if(${not empty fn:trim(questionVo.objective_answer)}){
							source += "<option>주관식</option><option selected>객관식</option></select>";
						}
						source += "<input type='hidden' id='exam_no' class='question_exam_no examParent professor' name='examList[0].exam_no' value='${examVo.exam_no}'/>" +
						"<input type='hidden' id='exam_type' class='exam_type examParent professor' name='examList[0].exam_type'/>" +
							"<input type='hidden' id='exam_no' class='question_exam_no examParent professor' name='examList[0].questionList[${vs.index}].exam_no' value='${questionVo.exam_no}'/>" +
							"<span id='contentYet'>${vs.count}번</span>" +
							"<input type='hidden' name='examList[0].questionList[${vs.index}].question_no' class='question_no examParent professor' id='question_no' value='${questionVo.question_no}'>" +
							"<textarea name='examList[0].questionList[${vs.index}].question_content' class='QContent form-control auto-size question_content target examParent professor' rows='3' placeholder='문제를 입력하세요'>" +
							"${questionVo.question_content}</textarea>" + 
							"<strong class='examContent'><p class='pTag ForMod'>${questionVo.question_content}</p></strong>"+
							"<input name='examList[0].questionList[${vs.index}].subjective_answer' type='text' class='examproblem_nno textQAnswer question_answer professor' value='${questionVo.subjective_answer}' placeholder='정답을 입력하세요.'/>" +
							"<p class='pTag subjectAnswer'>${questionVo.subjective_answer}</p>"+
							"<input name='examList[0].questionList[${vs.index}].objective_answer' type='hidden' class='examproblem_nno QAnswer question_answer professor' value='${questionVo.objective_answer}'/>" +
							"<input class='student' name='answerList[${vs.index}].exam_no' type='hidden' value='${examVo.exam_no}'/>"+
							"<input class='student' name='answerList[${vs.index}].attend_no' type='hidden'/>"+
							"<input class='student' name='answerList[${vs.index}].question_no' type='hidden' value='${questionVo.question_no}'/>"+
							"<input class='student' name='answerList[${vs.index}].subjective_answer' type='text'/>"+
							"<input class='student' name='answerList[${vs.index}].exam_no' type='hidden'/>"+
							"<c:forEach var='problemVo' items='${questionVo.problemList}' varStatus='vs3'>";
								if(${not empty fn:trim(questionVo.subjective_answer)}){
									source += "<div class='yaoRemove'><input name='' type='hidden' class='examproblem_nno i-checks checkQAnswer question_answer professor' ${questionVo.objective_answer.contains(problemVo.problem_no.substring(0,1))?'checked':''} value='${vs3.count}'/>" +
									"<input name='examList[0].questionList[${vs.index}].problemList[${vs3.index}].problem_content' class='examproblem_nno PContent problem_content checkQAnswer professor' type='hidden' placeholder='선택지를 입력하세요' value='${problemVo.problem_content}'/>";
								} else if(${not empty fn:trim(questionVo.objective_answer)}){
									source += "<div class='yaoRemove'><input name='' type='checkbox' class='examproblem_nno i-checks checkQAnswer question_answer professor' ${questionVo.objective_answer.contains(problemVo.problem_no.substring(0,1))?'checked':''} value='${vs3.count}'/>" +
									 "<input name='answerList[${vs.index}].problem_no' type='checkbox' class='examproblem_nno checkQAnswer student' value='${vs3.count}'/>" +
									"<input name='examList[0].questionList[${vs.index}].problemList[${vs3.index}].problem_content' class='examproblem_nno PContent problem_content checkQAnswer professor' type='text' placeholder='선택지를 입력하세요' value='${problemVo.problem_content}'/>" + 
									"<a class='stAnswer' name='${vs3.count}'><img src='${pageContext.request.contextPath}/res/images/checkMark.gif'/>${numList[vs3.index]} ${problemVo.problem_content}</a>"+
									"<br>";
								}
								source += "<input type='hidden' class='examproblem_nno problem_question_no professor' name='examList[0].questionList[${vs.index}].problemList[${vs3.index}].question_no' value='${problemVo.question_no}'>" +
								"<input type='hidden' class='examproblem_nno problem_no professor' name='examList[0].questionList[${vs.index}].problemList[${vs3.index}].problem_no' value='${problemVo.problem_no}'>" +
								"<input type='hidden' id='exam_no' class='examproblem_nno problem_exam_no professor' name='examList[0].questionList[${vs.index}].problemList[${vs3.index}].exam_no' value='${examVo.exam_no}'/>" +
							"</c:forEach>"+"</div></div></form>";
									$(".center").append(source);
							</script>
						</c:when>
				</c:choose>
			</c:forEach>
		</div>
	</div>
</div>
<input id="identifier" type="hidden" value="${identifier[0]}"/>
<input id="attend_no" type="hidden" value="CS001002"/>
<input id="user_id" type="hidden" value="${userVo.user_id}"/>
<input id="exam_no" type="hidden" value="${examVo.exam_no}"/>
<input id="btnType" type='hidden' value="${btnType}"/>
<input id="lecture_code" type='hidden' value="${lecture_code}"/>

<!-- autosize JS
		============================================ -->
    <script src="${pageContext.request.contextPath}/notika/js/autosize.min.js"></script>
     <!-- icheck JS
		============================================ -->
    <script src="${pageContext.request.contextPath}/notika/js/icheck/icheck.min.js"></script>
    <script src="${pageContext.request.contextPath}/notika/js/icheck/icheck-active.js"></script>
    <script src="${pageContext.request.contextPath}/res/js/makeQuestionPage.js"></script>
    
