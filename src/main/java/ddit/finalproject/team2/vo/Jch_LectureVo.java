package ddit.finalproject.team2.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="lecture_code")
@ToString
public class Jch_LectureVo implements Serializable{
	private String lower_organization;
	@NotNull private String lecture_current;
	@NotNull private String lecture_code;
	@NotNull private String user_id;
	@NotNull private String lecture_coursetype;
	@NotNull private String lecture_name;
	@NotNull private String lecture_credit;
	@NotNull private String lecture_target;
	private String openseme_no;
	@NotNull private String lecture_capacity;
	@NotNull private Date mid_date;
	@NotNull private Date final_date;
	
	private String openseme_year;
	private String openseme_semester;
	private String user_name;
	private int checklec;
	private int checkplan;
	
	private List<Jch_LectureVo> lowerList;
	
	private String lecUpdateBtn = "<button class='btn btn-default notika-btn-default waves-effect lecUpdateBtn'>강의정보수정</button>";
	private String lecturePlanBtn = "<button class='btn btn-default notika-btn-default waves-effect lecturePlan'>강의계획서</button>";
	private String lectureAddBtn ;
	
	private String videoBtn = "<button class='btn btn-default notika-btn-default waves-effect'>보기</button>"
						+ "<button class='btn btn-default notika-btn-default waves-effect'>등록</button>"
						+ "<button class='btn btn-default notika-btn-default waves-effect'>수정</button>";
	private String quizeBtn = "<button class='btn btn-default notika-btn-default waves-effect'>보기</button>"
						+ "<button class='btn btn-default notika-btn-default waves-effect'>등록</button>"
						+ "<button class='btn btn-default notika-btn-default waves-effect'>수정</button>";
	private String examBtn = "<button class='btn btn-default notika-btn-default waves-effect'>보기</button>"
						+ "<button class='btn btn-default notika-btn-default waves-effect'>등록</button>"
						+ "<button class='btn btn-default notika-btn-default waves-effect'>수정</button>";
	
}
