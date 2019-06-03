package ddit.finalproject.team2.vo;

import lombok.EqualsAndHashCode;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;

import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="evalstudy_code")
@ToString
public class EvaluationStudyVo implements Serializable{
	@NotNull
	private String evalstudy_code;
	@NotNull
	private String evalstudy_type;
	@NotNull
	private String evalstudy_ratio;
	@NotNull
	private String lecture_code;
}
