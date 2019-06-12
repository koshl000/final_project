/**
 * @Param questionType : formTagName(검색폼의 name값, 필수),
 * 					   	 buttonId(CurrentPage 파라미터명, 옵션),
 */
function makeQuestion(formRange, btn, Qnum, Anum){
	var formTag = formRange;
	formTag = $(formTag).find("#boddy");
	var left = $(formTag).find(".left");
	var center = $(formTag).find(".center");
	var btnType = btn;
//	var source = "<div class='container'><div class='row'>";
	var source = "";
	if(btnType=="quiz"){
		for (var idx = 0; idx < Qnum; idx++) {
			if(idx%5==0||idx%5==1||idx%5==2){
				source = "";
				source += "<div id='"+btnType+"Body' class='questionBody'>" +
				"<span id='spanYet'>questionNo번</span>" +
				"<input type='hidden' id='lecture_week' class='lecture_week' name='"+btnType+"List[questionNum].lecture_week'/>" +
				"<input type='hidden' id='lecture_class' name='"+btnType+"List[questionNum].lecture_class'/>" +
				"<input type='hidden' class='lecture_code' name='"+btnType+"List[questionNum].lecture_code'/>" +
				"<input type='hidden' class='class_identifying_code' name='"+btnType+"List[questionNum].class_identifying_code'/>" +
				"<textarea name='"+btnType+"List[questionNum].question_content' class='QContent form-control auto-size' rows='10' placeholder='문제를 입력하세요'/>" +
				"</textarea></div></div>";
				for (var idx2 = 0; idx2 < Anum; idx2++) {
					source += "<input name='"+btnType+"List[questionNum].question_answer' type='checkbox' class='i-checks QAnswer' value='problem_nno'/>" +
					"<input type='hidden' name='"+btnType+"List[questionNum].problemList[problem_Num].question_no' value='questionNo'/>" +
					"<input type='hidden' name='"+btnType+"List[questionNum].problemList[problem_Num].quizProblem_no' value='problem_nno'/>" +
					"<input name='"+btnType+"List[questionNum].problemList[problem_Num].quizProblem_content' class='PContent' type='text' placeholder='선택지를 입력하세요'/><br/>" +
					"</div>";
					source = source.replace(/questionNo/g, (idx+1)); // 보여지는 문제번호
					source = source.replace(/questionNum/g, idx); // 실제 스프링으로 넘어갈 문제_배열의 인덱스값
					source = source.replace(/problem_nno/g, (idx2+1)); // 보여지는 선택지 번호
					source = source.replace(/problem_Num/g, idx2); // 실제 스프링으로 넘어갈 선택지_배열의 인덱스값
				} $(left).append(source);
			} else if(idx%5==3||idx%5==4){
				source = "";
				source += "<div id='"+btnType+"Body' class='questionBody'>" +
				"<span id='spanYet'>questionNo번</span>" +
				"<input type='hidden' id='lecture_week' class='lecture_week' name='"+btnType+"List[questionNum].lecture_week'/>" +
				"<input type='hidden' id='lecture_class' name='"+btnType+"List[questionNum].lecture_class'/>" +
				"<input type='hidden' id='lecture_code' class='lecture_code' name='"+btnType+"List[questionNum].lecture_code'/>" +
				"<input type='hidden' class='class_identifying_code' name='"+btnType+"List[questionNum].class_identifying_code'/>" +
				"<textarea name='"+btnType+"List[questionNum].question_content' class='QContent form-control auto-size' rows='10' placeholder='문제를 입력하세요'/>" +
				"</textarea></div></div>";
				for (var idx2 = 0; idx2 < Anum; idx2++) {
					source += "<input name='"+btnType+"List[questionNum].question_answer' type='checkbox' class='i-checks QAnswer' value='problem_nno'/>" +
					"<input type='hidden' name='"+btnType+"List[questionNum].problemList[problem_Num].question_no' value='questionNo'/>" +
					"<input type='hidden' name='"+btnType+"List[questionNum].problemList[problem_Num].quizProblem_no' value='problem_nno'/>" +
					"<input name='"+btnType+"List[questionNum].problemList[problem_Num].quizProblem_content' class='PContent' type='text' placeholder='선택지를 입력하세요'/><br/>" +
					"</div>";
					source = source.replace(/questionNo/g, (idx+1)); // 보여지는 문제번호
					source = source.replace(/questionNum/g, idx); // 실제 스프링으로 넘어갈 문제_배열의 인덱스값
					source = source.replace(/problem_nno/g, (idx2+1)); // 보여지는 선택지 번호
					source = source.replace(/problem_Num/g, idx2); // 실제 스프링으로 넘어갈 선택지_배열의 인덱스값
				}  $(center).append(source)
			}
		}
	} else if(btnType=="exam"){
		for (var idx = 0; idx < Qnum; idx++) {
			if(idx%5==0||idx%5==1||idx%5==2){
				source = "";
				source += "<form id='formquestionNum' class='formT'>"+
				"<div class='questionBody questionBodyquestionNum coverEach'>" +
				"<span id='spanYet'></span><select id='whichType'><option value='객관식'>객관식</option><option value='주관식'>주관식</option></select>" +
				"<input type='hidden' id='exam_no' class='question_exam_no examParent' name='examList[examNo].exam_no'/>" +
				"<input type='hidden' id='exam_no' class='question_exam_no examParent' name='examList[examNo].questionList[questionNum].exam_no'/>" +
				"<input type='hidden' id='exam_type' class='exam_type examParent' name='examList[examNo].exam_type'/>" +
				"<span id='contentYet'>questionNo번</span>" +
				"<input type='hidden' name='examList[examNo].questionList[questionNum].question_no' class='question_question_no examParent' value='questionNo'>" +
				"<textarea name='examList[examNo].questionList[questionNum].question_content' class='QContent form-control auto-size question_content target examParent' rows='3' placeholder='문제를 입력하세요'>" +
				"</textarea>" + 
				"<input name='examList[examNo].questionList[questionNum].subjective_answer' type='text' class='examproblem_nno textQAnswer question_answer' value='' placeholder='정답을 입력하세요.'/>" +
				"<input name='examList[examNo].questionList[questionNum].objective_answer' type='hidden' class='examproblem_nno QAnswer question_answer' value=''/>";
				for (var idx2 = 0; idx2 < Anum; idx2++) {
					source += "<div class='yaoRemove'><input name='' type='checkbox' class='examproblem_nno i-checks checkQAnswer question_answer' value='problem_nno'/>" +
					"<input name='examList[examNo].questionList[questionNum].problemList[problem_Num].problem_content' class='examproblem_nno PContent problem_content checkQAnswer' type='text' placeholder='선택지를 입력하세요'/><br>" + 
					"<input type='hidden' class='examproblem_nno problem_question_no' name='examList[examNo].questionList[questionNum].problemList[problem_Num].question_no' value='questionNo'>" +
					"<input type='hidden' class='examproblem_nno problem_no' name='examList[examNo].questionList[questionNum].problemList[problem_Num].problem_no' value='problem_nno'>" +
					"<input type='hidden' id='exam_no' class='examproblem_nno problem_exam_no' name='examList[examNo].questionList[questionNum].problemList[problem_Num].exam_no'/>";
					source = source.replace(/questionNo/g, (idx+1)); // 보여지는 문제번호
					source = source.replace(/questionNum/g, idx); // 실제 스프링으로 넘어갈 문제_배열의 인덱스값
					source = source.replace(/problem_nno/g, (idx2+1)); // 보여지는 선택지 번호
					source = source.replace(/problem_Num/g, idx2); // 실제 스프링으로 넘어갈 선택지_배열의 인덱스값
					source = source.replace(/problem_Num/g, idx2); // 실제 스프링으로 넘어갈 선택지_배열의 인덱스값
					source = source.replace(/examNo/g, 0); // 실제 스프링으로 넘어갈 선택지_배열의 인덱스값
				} source += "</div></div></form>"
					$(left).append(source)
			} else if(idx%5==3||idx%5==4){
				source = "";
				source += "<form id='formquestionNum' class='formT'>"+
				"<div class='questionBody questionBodyquestionNum coverEach'>" +
				"<span id='spanYet'></span><select id='whichType'><option value='객관식'>객관식</option><option value='주관식'>주관식</option></select>" +
				"<input type='hidden' id='exam_no' class='question_exam_no examParent' name='examList[examNo].exam_no'/>" +
				"<input type='hidden' id='exam_no' class='question_exam_no examParent' name='examList[examNo].questionList[questionNum].exam_no'/>" +
				"<input type='hidden' id='exam_type' class='exam_type examParent' name='examList[examNo].exam_type'/>" +
				"<span id='contentYet'>questionNo번</span>" +
				"<input type='hidden' name='examList[examNo].questionList[questionNum].question_no' class='question_question_no examParent' value='questionNo'>" +
				"<textarea name='examList[examNo].questionList[questionNum].question_content' class='QContent form-control auto-size question_content target examParent' rows='3' placeholder='문제를 입력하세요'>" +
				"</textarea>" + 
				"<input id='textQAnswer' name='examList[examNo].questionList[questionNum].subjective_answer' type='text' class='examproblem_nno textQAnswer question_answer' placeholder='정답을 입력하세요.'/>" +
				"<input name='examList[examNo].questionList[questionNum].objective_answer' type='hidden' class='examproblem_nno QAnswer question_answer' value=''/>";
				for (var idx2 = 0; idx2 < Anum; idx2++) {
					source += "<div class='yaoRemove'><input name='' type='checkbox' class='examproblem_nno i-checks checkQAnswer question_answer' value='problem_nno'/>" +
					"<input name='examList[examNo].questionList[questionNum].problemList[problem_Num].problem_content' class='examproblem_nno PContent problem_content checkQAnswer' type='text' placeholder='선택지를 입력하세요'/><br>" + 
					"<input type='hidden' class='examproblem_nno problem_question_no' name='examList[examNo].questionList[questionNum].problemList[problem_Num].question_no' value='questionNo'>" +
					"<input type='hidden' class='examproblem_nno problem_no' name='examList[examNo].questionList[questionNum].problemList[problem_Num].problem_no' value='problem_nno'>" +
					"<input type='hidden' id='exam_no' class='examproblem_nno problem_exam_no' name='examList[examNo].questionList[questionNum].problemList[problem_Num].exam_no'/>";
					source = source.replace(/questionNo/g, (idx+1)); // 보여지는 문제번호
					source = source.replace(/questionNum/g, idx); // 실제 스프링으로 넘어갈 문제_배열의 인덱스값
					source = source.replace(/problem_nno/g, (idx2+1)); // 보여지는 선택지 번호
					source = source.replace(/problem_Num/g, idx2); // 실제 스프링으로 넘어갈 선택지_배열의 인덱스값
					source = source.replace(/problem_Num/g, idx2); // 실제 스프링으로 넘어갈 선택지_배열의 인덱스값
					source = source.replace(/examNo/g, 0); // 실제 스프링으로 넘어갈 선택지_배열의 인덱스값
				} source += "</div></div></form>"
					$(center).append(source)
			}
		} 
	} else if(btnType=="survey"){
		for (var idx = 0; idx < Qnum; idx++) {
			source += "<div id='"+btnType+"Body' class='questionBody'>" +
			"<span id='spanYet'><option></option></span>" +
			"<span id='contentYet'>questionNo번</span><input type='hidden' name='"+btnType+"List[questionNum].question_no' value='questionNo'/>" +
			"<textArea name='"+btnType+"List[questionNum].question_content' class='QContent' placeholder='문제를 입력하세요'></textArea><br/>";
			for (var idx2 = 0; idx2 < Anum; idx2++) {
				source += 
				"<input name='"+btnType+"List[questionNum].question_answer' type='radio' value='problem_no' class='radios'/>" +
				"<input name='quizList[questionNum].problemList[problem_Num].quizProblem_content' type='text' class='lsy' placeholder='직접입력'/><br/>";
				source = source.replace(/questionNo/g, (idx+1)); // 보여지는 문제번호
				source = source.replace(/questionNum/g, idx); // 실제 스프링으로 넘어갈 문제_배열의 인덱스값
				source = source.replace(/problem_no/g, (idx2+1)); // 보여지는 선택지 번호
				source = source.replace(/problem_Num/g, idx2); // 실제 스프링으로 넘어갈 선택지_배열의 인덱스값
			}
		}
	}
	source += "</div></div>"
	return;
	
}

function reorder(){
	var innerTags = $(outer).find(".inner");
	$(innerTags).each(function(idx, ptag){
		
	})
	}

function makeSelect(formm, selectType){
	var radios = formm.find($('.radios'));
	var radiosLength = formm.find($('.radios')).length;
	var inputs = formm.find($('.lsy'));
	var spans = new Array();
	for (var i = 0; i < radiosLength; i++) {
		$(inputs[i]).attr('type', 'hidden');
		$(inputs[i]).val(selectType[i%5]);
		spans[i] = document.createElement("span");
		$(spans[i]).text(selectType[i%5]);
		$(radios[i]).after($(spans[i]));
		$(radios[i]).remove();
	}
}
	