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
public class OpenSemesterVo {
	@NotNull private String openseme_year;
	@NotNull private String openseme_semester;
	@NotNull private String openseme_no;
	@NotNull private String openseme_attend1;
	@NotNull private String openseme_adjust1;
	@NotNull private String openseme_attend2;
	@NotNull private String openseme_adjust2;
	@NotNull private String openseme_registgrade1;
	@NotNull private String openseme_registgrade2;
	@NotNull private String openseme_registgrade3;
	@NotNull private String openseme_registgrade4;
	@NotNull private String openseme_evaluate1;
	@NotNull private String openseme_evaluate2;
	@NotNull private String openseme_checkgrade1;
	@NotNull private String openseme_checkgrade2;
	@NotNull private String openseme_checkgrade3;
	@NotNull private String openseme_checkgrade4;
	@NotNull private String openseme_period1;
	@NotNull private String openseme_period2;
}
