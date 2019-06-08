package ddit.finalproject.team2.vo;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of={"exam_no", "evalstudy_code"})
@ToString
public class Ljs_ExamVo implements Serializable{
	@NotNull
	private String exam_no;
	@NotNull
	private String exam_type; //해당 시험의 유형('중간', '기말')
	@NotNull
	private String evalstudy_code; //해당 시험의 반영비율 코드
	
	private List<ExamQuestionVo> questionList; //해당 시험의 문제,정답 리스트
	private List<ExamAnswerVo> answerList; //해당 시험에 대한 학생의 답안 리스트
}
