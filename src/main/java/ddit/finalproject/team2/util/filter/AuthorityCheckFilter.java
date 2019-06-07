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
import ddit.finalproject.team2.vo.LectureVo;
import ddit.finalproject.team2.vo.UserVo;

public class AuthorityCheckFilter implements Filter{
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		String url = req.getRequestURL().toString();
		String[] urlArr = url.split("/subjectPage/");
		if(urlArr.length>1){
			String lecture_code = urlArr[1].split("/")[0];
			Authentication au = (Authentication)req.getUserPrincipal();
			UserVo user = (UserVo) au.getPrincipal();
			List<LectureVo> lectureList = user.getLectureList();
			if(!lectureList.isEmpty()){
				if(AuthorityUtil.getAuthorityList(au).contains(AuthConstants.ROLE_STUDENT)){
					if(!lectureList.contains(new LectureVo(lecture_code))){
						throw new AccessDeniedException("강제중단");
					}
				}
				if(AuthorityUtil.getAuthorityList(au).contains(AuthConstants.ROLE_PROFESSOR)){
					boolean flag = false;
					for(LectureVo lec : lectureList){
						if(lec.getUser_id().equals(user.getUser_id())){
							flag = true;
							break;
						}
					}
					if(!flag){
						throw new AccessDeniedException("강제중단");
					}
				}
			}else{
				throw new AccessDeniedException("강제중단");
			}
		}
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
	}

}
