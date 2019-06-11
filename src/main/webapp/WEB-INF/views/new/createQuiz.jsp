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

.

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
var selectSS;
var selectSD;
var btnType;
var surveyList; var classList; var examList;
var identifying_code = "";
$(function(){
		var error = "";
		var lecture_code = $("#lecture_code").val();
		
		var len; var len2; var len3;
		$(".container").on("click", '#complete',function(event){
			event.preventDefault();
// 			if(btnType=="quiz"||btnType=="test"){
// 					var QCinputs = $('.QContent');
// 					var validated = Array.prototype.filter.call(QCinputs, function(e) {
// 					return len = e.value.trim().length > 0;
// 					});
// 				if(len!=5){
// 					var QAinputs = $("input:checkbox:checked");
// 					var validated = Array.prototype.filter.call(QAinputs, function(e) {
// 					len2 = e.value.trim().length;
// 					if(len2==0){
// 						error +="답을 선택해주세요"
// 					}
// 					});
// 				} else {
// 					error = "모든 문제를 입력해주세요.";
// 				}
// 				if(len2>0){
// 					var PCinputs = $('.PContent')
// 					var validated = Array.prototype.filter.call(PCinputs, function(e) {
// 					len3 = e.value.trim().length > 0;
// 					if(len3<20){
// 						error += "모든 선택지를 입력해주세요."
// 					}
// 					});
// 				}
// 			}
// 			if(error.length<0){
// 				alert(error)
// 			} else {
				var class_identifying_code = $("#class_identifying_code").val();
				$(".class_identifying_code").val(class_identifying_code)
				$(".lecture_code").val(lecture_code);
				var lecture_class = '${lectureInfos.lectureWeekInfos[0].lectureWeekClass[0].lecture_class}'
				$("#yaoZhuannSong").submit();
		});
		
			var btnType = $('#btnType').val();
			var twoBtn = "<div class='row'>"+"<div class='col-xs-6 col-sm-6 btnSpace'>" +
							"<button class='btn' type='button' id='complete'>등록</button>";
			if(btnType=='quiz'){
				var result = makeQuestion(".container", btnType, 5, 4)
				$("#quiz").prop("disabled", true);
				$("#boddy").after(twoBtn);
				$('#boddy').find('a').hide();
			} 
// 			else if(btnType=='test'){
// 				var result = makeQuestion("#boddy", "test", 2, 4)
// 				alert(result);
// 				$("#quiz").remove();
// 				$("#survey").remove();
// 				btnType = "test";
// 				$("#test").prop("disabled", true);
// 				$("#boddy").append(result)
// 				  		  .after(twoBtn);
// 				$("#test").after(newSelect);
// 			}
			
			$('#boddy .i-checks').iCheck({
				checkboxClass: 'icheckbox_square-green',
			});
			
			autosize($('textarea'));
			
				$.ajax({
				    "url" : "${pageContext.request.contextPath}/professor/selectType/"+btnType,
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
		$(".container").on("click", ".deleteBody", function(event){
			event.preventDefault();
			var questionBody = $(this).closest('div');
			questionBody.remove();
		})
})

</script>
<body>
	<div class="container">
		<div class='row timeCnt'>
			<div class="col-xs-12 col-sm-12 timeCnt">
				<span><h3>${lectureInfos.lectureWeekInfos[0].lectureWeekClass[0].lecture_subname} / ${lectureInfos.lectureWeekInfos[0].lecture_week}주차 ${lectureInfos.lectureWeekInfos[0].lectureWeekClass[0].lecture_class}교시 : 퀴즈</h3>
				${lectureInfos.lectureWeekInfos[0].lecture_code}
				</span>
			</div>
		</div>
		<form id="yaoZhuannSong" method="post" action="${pageContext.request.contextPath}/professor/addQuiz">
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
		</form>
	</div>
</div>
<input id="identifier" type="hidden" value="${identifier[0]}"/>
<input id="user_id" type="hidden" value="${userVo.user_id}"/>
<input id="btnType" type='hidden' value="${btnType}"/>
<input id="class_identifying_code" type='hidden' value="${lectureInfos.lectureWeekInfos[0].lectureWeekClass[0].class_identifying_code}"/>
<input id="lecture_code" type='hidden' value="${lectureInfos.lectureWeekInfos[0].lecture_code}"/>

<!-- autosize JS
		============================================ -->
    <script src="${pageContext.request.contextPath}/notika/js/autosize.min.js"></script>
     <!-- icheck JS
		============================================ -->
    <script src="${pageContext.request.contextPath}/notika/js/autosize.min.js"></script>
    <script src="${pageContext.request.contextPath}/notika/js/icheck/icheck.min.js"></script>
    <script src="${pageContext.request.contextPath}/notika/js/icheck/icheck-active.js"></script>
	<script src="${pageContext.request.contextPath}/res/js/makeQuestion.js"></script>
    
</body>
</html>