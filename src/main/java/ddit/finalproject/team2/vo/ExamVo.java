package ddit.finalproject.team2.vo;

import lombok.EqualsAndHashCode;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;

import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="exam_no")
@ToString
public class ExamVo implements Serializable{
	@NotNull
	private String exam_no;
	@NotNull
	private String exam_type;
	@NotNull
	private String evalstudy_code;
}
