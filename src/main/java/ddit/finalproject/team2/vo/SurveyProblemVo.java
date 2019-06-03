package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="problem_no")
@ToString(exclude="problem_content")
public class SurveyProblemVo implements Serializable{
	@NotNull private String problem_no;
	@NotNull private String problem_content;
	@NotNull private String question_no;
	@NotNull private String survey_no;
}
