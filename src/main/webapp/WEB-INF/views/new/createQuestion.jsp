<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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

#complete{
	text-align: center;
}

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

.yaoRemove{
	margin:0px;
}
</style>
<script>
var start = ${not empty start?start:0};
var end = ${not empty end?end:5};
var questions = [];
var selectSS;
var selectSD;
var btnType = $("#btnType").val();
var surveyList; var classList; var examList;
var identifying_code = "";
$(function(){
		var error = "";
		var len; var len2; var len3;
		
		$(".container").on("change", '#whichType', function(event){
			event.preventDefault();
			var selectVal = $(this).val();
			if(selectVal=='주관식'){
				$(this).parents('.questionBody').find('.textQAnswer').show();
				$(this).parents('.questionBody').find('.i-checks').iCheck('destroy').hide();
// 				$(this).parents('.questionBody').find('.yaoRemove').remove();
				$(this).parents('.questionBody').find('.checkQAnswer').val("").hide();
			} else if(selectVal=='객관식'){
// 				$(this).parents('.questionBody').find('.textQAnswer').hide();
// 					var idx = 0;
// 					for (var idx2 = 0; idx2 < 4; idx2++) {
// 						var source = "<div class='yaoRemove'>" + 
// 						"<input name='examList[examNo].questionList[questionNum].problemList[problem_Num].problem_no' type='checkbox' class='examproblem_nno i-checks checkQAnswer question_answer' value='problem_nno'/>" +
// 						"<input name='examList[examNo].questionList[questionNum].problemList[problem_Num].problem_content' class='examproblem_nno PContent problem_content checkQAnswer' type='text' placeholder='선택지를 입력하세요'/><br>";
// 						source = source.replace(/questionNo/g, (idx+1)); 
// 						source = source.replace(/questionNum/g, idx);
// 						source = source.replace(/problem_nno/g, (idx2+1));
// 						source = source.replace(/problem_Num/g, idx2);
// 						source = source.replace(/examNo/g, 0);
// 						source += "</div>"
// 						var txtA = $(this).parents('.questionBody').find('.target');
// 						$(txtA).after(source);
// 					} idx++;
				$(this).parents('.questionBody').find('.textQAnswer').hide();
				$(this).parents('.questionBody').find('.i-checks').iCheck('destroy').show();
				$(this).parents('.questionBody').find('.checkQAnswer').show();
				$(this).parents('.questionBody').find('.i-checks').iCheck({
					checkboxClass: 'icheckbox_square-green',
				});
				}
		})
		
		$(".container").on("click", '#complete',function(event){
			event.preventDefault();
			var form1 = [];
			form1 = $(".container").find('form');
// 			checkboc = form1.find("input:checkbox:checked");
// 			var form2 = form1.find("input:checkbox:checked");
// 				$(checkboc).each(function(idx){
// 			var checkBoxSibling = [];
// 			var checkBoxParent = [];
			var inputs = [];
			var checked;
			for (var idx = 0; idx < form1.length; idx++) {
// 				$(form1[idx]).find('#textQAnswerSet').val($(form1[idx]).find('#textQAnswer').val());
// 				console.log($(form1[idx]).find('#textQAnswerSet').val());
				inputs = $(form1[idx]).find('div').children();
				checked = $(form1[idx]).find('div').children('input:checkbox:checked');
				for (var idx2 = 0; idx2 < inputs.length; idx2++) {
					console.log($(inputs[idx2]).prop('tagName'));
					if($(inputs[idx2]).prop('tagName')=='INPUT'||$(inputs[idx2]).prop('tagName')=='TEXTAREA'){
					var name = $(inputs[idx2]).attr('name');
					var valueDa = [];
					var standard = $("#yaoZhuannSong").find("[name='"+name+"']");
					var idx3;
					if(!standard||standard.length==0&&name.indexOf("exam_type")!=-1){
						$("<input></input>").attr({
							type:'hidden',
							name:name,
							value:$(".selectYet option:selected").val()
						}).appendTo("#yaoZhuannSong");
			 		} else if(!standard||standard.length==0&&name.indexOf("problem_no")!=-1){
			 			$("<input></input>").attr({
							type:'hidden',
							name:name,
							value:$(inputs[idx2]).val()
						}).appendTo("#yaoZhuannSong");
			 		} else if(!standard||standard.length==0&&name.indexOf("objective_answer")!=-1){
			 			for (idx3=0; idx3<checked.length; idx3++) {
							valueDa[idx3]=$(checked[idx3]).val()
						}
			 			console.log(valueDa)
			 			$("<input></input>").attr({
							type:'hidden',
							name:name,
							value:valueDa
						}).appendTo("#yaoZhuannSong");
			 		} else if(!standard||standard.length==0){
						$("<input></input>").attr({
							type:'hidden',
							name:name,
							value:$(inputs[idx2]).val()
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
			}
			
			if(btnType=="quiz"||btnType=="test"){
					var QCinputs = $('.QContent');
					var validated = Array.prototype.filter.call(QCinputs, function(e) {
					return len = e.value.trim().length > 0;
					});
				if(len!=5){
					var QAinputs = $("input:checkbox:checked");
					var validated = Array.prototype.filter.call(QAinputs, function(e) {
					len2 = e.value.trim().length;
					if(len2==0){
						error +="답을 선택해주세요"
					}
					});
				} else {
					error = "모든 문제를 입력해주세요.";
				}
				if(len2>0){
					var PCinputs = $('.PContent')
					var validated = Array.prototype.filter.call(PCinputs, function(e) {
					len3 = e.value.trim().length > 0;
					if(len3<20){
						error += "모든 선택지를 입력해주세요."
					}
					});
				}
			}
			if(error.length<0){
				alert(error)
			} else {
				$("#yaoZhuannSong").submit();
			}
		});
		
			var btnType = "${btnType}";
			var twoBtn = "<div class='row'><div='col-xs-8 col-lg-8 col-sm-8'>" +
							"<button class='btn' disabled type='button' id='prev'>이전</button>"+
							"<button class='btn' type='button' id='next'>다음</button>" +
							"<button class='btn' disabled type='button' id='complete'>제출</button>"
			if(btnType=='quiz'){
				var result = makeQuestion("#boddy", btnType, 5, 4)
				$("#quiz").prop("disabled", true);
				$("#boddy").append(result)
				  		  .after(twoBtn);
				$('#boddy').find('a').hide();
				$(".lecture_code").val();
				$(".lecture_week").val('1');
				$(".container").find('.textQAnswer').hide();
			} else if(btnType=='exam'){
				var result = makeQuestion(".container", btnType, 5, 4)
				var examType = $('.container').find(".timeCnt")[1];
				$(examType).after("<select class='selectYet'><option></option></select>");
				$("#quiz").remove();
				$("#survey").remove();
				$('a').hide();
				$("#test").prop("disabled", true);
				$(".container").find('.textQAnswer').hide();
				var targetRow = $(".row")[1];
				$(targetRow).after(twoBtn);
				showPage($('.questionBody'), 0, 5, '#prev', '#next', '#complete')
// 				$("#test").after(newSelect);
			}
			
			function showPage(questionBody, start, end){
				$(questionBody).hide();
				start = start;
				end = end;
				for (start;  start < end; start++) {
					questions[start] = $(".questionBody"+eval(start))
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
			
			$('#boddy .i-checks').iCheck({
				checkboxClass: 'icheckbox_square-green',
				radioClass: 'iradio_square-green',
			});
			
			showPage($('.questionBody'), start, end);
// 			autosize($('textarea'));
				$.ajax({
				    "url" : "${pageContext.request.contextPath}/professor/selectType/"+btnType,
				    "dataType" : "json",
				    "success" : function(resp){
				    	if(resp.surveyList){
					    	if(resp.surveyList.length>0){
						    	if(resp.surveyList.length > 0){
						    		$(".selectYet").find('option').remove();
						    		for (var idx = 0; idx < resp.surveyList.length; idx++) {
										$(".selectYet").append("<option value='"+resp.surveyList[idx]+"'>"+resp.surveyList[idx]+"</option>");
									}
						    		selectSD = resp.surveySD;
						    		selectSS = resp.surveySC;
						    	}
					    	}
				    	} 
				    	else if(resp.classList){
				    		if(resp.classList.length > 0){
					    		$(".selectYet").find('option').remove();
					    		for (var idx = 0; idx < resp.classList.length; idx++) {
									$(".selectYet").append("<option value='"+resp.classList[idx]+"'>"+resp.classList[idx]+"</option>");
								}
				    		} 
				    	}else if(resp.examList){
				    		if(resp.examList.length > 0){
					    		$(".selectYet").find('option').remove();
					    		for (var idx = 0; idx < resp.examList.length; idx++) {
									$(".selectYet").append("<option value='"+resp.examList[idx]+"'>"+resp.examList[idx]+"</option>");
								}
				    		}
				    	}else {
				    		$(".selectYet").find('option').remove();
				    		$(".selectYet").append("<option value=''>선택</option>")
				    	}
				    }
				});
		
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
})

</script>
	<div class="container">
		<div class='row timeCnt'>
			<div class="col-xs-12 col-sm-12 timeCnt">
				<span><h3>${lectureInfos.lectureWeekInfos[0].lectureWeekClass[0].lecture_subname} / ${lectureInfos.lectureWeekInfos[0].lecture_week}주차 ${lectureInfos.lectureWeekInfos[0].lectureWeekClass[0].lecture_class}교시 : 퀴즈</h3>
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
		<div class='row' id='boddy'>
			<div class="col-xs-1 col-sm-1 veryLeft">
			</div>
			<div class="col-xs-5 col-sm-5 left">
			</div>
			<div class="col-xs-5 col-sm-5 center">
			</div>
			<div class="col-xs-1 col-sm-1 right">
			</div>
		</div>
	</div>
</div>
<input id="identifier" type="hidden" value="${identifier[0]}"/>
<input id="attend_no" type="hidden" value="2"/>
<input id="user_id" type="hidden" value="${userVo.user_id}"/>
<input id="btnType" type='hidden' value="${btnType}"/>
<input id="class_identifying_code" type='hidden' value="${lectureInfos.lectureWeekInfos[0].lectureWeekClass[0].class_identifying_code}"/>
<form id="yaoZhuannSong" action="${pageContext.request.contextPath}/professor/createExam" method="post">
	<input id="lecture_code" type='hidden' value="${lectureInfos.lectureWeekInfos[0].lecture_code}"/>
</form>
<!-- autosize JS
		============================================ -->
    <script src="${pageContext.request.contextPath}/notika/js/autosize.min.js"></script>
     <!-- icheck JS
		============================================ -->
    <script src="${pageContext.request.contextPath}/notika/js/autosize.min.js"></script>
    <script src="${pageContext.request.contextPath}/notika/js/icheck/icheck.min.js"></script>
    <script src="${pageContext.request.contextPath}/notika/js/icheck/icheck-active.js"></script>
	<script src="${pageContext.request.contextPath}/res/js/makeQuestion.js"></script>
	<script src="${pageContext.request.contextPath}/res/js/makeQuestionPage.js"></script>