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

.timeCnt, .btnSpace {
	text-align: center;
	margin: 20px;
}

.question .btn {
	margin: 20px;
	width: 200px;
}
</style>
<script>
	var quizList = '${oneQuiz}';
	var length = '${oneQuiz.size()}';
	
	function completePage(){
		$("#boddy").after("<div class='row'>"+"<div class='col-xs-6 col-sm-6 btnSpace'>" +
						"<button class='btn' type='button' id='prev'>이전</button>"+
						"<button class='btn' type='button' id='next'>다음</button><button class='btn' type='button' id='submt'>제출</button>");	
		if($("#qStart").val()==1){
			$("#prev").attr('disabled', true);
			$("#submt").hide();
		}
		
		for (var i = 0; i < array.length; i++) {
			$('.questionBody')
		}
	}
	$(function(){
		completePage();
	})
	// 	function(){
	// 		for (var idx = 0; idx < length; idx++) {
	// 			var formm = $('.questionBody'+(idx+1))
	// 			source = "";
	// 			source += "<p>"+quizList[idx].question_content+"</p>";
	// 			for (var idx2 = 0; idx2 < 4; idx++) {
	// 				source += "<a>"+quizList[idx].problemList[idx2].quizProblem_content+"</a>";
	// 			}
	// 			formm.append(source);
	// 		}	
	// 	}
</script>
<body>
	${oneQuiz }
	<div class='container'>
		<input id="qStart" type="hidden" value="1"/>
		<div class='row timeCnt'>
			<div class="col-xs-12 col-sm-12">
				<span style="font-size: 10pt; font-weight: 500"> <span
					style="padding-left: 8px; font-weight: 500">Timer</span> <span
					id="min" style="width: 15px; font-weight: 500; text-align: right"></span>분
					<span id="sec"
					style="width: 15px; font-weight: 500; text-align: right"></span>초
				</span>
			</div>
		</div>

		<script type="text/javascript" language="javascript">
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
		<c:set var="idx" value="1" />
		<div class='row' id='boddy'>
			<div class="col-xs-4 col-sm-4 left">
			
			</div>
			<div class="col-xs-4 col-sm-4 center">
			
			</div>
			<div class="col-xs-4 col-sm-4 right">
			
			</div>
			
				<c:forEach var="quiz" items="${oneQuiz}" varStatus="vs">
					<c:choose>
						<c:when test="${vs.count%5 eq 1 or vs.count%5 eq 2 or vs.count%5 eq 3}">
							<script>
							$('.left').append("<div class=\"left questionBody${idx}\">"
							
							</div>");
							
							
									
								
							</script>
							
							
						</c:when>
						
				</c:choose>
			</c:forEach>
		</div>
	</div>
</div>

</body>
</html>