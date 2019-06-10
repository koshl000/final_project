package ddit.finalproject.team2.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode
@ToString
public class Ljs_GradeDetailVo implements Serializable{
	private String user_id;
	private String openseme_no;
	
	private LectureVo lecture;
	private String professor_name;
	private GradeVo grade;
	private String rank;
	
	public Ljs_GradeDetailVo(String user_id, String openseme_no){
		this.user_id = user_id;
		this.openseme_no = openseme_no;
	}
}
