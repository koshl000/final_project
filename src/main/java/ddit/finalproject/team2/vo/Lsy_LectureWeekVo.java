package ddit.finalproject.team2.vo;

import java.util.List;

import lombok.Data;

@Data
public class Lsy_LectureWeekVo {
	private String lecture_code;
	private String lecture_week;
	private List<Lsy_LectureWeekClassVo> lectureWeekClass;
}
