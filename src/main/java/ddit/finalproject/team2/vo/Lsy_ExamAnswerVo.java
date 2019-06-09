package ddit.finalproject.team2.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Lsy_ExamAnswerVo {
	private String exam_no; //시험번호
	private String attend_no; //수강번호
	private String question_no; //문제번호
	private String problem_no; //학생이 선택한 답
	private String answer_no; //시퀀스 
	private String subjective_answer; //주관식답
}
