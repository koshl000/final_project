package ddit.finalproject.team2.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="user_id")
@ToString
public class KJE_SRVo {
	
	private String user_name;
	private String user_id;
	private String user_regno;
	private String birthDay;
	private String user_add1;
	private String user_add2;
	private String lower_organization;
	private String admission;
	private String today;
	
	
	
}
