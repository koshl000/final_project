package ddit.finalproject.team2.util;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import ddit.finalproject.team2.vo.UserVo;

public class CustomSessionBindingListener implements HttpSessionBindingListener{
	
	
	
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
//		System.err.println("생성 : " + event.getName()+" / "+event.getSession().getId());
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
//		Authentication au = SecurityContextHolder.getContext().getAuthentication();
//		UserVo user = (UserVo) au.getPrincipal();
//		System.out.println(user.getUser_id());
//		System.err.println(event.getName()+" / "+event.getSession().getId());
	}

}
