package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="answer_no")
@ToString
public class ExamAnswerVo implements Serializable{
	@NotNull private String exam_no;
	@NotNull private String attend_no;
	@NotNull private String question_no;
	@NotNull private String problem_no;
	@NotNull private String answer_no;
	private String subjectanswer;
}
