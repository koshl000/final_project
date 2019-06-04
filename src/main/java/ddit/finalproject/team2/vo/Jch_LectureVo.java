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
public class Jch_LectureVo implements Serializable{
	@NotNull private String lower_organization;
	@NotNull private String lecture_current;
	@NotNull private String lecture_code;
	@NotNull private String user_id;
	@NotNull private String lecture_coursetype;
	@NotNull private String lecture_name;
	@NotNull private String lecture_credit;
	@NotNull private String lecture_target;
	@NotNull private String openseme_no;
	@NotNull private String lecture_capacity;
	@NotNull private Date mid_date;
	@NotNull private Date final_date;
	
}
