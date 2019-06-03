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
public class Lsy_QuizAnswerVo implements Serializable{
	@NotNull private String quizAnswer_code;
	@NotNull private String attend_no;
	@NotNull private String quizProblem_no;
	@NotNull private String question_no;
}
