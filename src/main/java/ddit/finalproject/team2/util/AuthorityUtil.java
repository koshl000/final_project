package ddit.finalproject.team2.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.Authentication;

import ddit.finalproject.team2.vo.CustomGrantedAuthority;

public class AuthorityUtil {
	public static List<String> getAuthorityList(Authentication au){
		List<CustomGrantedAuthority> authenticatedAuths = (List<CustomGrantedAuthority>) au.getAuthorities();
		List<String> authorities = new ArrayList<>();
		
		for(int i=0; i<authenticatedAuths.size(); i++){
			authorities.add(authenticatedAuths.get(i).getAuthority());
		}
		
		return authorities;
	}
}
