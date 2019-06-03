package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="graderank_no")
@ToString
public class GradeRankVo implements Serializable{
	@NotNull private String graderank_no;
	@NotNull private String graderank_rank;
	@NotNull private String graderank_max;
	@NotNull private String graderank_min;
	@NotNull private String evalpolicy_code;
	@NotNull private String graderank_ratio;
}
