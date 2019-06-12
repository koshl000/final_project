/**
 * 
 */
function makeQuestionPage(identifier, boddy, btnType){
	var twoButtonForPr = "<div class='row'>"+"<div class='col-xs-6 col-sm-6 btnSpace'>" + "<button class='btn' type='button' id='close'>닫기</button>";
	var twoButtonForAd = "<button onclick='history.go(-1)'>돌아가기</button>";
	var everyModiBtn = "<button type='button' class='mod'>수정</button><button type='button' class='save' style=display:none;>저장</button>";
	var oneBtn = "<div class='row'>"+"<div class='col-xs-11 col-sm-11 btnSpace'>" +
				"<button class='btn' disabled type='button' id='prev'>이전</button>"+
				"<button class='btn' type='button' id='next'>다음</button>"+
				"<button class='btn' type='button' id='complete'>제출</button>";
	if(identifier=="ROLE_PROFESSOR"&&btnType=='exam'){
//		$(boddy).after(twoButtonForPr);
		$(boddy).find('.coverEach').append(everyModiBtn);
		$(boddy).find('input:checkbox.student').iCheck('destroy');
		$(boddy).find('.student').remove();
		$('input:checkbox').attr('disabled', true);
	} else if(identifier=="ROLE_PROFESSOR"&&btnType=='quiz'){
		$(boddy).find('.coverEach').append(everyModiBtn);
		$(boddy).find('input:checkbox.student').iCheck('destroy');
		$(boddy).find('.student').remove();
		$('input:checkbox').attr('disabled', true);
	} else if(identifier=="ROLE_STUDENT"){
		$(boddy).find('input:checkbox').iCheck('destroy').hide();
		var forms = $(boddy).find('.formT');
		$(boddy).find('.subjectAnswer').remove();
		$(boddy).find('#boddy').after(oneBtn);
		var inputText = [];
		inputText = $(boddy).find('.textQAnswer')
		for (var i = 0; i < inputText.length; i++) {
			if($(inputText[i]).val()!=null&&$(inputText[i]).val().length>0){
				$(inputText[i]).siblings('.subjectInput').attr('type', 'text');
			}
		}
		$(boddy).find('.professor').remove();
		$(boddy).find('.whichType').hide();
	} else if(identifier=="ROLE_ADMIN"){
		$(boddy).after(twoButtonForAd);
		$(boddy).find('.student').remove();
	}
}