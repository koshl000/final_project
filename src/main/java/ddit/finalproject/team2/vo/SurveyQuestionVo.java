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
@ToString(exclude="survey_content")
public class SurveyQuestionVo implements Serializable{
	private String survey_content;
	@NotNull private String survey_no;
	@NotNull private String question_no;
}
