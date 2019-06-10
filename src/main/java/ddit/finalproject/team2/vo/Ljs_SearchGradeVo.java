package ddit.finalproject.team2.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="semester")
@ToString
public class Ljs_SearchGradeVo implements Serializable{
	private String attend_no;
	
	private String seme;
	private String grade;
	private String totalLecture;
	private String completeLecture;
	private String completeCredit;
	private String totalGrade;
	private String totalAverage;
	private String accumulateAverage;
	
	private StudentVo me;
	private OpenSemesterVo semester;
	private List<LectureVo> lectureList;
	private List<GradeVo> averageList;
	
	public void setSeme(String seme, String openseme_no){
		this.seme = "<a href='searchGrade/"+openseme_no+"/detail'>"+seme+"</a>";
	}
}
