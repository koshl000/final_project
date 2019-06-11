package ddit.finalproject.team2.vo;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Lsy_ExamVo {
	private String exam_no; //시험번호
	private String exam_type; //시험종류
	private String evalStudy_code; //학습평가코드
	private String evalStudy_type;
	private List<Lsy_ExamQuestionVo> questionList; //문제리스트
}
