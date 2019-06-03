package ddit.finalproject.team2.vo;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@ToString
public class KJE_TimeStatisticsVo {
	@NotNull private String noa;
	@NotNull private String time;
}
