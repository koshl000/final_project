package ddit.finalproject.team2.common.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import ddit.finalproject.team2.common.dao.IAuthDao;
import ddit.finalproject.team2.common.dao.IUserDao;
import ddit.finalproject.team2.vo.UserVo;

@Service
public class CustomUserDetailService implements UserDetailsService{
	
	@Inject
	IUserDao userDao;
	@Inject
	IAuthDao authDAO;
	
	@Override
	public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {
		UserVo user = null;
		user = userDao.selectUser(user_id);
		if(user==null){
			throw new UsernameNotFoundException(user_id+"에 해당하는 회원 없음");
		}
		List<GrantedAuthority> authorities = authDAO.selectAuthoritiesByUsername(user_id);
		user.setAuthorities(authorities);
		return user;
	}

}





