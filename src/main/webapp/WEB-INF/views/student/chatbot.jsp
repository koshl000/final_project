<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 2.      AA      최초작성
* Copyright (c) 2019 by DDIT All right reserved
*
* 챗봇 ui 화면
* modalless
 --%>
 
<script type="text/javascript">
	$(function() {
		 var chatTime = moment().format("MM/DD hh:mm");
		 $('<li class="clearfix odd"><div class="chat-avatar"><i>' + chatTime + '</i></div><div class="conversation-text"><div class="ctext-wrap"><i>대덕인재대학교</i><p>' + "안녕하세요.대덕인재대학교 ChatBot시스템 입니다." + '</p></div></div></li>').appendTo('ul.conversation-list');
	});
</script>
<input id ="userName" type="hidden" value="${user.user_name}"></input>
<input id="contextPath" type="hidden" value="${pageContext.request.contextPath}"></input>
<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
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
            </div>
        </div>
    </div>
    
    