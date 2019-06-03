<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
<title>Login V3</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/res/Login_v3/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/Login_v3/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/Login_v3/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/Login_v3/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/Login_v3/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/Login_v3/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/Login_v3/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/Login_v3/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/Login_v3/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/Login_v3/css/util.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/Login_v3/css/main.css">
<!--===============================================================================================-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
        
		$("#confirmHp").on("click", function() {
			$("#userIdResult").empty();
			$(".changeFindIdResult").hide();
			var inputs = $("#findIdForm").find(":input");
			var sendData = {};
			$(inputs).each(function(index, input) {
				var prop = $(input).attr("name");
				var value = $(input).val();
				sendData[prop] = value;
			});
			var jsonData = JSON.stringify(sendData);
			$.ajax({
				url : "${pageContext.request.contextPath}/confirmHp",
				method : "post",
				data : jsonData,
				contentType : "application/json; charset=UTF-8",
				dataType : "text", // request header(Accept), response header(Content-Type),
				success : function(resp) {
					console.log('ddddd');
					$("input[name=user_mail]").removeAttr('disabled');
					$("#userIdResult").empty();
					$("#userIdResult").append("<h2>" +resp+ "</h2>");
					$(".changeFindIdResult").show();
				},
				error : function(errorResp) {
					console.log(errorResp.status);
					console.log(errorResp);
					$("#userIdResult").empty();
					$("#userIdResult").append(
							"<h2>" +errorResp.responseText+ "</h2>");
					$(".changeFindIdResult").show();
				}
			});
		});
		
		$("#findIdBtn").on("click", function() {
			$("#userIdResult").empty();
			$(".changeFindIdResult").hide();
			var inputs = $("#findIdForm").find(":input");
			var sendData = {};
			$(inputs).each(function(index, input) {
				var prop = $(input).attr("name");
				var value = $(input).val();
				sendData[prop] = value;
			});
			var jsonData = JSON.stringify(sendData);
	
			$.ajax({
				url : "${pageContext.request.contextPath}/findId",
				method : "post",
				data : jsonData,
	
				contentType : "application/json; charset=UTF-8",
				dataType : "json", // request header(Accept), response header(Content-Type),
				success : function(resp) {
					var userId = resp.user_id;
					$("#userIdResult").empty();
					$("#userIdResult").append("<input type='checkbox' name='checkId' checked/><h2 class='checkUserId'>" +userId+ "</h2>");
					$("input[name=user_mail]").attr('disabled',true);
					$(".changeFindIdResult").show();
				},
				error : function(errorResp) {
					console.log(errorResp.status);
				}
			});
		});

		$("#confirmPassHp").on("click", function() {
			$("#userIdResult").empty();
			$(".changeFindIdResult").hide();
			var inputs = $("#findPassForm").find(":input");
			var sendData = {};
			$(inputs).each(function(index, input) {
				var prop = $(input).attr("name");
				var value = $(input).val();
				sendData[prop] = value;
			});
			var jsonData = JSON.stringify(sendData);
			$.ajax({
				url : "${pageContext.request.contextPath}/confirmPassHp",
				method : "post",
				data : jsonData,
				contentType : "application/json; charset=UTF-8",
				dataType : "text", // request header(Accept), response header(Content-Type),
				success : function(resp) {
					$("input[name=user_mail]").removeAttr('disabled');
					$("#userIdResult").empty();
				},
				error : function(errorResp) {
					$("#userIdResult").empty();
					$("#userIdResult").append(
							"<h2>" +errorResp.responseText+ "</h2>");
					$(".changeFindIdResult").show();
				}
			});
		});
		
		$("#findPassBtn").on("click", function() {
			$("#userIdResult").empty();
			$(".changeFindIdResult").hide();
			var useid = $("#findPassForm").find("input[name=user_id]").val();
			console.log(useid);
			var inputs = $("#findIdForm").find(":input");
			var sendData = {};
			$(inputs).each(function(index, input) {
				var prop = $(input).attr("name");
				var value = $(input).val();
				sendData[prop] = value;
			});
			var jsonData = JSON.stringify(sendData);
	
			$.ajax({
				url : "${pageContext.request.contextPath}/findId",
				method : "post",
				data : jsonData,
				contentType : "application/json; charset=UTF-8",
				dataType : "text", // request header(Accept), response header(Content-Type),
				success : function(resp) {
					console.log(useid+"000");
					$("#changePassForm").find("input[name=user_id]").val(useid);
					$('.findPassForm').hide();
					$('.changePassForm').show();
				},
				error : function(errorResp) {
					console.log(errorResp.status);
				}
			});
		});
		
		$("#changePassBtn").on("click", function() {
			$("#userIdResult").empty();
			$(".changeFindIdResult").hide();
			var inputs = $("#changePassForm").find(":input");
			var sendData = {};
			$(inputs).each(function(index, input) {
				var prop = $(input).attr("name");
				var value = $(input).val();
				sendData[prop] = value;
			});
			var jsonData = JSON.stringify(sendData);
	
			$.ajax({
				url : "${pageContext.request.contextPath}/changePass",
				method : "post",
				data : jsonData,
				contentType : "application/json; charset=UTF-8",
				dataType : "text", // request header(Accept), response header(Content-Type),
				success : function(resp) {
					console.log(resp);
					$('.text-center .txt1').removeClass('active');
					$(this).addClass('active');
					$('.findIdForm').hide();
					$('.findPassForm').hide();
					$('.changePassForm').hide();
					$('.loginForm').show();
					$('.changeFindIdResult').hide();
					$('.input100').val('');
					$('.input100').removeClass('has-val');
				},
				error : function(errorResp) {
					console.log(errorResp.status);
				}
			});
		});
		
		$("#alert-success").hide();
        $("#alert-danger").hide();
        $("#changePassForm").find("input[name=user_pass2]").on("blur",function(){
            var pwd1=$("#changePassForm").find("input[name=user_pass]").val();
            var pwd2=$("#changePassForm").find("input[name=user_pass2]").val();
            if(pwd1 != "" || pwd2 != ""){
                if(pwd1 == pwd2){
                    $("#alert-success").show();
                    $("#alert-danger").hide();
                    $("#changePassBtn").removeAttr("disabled", "disabled");
                    $("#submit").removeAttr("disabled");
                }else{
                    $("#alert-success").hide();
                    $("#alert-danger").show();
                    $("#changePassBtn").attr("disabled", "disabled");
                    $("#submit").attr("disabled", "disabled");
                }    
            }
        });

        $("#loginBtn").on("click", function() {
			var form = $(this).closest("form");
			$(form).submit();
		});

		$('.text-center .txt1').click(function() {
			if ($(this).hasClass('findId')) {
				$('.text-center .txt1').removeClass('active');
				$(this).addClass('active');
				$('.loginForm').hide();
				$('.findPassForm').hide();
				$('.findIdForm').show();
				$('.changePassForm').hide();
				$('.changeFindIdResult').hide();
				$('.input100').val('');
				$('.input100').removeClass('has-val');
			}
			if ($(this).hasClass('findPass')) {
					$("#alert-success").hide();
                    $("#alert-danger").hide();
				if(($("#findIdForm").find("input[name=user_mail]").val()) !='') {
// 				if($("#findIdForm").find("input[name=checkId]").prop('checked', true)) {
					$('.text-center .txt1').removeClass('active');
					$(this).addClass('active');
					$('.loginForm').hide();
					$('.findIdForm').hide();
					$('.findPassForm').hide();
					$('.changePassForm').show();
					$('.input100').val('');
					$('.input100').removeClass('has-val');
					var dd = $("#userIdResult").text();
					var rets = dd.substring(8);
					console.log(rets);
					$("#changePassForm").find("input[name=user_id]").val(rets);
					$("input[name=checkId]").removeAttr('checked');
				} else {
					$('.text-center .txt1').removeClass('active');
					$(this).addClass('active');
					$('.loginForm').hide();
					$('.findIdForm').hide();
					$('.changePassForm').hide();
					$('.findPassForm').show();
					$('.changeFindIdResult').hide();
					$('.input100').val('');
					$('.input100').removeClass('has-val');
				}
			}
			if ($(this).hasClass('login')) {
				$('.text-center .txt1').removeClass('active');
				$(this).addClass('active');
				$('.findIdForm').hide();
				$('.findPassForm').hide();
				$('.changePassForm').hide();
				$('.loginForm').show();
				$('.changeFindIdResult').hide();
				$('.input100').val('');
				$('.input100').removeClass('has-val');
			}
		});
		
		$('.container .bg').mousemove(
		function(e) {
			var amountMovedX = (e.pageX * -1 / 30);
			var amountMovedY = (e.pageY * -1 / 9);
			$(this).css('background-position',
					amountMovedX + 'px ' + amountMovedY + 'px');
		});
		
	});
</script>
<style>
body .findIdForm {
	display: none;
}

body .findPassForm {
	display: none;
}
body .changePassForm {
	display: none;
}
#confirmHp{
	font-size:0.95em;
}
</style>
</head>
<body>

	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('${pageContext.request.contextPath}/res/Login_v3/images/bg-02.jpg');">
			<div class="wrap-login100 loginForm">
				<form class="login100-form validate-form" method="post"
					action="${pageContext.request.contextPath }/loginCheck">
					<span class="login100-form-logo"> <i
						class="zmdi zmdi-landscape"></i>
					</span> <span class="login100-form-title p-b-34 p-t-27"> 로그인</span>
				
					<div class="wrap-input100 validate-input" data-validate="Enter username">
						<input class="input100" type="text" name="user_id" placeholder="아이디"> 
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="user_pass" placeholder="비밀번호"> 
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>

					<div class="contact100-form-checkbox">
						<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me"> 
						<label class="label-checkbox100" for="ckb1"> 아이디 기억하기 </label>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" id="loginBtn">로그인</button>
					</div>

					<div class="text-center p-t-90">
						<a class="txt1 findId active" href="#"> 아이디찾기 </a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="txt1 findPass" href="#"> 비밀번호찾기 </a>
					</div>
				</form>
			</div>

			<!-- 아이디찾기 폼 -->
			<div class="wrap-login100 findIdForm">
				<form id="findIdForm" class="login100-form validate-form"
					method="post" action="${pageContext.request.contextPath }/findId">
					<span class="login100-form-logo"> <i
						class="zmdi zmdi-landscape"></i>
					</span> <span class="login100-form-title p-b-34 p-t-27"> 아이디찾기 </span>

					<!-- 찾을 시 변경 될 div영역 -->
					<div class="changeFindIdForm">
						<div class="row">
							<div class="wrap-input100 validate-input col-12" data-validate="Enter username">
								<input class="input100" type="text" name="user_name" placeholder="이름"> 
								<span class="focus-input100" data-placeholder="&#xf207;"></span>
							</div>
						</div>
						<div class="row">
							<div class=" col-7 wrap-input100 validate-input" data-validate="Enter password">
								<input class="input100" type="text" name="user_hp" placeholder="전화번호"> 
								<span class="focus-input100" data-placeholder="&#xf191;"></span>
							</div>
							<div class="col-5">
								<button class="login100-form-btn btn-sm" type="button" id="confirmHp">인증번호 받기</button>
							</div>
							<div class="wrap-input100 validate-input" data-validate="Enter password">
								<input class="input100" type="text" name="user_mail" placeholder="인증번호 6자리 입력" disabled>
								<span class="focus-input100" data-placeholder="&#xf191;"></span>
							</div>
						</div>
						<div class="container-login100-form-btn">
							<button class="login100-form-btn" type="button" id="findIdBtn">확인</button>
							<label class="label-checkbox100" for="ckb20" style="display: none;"></label>
						</div>
						<div class="changeFindIdResult" style="display: none;">
							<span id="userIdResult"></span>
						</div>
						<div class="text-center p-t-90">
							<a class="txt1 login" href="#"> 로그인 </a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="txt1 findPass" href="#"> 비밀번호찾기</a>
						</div>
						</div>
					</form>
				</div>
				
			<!-- 비밀번호찾기 폼 -->
			<div class="wrap-login100 findPassForm">
				<form class="login100-form validate-form" method="post" id="findPassForm" action="${pageContext.request.contextPath }/findPass">
					<span class="login100-form-logo"> <i class="zmdi zmdi-landscape"></i> </span>
					<span class="login100-form-title p-b-34 p-t-27"> 비밀번호 찾기 </span>

					<div class="row">
						<div class="wrap-input100 validate-input col-12" data-validate="Enter username">
							<input class="input100" type="text" name="user_id" placeholder="아이디" id="changeid">
							<span class="focus-input100" data-placeholder="&#xf207;"></span>
						</div>
					</div>
					<div class="row">
						<div class="wrap-input100 validate-input col-7" data-validate="Enter password">
							<input class="input100" type="text" name="user_hp" placeholder="핸드폰번호">
							<span class="focus-input100" data-placeholder="&#xf191;"></span>
						</div>
						<div class="col-5">
							<button class="login100-form-btn btn-sm" type="button" id="confirmPassHp">인증번호 받기</button>
						</div>
						<div class="wrap-input100 validate-input" data-validate="Enter password">
							<input class="input100" type="text" name="user_mail" placeholder="인증번호 6자리 입력" disabled>
							<span class="focus-input100" data-placeholder="&#xf191;"></span>
						</div>
						<div class="changeFindIdResult" style="display: none;">
							<span id="userIdResult"></span>
						</div>
						<div class="container-login100-form-btn">
							<button class="login100-form-btn" type="button" id="findPassBtn">확인</button>
							<label class="label-checkbox100" for="ckb20" style="display: none;"></label>
						</div>
					</div>

					<div class="text-center p-t-90">
						<a class="txt1 login" href="#"> 로그인 </a>&nbsp;&nbsp;&nbsp;&nbsp; <a
							class="txt1 findId" href="#"> 아이디찾기 </a>&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
				</form>
			</div>
			
			<!-- 비밀번호변경 폼 -->
			<div class="wrap-login100 changePassForm">
				<form class="login100-form validate-form" id="changePassForm" method="post" action="${pageContext.request.contextPath }/changePass">
					<span class="login100-form-logo"> <i
						class="zmdi zmdi-landscape"></i>
					</span> <span class="login100-form-title p-b-34 p-t-27"> 비밀번호 변경 </span>

					<div class="wrap-input100 validate-input" data-validate="Enter username">
						<input class="input100" type="text" name="user_id" placeholder="아이디" disabled>
						<span class="focus-input100"data-placeholder="&#xf207;"></span>
					</div>

					<div class="changeFindPass">
						<div class="wrap-input100 validate-input" data-validate="Enter password">
							<input class="input100" type="password" name="user_pass" placeholder="새 비밀번호">
							<span class="focus-input100" data-placeholder="&#xf191;"></span>
						</div>
						<div class="wrap-input100 validate-input" data-validate="Enter password">
							<input class="input100" type="password" name="user_pass2" placeholder="새 비밀번호 확인">
							<span class="focus-input100" data-placeholder="&#xf191;"></span>
						</div>
						
						<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
						<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
						
						<div class="container-login100-form-btn">
							<button class="login100-form-btn" type="button" id="changePassBtn">확인</button>
							<label class="label-checkbox100" for="ckb20" style="display: none;"></label>
						</div>
					</div>

					<div class="text-center p-t-90">
						<a class="txt1 login" href="#"> 로그인 </a>&nbsp;&nbsp;&nbsp;&nbsp; <a
							class="txt1 findId" href="#"> 아이디찾기 </a>&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
				</form>
			</div>
		</div>
	</div>


	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/res/Login_v3/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/res/Login_v3/vendor/bootstrap/js/popper.js"></script>
	<script
		src="${pageContext.request.contextPath}/res/Login_v3/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/res/Login_v3/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/res/Login_v3/vendor/daterangepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/res/Login_v3/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/res/Login_v3/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/res/Login_v3/js/main.js"></script>

</body>
</html>