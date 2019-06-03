package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="quizproblem_no")
@ToString
public class QuizProblemVo implements Serializable{
	@NotNull private String quizproblem_no;
	@NotNull private String quizproblem_content;
	@NotNull private String question_no;
}
