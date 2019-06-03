package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="lecture_code")
@ToString(exclude="introduction")
public class LecturePlanVo implements Serializable{
	@NotNull private String lecture_code;
	@NotNull private String week_content;
	@NotNull private String assignment_info;
	@NotNull private String introduction;
	@NotNull private String lec_plan_summary;
	@NotNull private String lec_plan_method;
	@NotNull private String book_material;
}
