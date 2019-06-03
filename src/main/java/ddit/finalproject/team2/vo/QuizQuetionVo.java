package ddit.finalproject.team2.vo;

import lombok.ToString;

import lombok.EqualsAndHashCode;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;

import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="question_no")
@ToString(exclude="question_content")
public class QuizQuetionVo implements Serializable{
	@NotNull private String question_no;
	@NotNull private String question_content;
	@NotNull private String question_answer;
	private String videoweek_code;
	private String lecture_code;
}
