package ddit.finalproject.team2.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode
@ToString
public class Ljs_SearchGradeVo implements Serializable{
	private String user_id;
	private OpenSemesterVo semester;
	private List<LectureVo> lectureList;
	private List<GradeVo> averageList;
}
