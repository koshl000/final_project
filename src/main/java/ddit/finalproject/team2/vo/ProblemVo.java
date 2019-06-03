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
@ToString
public class ProblemVo implements Serializable{
	@NotNull private String problem_no;
	@NotNull private String problem_content;
	@NotNull private String exam_no;
	@NotNull private String question_no;
}
