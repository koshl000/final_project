package ddit.finalproject.team2.vo;

import java.util.List;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Lsy_ExamQuestionVo {
	private String subjective_answer; //주관식답
	private String objective_answer; //객관식답
	private String question_no; //문제번호
	private String exam_no; //시험번호
	private String question_content; //문제내용
	private List<Lsy_ExamProblemVo> problemList; //답리스트
	private String exam_type;
}