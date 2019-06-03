package ddit.finalproject.team2.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="quizProblem_no")
@ToString(exclude="quizProblem_no")
public class Lsy_QuizProblemVo {
	private String quizProblem_no;
	private String quizProblem_content;
	private String question_no;
}
