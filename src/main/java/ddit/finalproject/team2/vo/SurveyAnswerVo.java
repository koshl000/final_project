package ddit.finalproject.team2.vo;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="answer_no")
@ToString
public class SurveyAnswerVo implements Serializable{
	@NotNull private String answer_no;
	@NotNull private String problem_no;
	@NotNull private Date submit_date;
	@NotNull private String attend_no;
}
