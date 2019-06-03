package ddit.finalproject.team2.vo;

import org.springframework.security.core.GrantedAuthority;

import lombok.Data;

@Data
public class CustomGrantedAuthority implements GrantedAuthority {
	
	private String authority;
	private String role_name;

	@Override
	public String getAuthority() {
		return authority;
	}

}
