package ddit.finalproject.team2.vo;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode
@ToString
public class Jch_SMSGroupVo implements Serializable{
	@NotNull private String smsgroup_no;
	@NotNull private String smsgroup_name;
	
	private String user_count;
	private List<Jch_UserVo> smsgroup_list;
	
	private String checkbox = "<input type='checkbox' name='groupCheck' class='groupCheckbox' />";
	private String sendButton = "<button type='button' class='sendButton'>SMS작성</button>";
	private String updateButton = "<button type='button' class='updateButton'>수정</button>";
	private String deleteButton = "<button type='button' class='deleteButton'>삭제</button>";
	
	
	public Jch_SMSGroupVo(String smsgroup_no, List<Jch_UserVo> smsgroup_list) {
		super();
		this.smsgroup_no = smsgroup_no;
		this.smsgroup_list = smsgroup_list;
	}
}
