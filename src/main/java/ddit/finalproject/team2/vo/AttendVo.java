package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="attend_no")
@ToString
public class AttendVo implements Serializable{
	@NotNull
	private String user_id;
	@NotNull
	private String attend_no;
	@NotNull
	private String lecture_code;

	public AttendVo(String user_id, String lecture_code){
		this.user_id = user_id;
		this.lecture_code = lecture_code;
	}
	
	private String user_name;
}
