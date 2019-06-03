package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of={"attend_no", "videoweek_code"})
@ToString
public class StudyStateVo implements Serializable{
	@NotNull private String attend_no;
	@NotNull private String replay_time;
	@NotNull private String videoweek_code;
	@NotNull private String lecture_code;
	@NotNull private String isplaying;
}
