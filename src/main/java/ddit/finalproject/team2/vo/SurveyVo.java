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
@EqualsAndHashCode(of="survey_no")
@ToString
public class SurveyVo implements Serializable{
	@NotNull private String survey_no;
	@NotNull private String survey_type;
	@NotNull private String survey_title;
	@NotNull private String survey_writer;
	@NotNull private Date survey_date;
	@NotNull private String survey_deadline;
	@NotNull private String survey_hit;
	@NotNull private String lecture_code;
}
