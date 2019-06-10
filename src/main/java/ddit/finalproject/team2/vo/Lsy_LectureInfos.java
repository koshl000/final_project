package ddit.finalproject.team2.vo;

import java.util.List;

import lombok.Data;

@Data
public class Lsy_LectureInfos {
	private String lecture_code; 
	private String user_id;
	private String lecture_coursetype;
	private String lecture_name;
	private String lecture_credit;
	private String lecture_target;
	private String lecture_current;
	private String lecture_capacity;
	private String lower_organization;
	private List<Lsy_LectureWeekVo> lectureWeekInfos;
}
