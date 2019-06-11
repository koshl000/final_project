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
@EqualsAndHashCode(of="class_identifying_code")
@ToString
public class Jch_LectureWeekVo implements Serializable{
	private String lecture_subname;
	private String lecture_code;
	private String lecture_class;
	private String lecture_week;
	private String class_identifying_code;
	private List<Jch_LectureWeekVo> lecWeek_list;
}
