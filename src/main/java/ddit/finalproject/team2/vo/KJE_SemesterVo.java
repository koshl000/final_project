package ddit.finalproject.team2.vo;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;


@NoArgsConstructor
@Data
@EqualsAndHashCode(of="openseme_no")
@ToString
public class KJE_SemesterVo {
	
	@NotNull private String openseme_year;
	@NotNull private String openseme_semester;
	@NotNull private String openseme_no;

}
