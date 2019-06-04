<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
var sockJS;
function echoTest(){
	if(window.WebSocket){
		console.log("websocket 지원!");
		
		sockJS = new WebSocket("wss://localhost/alert");
		sockJS.onopen = function(event){
			console.log(event.target.url + "과 연결 수립");
		};
		sockJS.onclose = function(closeEvt){
			console.log("연결 종료, 종료코드 : " + closeEvt.code
				+ ", 종료사유 : " + closeEvt.reason);
		};
		
		sockJS.onerror = function(errorEvt){
			console.log("에러 발생, 에러코드는 종료 후 종료코드 확인.");
		};
		
		sockJS.onmessage = function(messageEvt){
			
		};
		
	}else{
			console.log("websocket 미지원...");
	}
}
</script>