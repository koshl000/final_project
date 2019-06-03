package ddit.finalproject.team2.common.dao;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Repository;

@Repository
public interface IAuthDao {
	public List<GrantedAuthority> selectAuthoritiesByUsername(String user_id);
}
