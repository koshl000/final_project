package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="grade_no")
@ToString
public class GradeVo implements Serializable{
	@NotNull private String grade_no;
	private String grade_midterm;
	private String grade_final;
	private String grade_assignment;
	private String grade_absence;
	@NotNull private String attend_no;
}
