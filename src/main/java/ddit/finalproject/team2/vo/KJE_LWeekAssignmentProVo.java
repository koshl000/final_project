package ddit.finalproject.team2.vo;

import java.util.Date;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@ToString
public class KJE_LWeekAssignmentProVo {
	
	private String assignment_no;
	@NotNull
	private String lecture_code;
	@NotNull
	private String lecture_week;
	@NotNull
	private String lecture_class;
	
	private String class_identifying_code;
	private String lecture_subname;
	private String assignment_date;
	private String submit_period1;
	private String submit_period2;
	
	private String btnInsert;
	private String btnView;
	
	
}
