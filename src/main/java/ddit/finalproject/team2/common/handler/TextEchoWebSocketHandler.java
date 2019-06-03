package ddit.finalproject.team2.common.handler;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.util.MultiValueMap;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import ddit.finalproject.team2.vo.UserVo;

public class TextEchoWebSocketHandler extends TextWebSocketHandler{
	@Resource(name="socketSessionMap")
	MultiValueMap<String, WebSocketSession> socketSessionMap;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		user 정보 꺼내는 방법
//		session.getAttributes();
//		SecurityContextHolder.getContext().getAuthentication();
//		(UsernamePasswordAuthenticationToken) session.getPrincipal();
		
		UserVo user = (UserVo)((Authentication)session.getPrincipal()).getPrincipal();
		socketSessionMap.add(user.getUser_id(), session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//클라이언트에서 보낸 메세지를 받는 부분
		//session.sendMessage(message);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		UserVo user = (UserVo)((Authentication)session.getPrincipal()).getPrincipal();
		socketSessionMap.remove(user.getUser_id(), session);
	}
}
