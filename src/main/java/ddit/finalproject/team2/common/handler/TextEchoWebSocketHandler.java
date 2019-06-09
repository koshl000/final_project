package ddit.finalproject.team2.common.handler;

import java.io.Console;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import ddit.finalproject.team2.vo.UserVo;

public class TextEchoWebSocketHandler extends TextWebSocketHandler{
	@Resource(name="socketSessionMap")
	ConcurrentMap<String, CopyOnWriteArrayList<WebSocketSession>> socketSessionMap;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		UserVo user = (UserVo)((Authentication)session.getPrincipal()).getPrincipal();
		if(socketSessionMap.containsKey(user.getUser_id())){
			socketSessionMap.get(user.getUser_id()).add(session);
		}else{
			CopyOnWriteArrayList<WebSocketSession> sessionList = new CopyOnWriteArrayList<>();
			sessionList.add(session);
			socketSessionMap.put(user.getUser_id(), sessionList);
		}
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(message);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		UserVo user = (UserVo)((Authentication)session.getPrincipal()).getPrincipal();
		if(socketSessionMap.containsKey(user.getUser_id())){
			CopyOnWriteArrayList<WebSocketSession> sessionList = socketSessionMap.get(user.getUser_id());
			if(sessionList.size()>0){
				sessionList.remove(session);
			}else{
				socketSessionMap.remove(user.getUser_id());
			}
		}
	}
}
