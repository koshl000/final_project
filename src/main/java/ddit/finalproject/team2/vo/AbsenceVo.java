package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="absence_no")
@ToString
public class AbsenceVo implements Serializable{
	@NotNull
	private String absence_no;
	@NotNull
	private String absence_yn;
	@NotNull
	private String attend_no;
	@NotNull
	private String absence_week;
	@NotNull
	private String absence_class;
}
