package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="quizanswer_code")
@ToString
public class QuizAnswerVo implements Serializable{
	@NotNull private String quizanswer_code;
	@NotNull private String attend_no;
	@NotNull private String quizproblem_no;
	@NotNull private String question_no;
}
