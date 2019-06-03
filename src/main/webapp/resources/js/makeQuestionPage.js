/**
 * 
 */
function makeQuestionPage(identifier, boddy, btnType){
	var twoButtonForSt = "<div class='row'>"+"<div class='col-xs-6 col-sm-6 btnSpace'>" + "<button class='btn' type='button' id='submt'>제출</button>";
	var twoButtonForPr = "<div class='row'>"+"<div class='col-xs-6 col-sm-6 btnSpace'>" + "<button class='btn' type='button' id='close'>닫기</button>";
	var twoButtonForAd = "<button onclick='history.go(-1)'>돌아가기</button>";
	var everyModiBtn = "<button type='button' class='mod'>수정</button><button type='button' class='save' style=display:none;>저장</button>";
	
	
	if(identifier=="교수"&&btnType=='exam'){
		$(boddy).after(twoButtonForPr);
		$(boddy).find('.coverEach').append(everyModiBtn);
		$(boddy).find('.student').remove();
		$('input:checkbox').attr('disabled', true);
	} else if(identifier=="교수"&&btnType=='quiz'){
		$(boddy).find('.coverEach').append(everyModiBtn);
		$(boddy).find('.student').remove();
		$(boddy).after(twoButtonForPr);
		$(boddy).find('.student').iCheck('destroy');
		$(boddy).find('.student').remove();
		$('input:checkbox').attr('disabled', true);
	} else if(identifier=="학생"){
		$(boddy).after(twoButtonForSt);
		console.log($(boddy).find('.professor').length)
		$(boddy).find('input:checkbox').iCheck('destroy');
		$(boddy).find('.professor').remove();
		$(boddy).find('.student').hide();
	} else if(identifier=="관리자"){
		$(boddy).after(twoButtonForAd);
		$(boddy).find('.student').remove();
	}
}