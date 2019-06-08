package ddit.finalproject.team2.vo;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="lecture_code")
@ToString
public class KJE_attendApplyVo implements Serializable{
	
	@NotNull private String lecture_code;
	 private String subject_code;
	 private String user_id;
	 private String attend_no;
	 private String lecture_coursetype;
	 private String lecture_name;
	 private String lecture_credit;
	 private String lecture_current;
	 private String lecture_target;
	 private String openseme_no;
	 private String lecture_capacity;
	 private String mid_date;
	 private String final_date;
	 private String pro_name;
	 private String pro_id;
	 private String lower_organization;
	 private String buttonView;
	 private String buttonApply;
	 

}
