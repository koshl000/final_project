package ddit.finalproject.team2.vo;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="issue_code")
@ToString
public class KJE_ChatBotScheduleResponseVo {
	@NotNull
	private String scheduleName;
	@NotNull
	private String startSchedule;
	@NotNull
	private String endSchedule;
	
}
