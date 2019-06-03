package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="question_no")
@ToString(exclude="question_content")
public class QuestionVo implements Serializable{
	@NotNull private String question_no;
	@NotNull private String subjective_answer;
	@NotNull private String exam_no;
	@NotNull private String question_content;
	@NotNull private String objective_answer;
}
