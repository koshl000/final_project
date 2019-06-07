package ddit.finalproject.team2.util.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;

import ddit.finalproject.team2.util.AuthorityUtil;
import ddit.finalproject.team2.util.constant.AuthConstants;
import ddit.finalproject.team2.vo.UserVo;

public class FaceIdCheckFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		Authentication au = (Authentication) ((HttpServletRequest)request).getUserPrincipal();
		UserVo user = (UserVo) au.getPrincipal();
		List<String> authList = AuthorityUtil.getAuthorityList(au);
		if(authList.contains(AuthConstants.ROLE_STUDENT)){
			if(user.getFace_id()==null){
				throw new AccessDeniedException("강제중단");
			}
		}
		doFilter(request, response, chain);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
