/**
 * @Param questionType : formTagName(검색폼의 name값, 필수),
 * 					   	 buttonId(CurrentPage 파라미터명, 옵션),
 */
function makeQuestion(divRange, btnNm, Qnum, Anum){
	var divTag = divRange;
	var buttonType = btnNm;
	var proLength = Qnum;
	var source = "";
	var leftDiv = $(divTag).find("left");
	var centerDiv = $(divTag).find("center");
	if(buttonType=="quiz"||buttonType=="test"){
		for (var idx = 0; idx < Qnum; idx++) {
			if(idx%5==1||idx%5==2||idx%5==3){
				source += "<form id='formquestionNum'>"+
				"<div id='"+buttonType+"Body' class='questionBody questionBodyquestionNum coverEach'>" +
				"<span id='spanYet'></span>" +
				"<input type='hidden' id='lecture_week' class='lecture_week' name='"+buttonType+"List[questionNum].lecture_week'/>" +
				"<input type='hidden' id='lecture_class' name='"+buttonType+"List[questionNum].lecture_class'/>" +
				"<input type='hidden' class='class_identifying_code' name='"+buttonType+"List[questionNum].class_identifying_code'/>" +
				"<textarea name='"+buttonType+"List[questionNum].question_content' id='questionCon' class='QContent form-control auto-size' rows='5' placeholder='문제를 입력하세요'></textarea>";
				for (var idx2 = 0; idx2 < Anum; idx2++) {
					source += "<input name='"+buttonType+"List[questionNum].question_answer' type='checkbox' class='i-checks QAnswer professor' value=''/>"+
					"<input name='"+buttonType+"List[questionNum].problemList[problem_Num].quizProblem_content' class='PContent' type='text' placeholder='선택지를 입력하세요' value=''/>"+
					"<a class='stAnswer'><img src='${pageContext.request.contextPath}/res/images/checkMark.gif'/>${numList[vs2.index]} ${problem.quizProblem_content} <input name='answerList[questionNum].quizAnswer_code' type='hidden' class='i-checks QAnswer student' value=''/></a>"+
					"<br>"+
					"</div>"+"</form>";
//				"<input name='"+buttonType+"List[questionNum].question_answer' type='checkbox' class='i-checks QAnswer' value='problem_no'/></div>" +
//				"<input type='hidden' name='"+buttonType+"List[questionNum].problemList[problem_Num].question_no'>" +
//				"<input type='hidden' name='"+buttonType+"List[questionNum].problemList[problem_Num].quizProblem_no' value='problem_no'>" +
//				"<input name='"+buttonType+"List[questionNum].problemList[problem_Num].quizProblem_content' class='PContent' type='text' placeholder='선택지를 입력하세요'/><br/>" +
//				"</div>";
					source = source.replace(/questionNo/g, (idx+1)); // 보여지는 문제번호
					source = source.replace(/questionNum/g, idx); // 실제 스프링으로 넘어갈 문제_배열의 인덱스값
					source = source.replace(/problem_no/g, (idx2+1)); // 보여지는 선택지 번호
					source = source.replace(/problem_Num/g, idx2); // 실제 스프링으로 넘어갈 선택지_배열의 인덱스값
				}
				$(leftDiv).append(source);
			} else if(idx%5==4||idx%5==0){
				source += "<form id='formquestionNum'>"+
				"<div id='"+buttonType+"Body' class='questionBody questionBodyquestionNum coverEach'>" +
				"<span id='spanYet'></span>" +
				"<input type='hidden' id='lecture_week' class='lecture_week' name='"+buttonType+"List[questionNum].lecture_week'/>" +
				"<input type='hidden' id='lecture_class' name='"+buttonType+"List[questionNum].lecture_class'/>" +
				"<input type='hidden' class='class_identifying_code' name='"+buttonType+"List[questionNum].class_identifying_code'/>" +
				"<textarea name='"+buttonType+"List[questionNum].question_content' id='questionCon' class='QContent form-control auto-size' rows='5' placeholder='문제를 입력하세요'></textarea>";
				for (var idx2 = 0; idx2 < Anum; idx2++) {
					source += "<input type='hidden' id='question_no' />"
					"<input name='"+buttonType+"List[questionNum].question_answer' type='checkbox' class='i-checks QAnswer professor' value='"+(idx2+1)+"'/>"+
					"<input name='"+buttonType+"List[questionNum].problemList[problem_Num].quizProblem_content' class='PContent' type='text' placeholder='선택지를 입력하세요' value=''/>"+
					"<a class='stAnswer'><img src='${pageContext.request.contextPath}/res/images/checkMark.gif'/>${numList[vs2.index]} ${problem.quizProblem_content} <input name='answerList[questionNum].quizAnswer_code' type='hidden' class='i-checks QAnswer student checkAnswer' value='problem_no'/></a>"+
					"<br>"+
					"</div>"+"</form>";
//				"<input name='"+buttonType+"List[questionNum].question_answer' type='checkbox' class='i-checks QAnswer' value='problem_no'/></div>" +
//				"<input type='hidden' name='"+buttonType+"List[questionNum].problemList[problem_Num].question_no'>" +
//				"<input type='hidden' name='"+buttonType+"List[questionNum].problemList[problem_Num].quizProblem_no' value='problem_no'>" +
//				"<input name='"+buttonType+"List[questionNum].problemList[problem_Num].quizProblem_content' class='PContent' type='text' placeholder='선택지를 입력하세요'/><br/>" +
//				"</div>";
					source = source.replace(/questionNo/g, (idx+1)); // 보여지는 문제번호
					source = source.replace(/questionNum/g, idx); // 실제 스프링으로 넘어갈 문제_배열의 인덱스값
					source = source.replace(/problem_no/g, (idx2+1)); // 보여지는 선택지 번호
					source = source.replace(/problem_Num/g, idx2); // 실제 스프링으로 넘어갈 선택지_배열의 인덱스값
				}
				$(centerDiv).append(source);
			}
		}
	} else if(buttonType=="survey"){
		for (var idx = 0; idx < Qnum; idx++) {
			source += "<div id='"+buttonType+"Body' class='questionBody'>" +
			"<span id='spanYet'></span>" +
//			"<select id='selectYet'></select>" +
//			"<button type='button' class='deleteBody'>문제삭제</button>" +
			"<span id='contentYet'>questionNo번</span><input type='hidden' name='"+buttonType+"List[questionNum].question_no' value='questionNo'/>" +
			"<textArea name='"+buttonType+"List[questionNum].question_content' class='QContent' placeholder='문제를 입력하세요'></textArea><br/>";
			for (var idx2 = 0; idx2 < Anum; idx2++) {
				source += 
				"<input name='"+buttonType+"List[questionNum].question_answer' type='radio' value='problem_no' class='radios'/>" +
				"<input name='quizList[questionNum].problemList[problem_Num].quizProblem_content' type='text' class='lsy' placeholder='직접입력'/><br/>";
				source = source.replace(/questionNo/g, (idx+1)); // 보여지는 문제번호
				source = source.replace(/questionNum/g, idx); // 실제 스프링으로 넘어갈 문제_배열의 인덱스값
				source = source.replace(/problem_no/g, (idx2+1)); // 보여지는 선택지 번호
				source = source.replace(/problem_Num/g, idx2); // 실제 스프링으로 넘어갈 선택지_배열의 인덱스값
			}
		}
	}
	source += "</div></div>"
	return source;
	
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
	