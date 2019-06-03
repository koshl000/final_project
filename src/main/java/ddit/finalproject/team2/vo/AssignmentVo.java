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
@EqualsAndHashCode(of="assignment_no")
@ToString
public class AssignmentVo implements Serializable{
	@NotNull
	private String assignment_no;
	@NotNull
	private String assignment_title;
	@NotNull
	private String assignment_date;
	@NotNull
	private Date submit_period1;
	@NotNull
	private String class_identifying_code;
	@NotNull
	private Date submit_period2;
	@NotNull
	private String lecture_code;
	
	private String assignment_content;
}
