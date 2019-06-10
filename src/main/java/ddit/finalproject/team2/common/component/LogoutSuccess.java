package ddit.finalproject.team2.common.component;

import ddit.finalproject.team2.vo.UserVo;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.CopyOnWriteArrayList;

public class LogoutSuccess extends SimpleUrlLogoutSuccessHandler {
    @Resource(name="socketSessionMap")
    ConcurrentMap<String, CopyOnWriteArrayList<WebSocketSession>> socketSessionMap;

    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        if(authentication!=null){
        	UserVo user=(UserVo)authentication.getPrincipal();
        	List<WebSocketSession> list=socketSessionMap.get(user.getUser_id());
        	if(list.size()>0){
        		list.get(0).sendMessage(new TextMessage(user.getUser_id()));
        	}
        }

        super.onLogoutSuccess(request, response, authentication);
    }
}
