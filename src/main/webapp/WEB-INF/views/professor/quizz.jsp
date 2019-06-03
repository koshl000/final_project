<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	
	var selectSS;
	var selectSD;
	var btnCompare;
	var surveyList; var classList; var examList;
	var identifying_code = "";
	$(function(){
			$(".container").on("change", "#selectYet", function(){
				if($(this).val()=="만족도"){
					$(".radios").nextAll('span').remove();
	    			var result = makeSelect($("#core"), selectSS);
	    		} else if($(this).val()=="난이도"){
	    			$(".radios").nextAll('span').remove();
	    			var result = makeSelect($("#core"), selectSD);
	    		}
				
				if($(this).val()=="1교시"||$(this).val()=="2교시"||$(this).val()=="3교시"){
					if($(this).val()=="1교시"){
						$("#lecture_class").val(1)
					} else if($(this).val()=="2교시"){
						$("#lecture_class").val(2)
					} else if($(this).val()=="3교시"){
						$("#lecture_class").val(3)
				}
					identifying_code = $("#lecture_week").val();
					identifying_code += $("#lecture_class").val();
					alert(identifying_code);
					$(".class_identifying_code").each(function(){
						$(this).val(identifying_code);
					});
				}
			})
			
			var error = "";
			var len; var len2; var len3;
			$(".container").on("click", '#complete',function(event){
				event.preventDefault();
				
				if(btnCompare=="survey"){
					var result = $(this).find("#survey")
					console.log(result)
					var inputs = $('.QContent'); // NodeList : filter라는 함수가 없다
					var validated = Array.prototype.filter.call(inputs, function(e) {
						return e.value.trim().length > 0;
					});
					if (inputs.length !== validated.length) {
					  	alert('모두 입력해주세요!');
					}
				}
				if(btnCompare=="quiz"||btnCompare=="test"){
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
					$("#core").submit();
				}
			});
			
			
			$("button").on("click", function(event){
				event.preventDefault();
				var btnType = $(this).attr('id');
				var newSelect= $("<select id='selectYet'><option></option></select>");
				var twoBtn = "<button id='preview'>미리보기</button><button type='submit' id='complete'>등록완료</button>";
				if($(this).attr('id')=='survey'){
					var result = makeQuestion("#core", "survey", 2, 5)
					alert(result);
					$("#quiz").remove();
					$("#test").remove();
					btnCompare = "survey";
					$("#survey").prop("disabled", true);
					$("#core").append(result)
							  .after(twoBtn);
					$("#survey").after(newSelect);
				} else if($(this).attr('id')=='quiz'){
					var result = makeQuestion("#core", "quiz", 5, 4)
					alert(result);
					$("#survey").remove();
					$("#test").remove();
					btnCompare = "quiz";
					$("#quiz").prop("disabled", true);
					$("#core").append(result)
					  		  .after(twoBtn);
					$("#quiz").after(newSelect);
					$(".lecture_code").val('lecture_code_1');
					$(".lecture_week").val('1');
				} else if($(this).attr('id')=='test'){
					var result = makeQuestion("#core", "test", 2, 4)
					alert(result);
					$("#quiz").remove();
					$("#survey").remove();
					btnCompare = "test";
					$("#test").prop("disabled", true);
					$("#core").append(result)
					  		  .after(twoBtn);
					$("#test").after(newSelect);
				}
				
				$('#core .i-checks').iCheck({
					checkboxClass: 'icheckbox_square-green',
					radioClass: 'iradio_square-green',
				});
				
				autosize($('textarea'));
				
					$.ajax({
					    "url" : "${pageContext.request.contextPath}/professor/selectType/"+btnType,
// 					    http://localhost:8003/projecttemplate/professor/selectType/survey
					    "dataType" : "json",
					    "success" : function(resp){
					    	if(resp.surveyList){
						    	if(resp.surveyList.length > 0){
						    		$("#selectYet").find('option').remove();
						    		for (var idx = 0; idx < resp.surveyList.length; idx++) {
										$("#selectYet").append("<option value='"+resp.surveyList[idx]+"'>"+resp.surveyList[idx]+"</option>");
									}
						    		selectSD = resp.surveySD;
						    		selectSS = resp.surveySC;
						    	}
					    	} else if(resp.classList.length > 0){
						    	if(resp.classList.length > 0){
						    		$("#selectYet").find('option').remove();
						    		for (var idx = 0; idx < resp.classList.length; idx++) {
										$("#selectYet").append("<option value='"+resp.classList[idx]+"'>"+resp.classList[idx]+"</option>");
									}
					    		}
					    	} else if(resp.examList.length > 0){
						    	if(resp.examList.length > 0){
						    		$("#selectYet").find('option').remove();
						    		for (var idx = 0; idx < resp.examList.length; idx++) {
										$("#selectYet").append("<option value='"+resp.examList[idx]+"'>"+resp.examList[idx]+"</option>");
									}
					    		}
					    	}else {
					    		$("#selectYet").find('option').remove();
					    		$("#selectYet").append("<option value=''>선택</option>")
					    	}
					    }
					});
			})
			
			$(".container").on("click", ".deleteBody", function(event){
				event.preventDefault();
				var questionBody = $(this).closest('div');
				alert(dddd);
				questionBody.remove();
			})
	})
	
// <span>퀴즈</span><button id="extraQuestion">문항추가</button><button>x</button><br/>
	
</script>

<div class="container"> 
	<div class="row">
		<button id="survey">설문지입력</button><button id="quiz">퀴즈입력</button><button id="test">시험입력</button>
		<form id="core" name="plz" action="${pageContext.request.contextPath}/professor/addQuiz" method="post">
			
		</form>
	</div>
</div>
    <script src="${pageContext.request.contextPath}/notika/js/autosize.min.js"></script>
    <script src="${pageContext.request.contextPath}/notika/js/icheck/icheck.min.js"></script>
    <script src="${pageContext.request.contextPath}/notika/js/icheck/icheck-active.js"></script>
	<script src="${pageContext.request.contextPath}/res/js/makeQuestion.js"></script>