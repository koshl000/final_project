<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page language="java" %>
<input id ="userName" type="hidden" value="${user.user_name}"></input>
<input id="contextPath" type="hidden" value="${pageContext.request.contextPath}"></input>
<div class="header-top-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                <div class="logo-area">
                    <a href="${pageContext.request.contextPath }/chooseMain"><img src="${pageContext.request.contextPath}/notika/img/logo/logo.png" alt="" /></a>
                </div>
            </div>
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <div class="header-top-menu">
                    <ul class="nav navbar-nav notika-top-nav">
<!--                         알림 -->
                             <li class="nav-item nc-al">
                        	<a id="ring" href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle">
	                        	<span><i class="notika-icon notika-alarm"></i></span>
                        	</a>
                            <div role="menu" class="dropdown-menu message-dd notification-dd animated zoomIn">
                                <div class="hd-mg-tt">
                                    <h2>알림</h2>
                                </div>
                                <div id="ringList" class="hd-message-info">
                                   
                                </div>
                            </div>
                        </li>
                        
                        <li class="nav-item"><a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><span  id="bell"><i class="notika-icon notika-chat"></i></span></a>
                            <div role="menu" class="dropdown-menu message-dd chat-dd animated zoomIn">
                             <div class="notika-chat-list notika-shadow mg-t-30 tb-res-ds-n dk-res-ds">
                        <div class="realtime-ctn">
                            <div class="realtime-title">
                                <h2>Chat Box</h2>
                            </div>
                        </div>
                        <div class="card-box">
                            <div class="chat-conversation">
                                <div class="widgets-chat-scrollbar">
                                    <ul class="conversation-list">
                                    </ul>
                                </div>
                                <div class="chat-widget-input">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-12 col-sm-12 col-xs-12 chat-inputbar">
                                            <div class="form-group todo-flex">
                                                <div class="nk-int-st">
                                                    <input type="text" class="form-control chat-input" placeholder="Enter your text">
                                                </div>
                                                <div class="chat-send">
                                                    <button type="submit" class="btn btn-md btn-primary btn-block notika-chat-btn">Send</button>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            
	             </li>
                        <li class="nav-item">
                        	<a href="${pageContext.request.contextPath }/logout" aria-expanded="false" class="nav-link">LOGOUT</a>
                        </li>
	            
	            </div>
	        </div>
	                </div>
                       
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
	$(function() {
		 var chatTime = moment().format("MM/DD hh:mm");
		 $('<li class="clearfix odd"><div class="chat-avatar"><i>' + chatTime + '</i></div><div class="conversation-text"><div class="ctext-wrap"><i>대덕인재대학교</i><p>' + "안녕하세요.대덕인재대학교 ChatBot시스템 입니다." + '</p></div></div></li>').appendTo('ul.conversation-list');
	});
</script>
<script type="text/javascript">
	echoTest();
	setRingList();
	
// 	ring
	function setRingList(){
		$.ajax({
			url : '${pageContext.request.contextPath}/ring/${user.user_id}',
			dataType : 'json',
			success : function(resp){
				var num = 0;
				$('#ringList').children().remove();
				$.each(resp, function(i, v){
					if(v.ring_confirm_yn=='N'){
						num++;
						$('#ringList').append(
							$('<div>').prop('class', 'hd-message-sn').append(
								$('<a>').prop({
									'href' : v.ring_move_address,
									'id' : v.ring_code,
								}).append(
									$('<div>').prop('class', 'hd-message-sn').append(
										$('<div>').prop({
											'class' : 'hd-mg-ctn',
											'style' : 'width:340px;'
										}).append(
											$('<h3>').text(v.ring_type)
											, $('<p>').text(v.ring_title)
										)
									)
								)
							)
						);
					}
					
				});
				if(num!=0){
					$('#bell').after(
						$('<div>').prop('class', 'spinner4 spinner-4')
						, $('<div>').prop({
							'id' : 'countingDiv',
							'class' : 'ntd-ctn'
						}).append('<span>').prop('id', 'webSocketAlertNo').text(num)
					);
				}
			}
		});
	}
	
	$('#ring').on('click', function(){
		setRingList();
	});
	
	$('#ringList').on('click', 'a', function(event){
		event.preventDefault();
		var code = $(this).prop('id');
		console.log(code);
		var url = $(this).attr('href');
		console.log(url);
		$.ajax({
			url : '${pageContext.request.contextPath}/ring/read/'+code,
			method : 'put',
			dataType : 'text',
			success : function(resp){
				console.log(resp);
				location.href = '${pageContext.request.contextPath}'+url;
			}
		})
	});
	
	
	
// 	websocket
	function writeMessage(message){
		var span = $('#webSocketAlertNo');
		var num = $('#webSocketAlertNo').text();
		console.log(num);
		if(num==''){
			$('#bell').after(
				$('<div>').prop('class', 'spinner4 spinner-4')
				, $('<div>').prop({
					'id' : 'countingDiv',
					'class' : 'ntd-ctn'
				}).append('<span>').prop('id', 'webSocketAlertNo').text('1')
			);
		}else{
			$(span).text(parseInt(num)+1);
		}
		
		$.notify(
			message,
			{
				className : 'info',
				position : 'bottom right'
			}
		);
	}
	
	var sockJS;
	function echoTest(){
		if(window.WebSocket){
			console.log("websocket 지원!");
			
			sockJS = new WebSocket("wss://localhost/alert");
			sockJS.onopen = function(event){
				console.log(location.protocol+" 연결");
			};
			sockJS.onclose = function(closeEvt){
				console.log("연결 종료, 종료코드 : " + closeEvt.code
					+ ", 종료사유 : " + closeEvt.reason);
			};
			
			sockJS.onerror = function(errorEvt){
				console.log("에러 발생, 에러코드는 종료 후 종료코드 확인.");
			};
			
			sockJS.onmessage = function(messageEvt){
				var message = messageEvt.data;
				console.log("수신 메세지 타입 : " + typeof message);
				writeMessage(message);
			};
			
		}else{
				console.log("websocket 미지원...");
		}
	}
	
	
</script>
