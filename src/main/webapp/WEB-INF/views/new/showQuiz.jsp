<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- <%pageContext.setAttribute("newLineChar", "\n"); %> --%>
<%-- <<c:set var=path value="${pageContext.request.contextPath}"></c:set> --%>
<%-- 
<c:set var="str" value="${fn:replace(row.replytext, ' ', '&nbsp;')}" --%>
<%-- ${fn:replace(row.replytext, 'newLineChar', '<br>'} --%>
<%--(<fmt:formatDate value="${row.regdate}"
	pattern="yyyy-MM-dd a HH:mm:ss" />) --%>
<!-- 권장 방법은 컨트롤러 단에서 다 처리해오는 것 + '\n'이 동작하지 않아서 페이지컨텍스트에 변수로 설정해줌 -->

<script>
	var AList = [];
	var pList = [];
	var saveBtn;
	var modifyBtn; var textAria; var labell; var checkboxx; var inputtextt;
	$(function(){
		var identifier = $("#identifier").val();
		makeQuestionPage(identifier, $("#boddy"));
		$("input[type='text']").attr('type', 'hidden');
		
		$(".container").on("click", ".modify", function(event){
			event.preventDefault();
			var formm = $(this).siblings('form');
			textAria = $(formm).find('textarea');
			textAria.attr("disabled", false);
			checkboxx = $(formm).find('input:checkbox');
			checkboxx.attr('disabled', false);
			labell = $(formm).find("label");
			labell.css("display","none");
			inputtextt = $(formm).find('.PContent');
			inputtextt.attr("type", "text");
// 			$(this).siblings('.save').css("display","block");
			saveBtn = $(this).siblings('.save');
			modifyBtn = $(this);
			saveBtn.show()
			modifyBtn.hide();
		})
		
		$(".container").on("click", ".save", function(){
			var btnType = $("#btnType").val();
			var class_identifying_code = $("#class_identifying_code").val();
			var lecture_code = $("#lecture_code").val();
			console.log(class_identifying_code);
			console.log(lecture_code);
			var formm = $(this).siblings('form');
			var checkedBoxes = $(formm).find("input:checkbox:checked");
			var sendData = {
							question_no: $(formm).find('#questionNO').val(),
							question_content:$(formm).find("#questionCon").val(),
							class_identifying_code:class_identifying_code,
							lecture_code:lecture_code,
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
			pList = $(formm).find('.PContent');
			AList = $(formm).find('.QAnswer');
			for (var i = 0; i < pList.length; i++) {
				sendData.problemList.push(
										   {
											 quizProblem_no:AList[i].value,
											 quizProblem_content:pList[i].value,
											 question_no:$(formm).find('#questionNO').val()
											}
										 )
			}
			$.ajax({
	            type : 'post',
	            url : "${pageContext.request.contextPath}/professor/showQuizz",
	            data : JSON.stringify(sendData),
	            contentType:'application/json;charset=utf-8',
	            dataType : "json",
	            success : function(resp){
	            	if(resp!=null){
		            	saveBtn.hide();
		            	modifyBtn.show();
		    			alert("수정이 완료 되었습니다.");
		    			textAria.attr('disabled', true);
		    			textAria.text(resp.question_content);
		    			labell.css('display', 'inline-block');
		    			console.log(labell);
		    			console.log(resp.problemList);
		    			console.log(checkboxx)
		    			checkboxx.attr('disabled', true);
		    			inputtextt.attr('type', 'hidden');
	            	}
				},
			});
		});
	})
</script>
<div class="container">
	<div id="boddy" class="row">
	
		<c:forEach items="${oneQuiz}" var="quiz" begin="0" varStatus="status">
			<div class="coverEach">
			<form id='form${status.index}'>
			<div class='col-lg-6 col-md-6 col-sm-6 col-xs-12'><div class='nk-int-st'>
			<span><c:out value='${status.count}'/>번<input type='hidden' id='questionNO' name='${btnType}List[questionNum].question_no' value='${quiz.question_no }'></span>
			<textarea name='${btnType}List[${status.index}].question_content' id='questionCon' class='QContent form-control auto-size' disabled rows='10' placeholder='문제를 입력하세요'>${ quiz.question_content }</textarea></div></div><br><br><br><br><br>
				<c:forEach items='${quiz.problemList}' var="problem" varStatus="status2">
					<div style="display:inline-block; margin:2px" class='fm-checkbox professor'><input name='${btnType}List[${status.index}].question_answer' ${quiz.question_answer.contains(problem.quizProblem_no)?'checked':''} id='questionAns'type='checkbox' class='i-checks QAnswer' value='${status2.count}'><label class="problemItem">${ problem.quizProblem_content }</label></div>
					<div style="display:inline-block; margin:2px" class='fm-checkbox student'><input name='${btnType}List[${status.index}].question_answer' id='questionAns'type='checkbox' class='i-checks QAnswer' value='${status2.count}'><label class="problemItem">${ problem.quizProblem_content }</label></div>
					<input name='${btnType}List[${status.index}].problemList[${status2.index}].quizProblem_content' class='PContent' type='text' placeholder='선택지를 입력하세요' value='${ problem.quizProblem_content}'/><br>
				</c:forEach>
					</form>
					</div>
		</c:forEach>
		<input id="identifier" type="hidden" value="교수"/>
		<input id="btnType" type='hidden' value="${btnType}"/>
		<input id="class_identifying_code" type='hidden' value="${quizList[0].class_identifying_code}"/>
		<input id="lecture_code" type='hidden' value="${quizList[0].lecture_code}"/>
	</div>
</div>

<!-- autosize JS
		============================================ -->
    <script src="${pageContext.request.contextPath}/notika/js/autosize.min.js"></script>
     <!-- icheck JS
		============================================ -->
    <script src="${pageContext.request.contextPath}/notika/js/icheck/icheck.min.js"></script>
    <script src="${pageContext.request.contextPath}/notika/js/icheck/icheck-active.js"></script>
    <script src="${pageContext.request.contextPath}/res/js/makeQuestionPage.js"></script>