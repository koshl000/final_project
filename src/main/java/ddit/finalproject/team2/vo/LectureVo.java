package ddit.finalproject.team2.vo;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="lecture_code")
@ToString
public class LectureVo implements Serializable{
	@NotNull private String lecture_code;
	@NotNull private String user_id;
	@NotNull private String lecture_coursetype;
	@NotNull private String lecture_name;
	@NotNull private String lecture_credit;
	@NotNull private String lecture_current;
	@NotNull private String lecture_target;
	@NotNull private String openseme_no;
	@NotNull private String lecture_capacity;
	@NotNull private Date mid_date;
	@NotNull private Date final_date;
	private String syllabusBtn = "<button type='button' class='btn btn-default notika-btn-default syllabus'>보기</button>";
	private String openBtn;
	
	public LectureVo(String lecture_code){
		this.lecture_code = lecture_code;
	}
	
	public LectureVo(String lecture_code, String openseme_no){
		this.lecture_code = lecture_code;
		this.openseme_no = openseme_no;
	}
	
	public void setLecture_name(String lecture_name, String lecture_code){
		this.lecture_name = "<a href='searchGrade/"+lecture_code+"'>"+lecture_name+"</a>";
	}
	
	public void setLecture_nameForMyLecture(String lecture_name, String lecture_code){
		this.lecture_name = "<a target='_blank' href='subjectPage/"+lecture_code+"/eduGoal'>"+lecture_name+"</a>";
	}
	
	public void setOpenBtn(String lecture_code){
		this.openBtn = "<button type='button' class='btn btn-default notika-btn-default open' id='"+lecture_code+"'>개설</button>";
	}
}
