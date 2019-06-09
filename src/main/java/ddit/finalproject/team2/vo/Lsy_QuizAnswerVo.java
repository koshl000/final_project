package ddit.finalproject.team2.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

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
	@NotNull private String stSelect_no;
	@NotNull private String question_no;
	
//	 		private String[] quizProblem_no_div;
//	 		private List<String> quizAnswer_code_div = new ArrayList<String>();
	 		
//	public void splitQuizproblem_no() {
//		quizProblem_no_div = this.quizProblem_no.split(",");
//	}
	
//	public void splitQuizAnswer_code(String keyVal) {
//		this.quizAnswer_code_div.add(keyVal);
//	}
	
	
}
