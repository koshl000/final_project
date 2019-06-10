package ddit.finalproject.team2.vo;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Lsy_EmbraceExamVo {
	private List<Lsy_ExamVo> examList;
	private String exam_no;
	private String lecture_code;
	private Integer problem_no_pre_seq;
	private Integer problem_no_suf_seq;
	private String problem_no_seq;
}
