package ddit.finalproject.team2.vo;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode
@ToString
public class UserVo implements Serializable, UserDetails{
	
	@NotNull private String user_pass;
	@NotNull private String user_name;
	@NotNull private String user_regno;
	@NotNull private String user_hp;
	@NotNull private String user_mail;
	@NotNull private String user_add1;
	@NotNull private String user_add2;
	@NotNull private String user_id;
	@NotNull private String user_profile_path;
	@NotNull private String user_authority;
	
	private List<GrantedAuthority> authorities;
	private List<AttendVo> attendNoList;
	private List<LectureVo> lectureList;
	
	private String face_id;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	@Override
	public String getPassword() {
		return user_pass;
	}

	@Override
	public String getUsername() {
		return user_id;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	
	
	public UserVo(String user_id){
		this.user_id = user_id;
	}
}
