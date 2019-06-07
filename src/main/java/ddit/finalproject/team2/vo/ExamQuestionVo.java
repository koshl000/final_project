package ddit.finalproject.team2.vo;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of={"exam_no", "question_no"})
@ToString
public class ExamQuestionVo {
	@NotNull private String question_no;
	@NotNull private String subjective_answer;
	@NotNull private String exam_no;
	@NotNull private String question_content;
	@NotNull private String objective_answer;
}
