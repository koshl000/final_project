package ddit.finalproject.team2.vo;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="user_id")
@ToString
public class KJE_OperationStatisticsVo {
	@NotNull private String major_cnt;
	@NotNull private String nonmajor_cnt;
	@NotNull private String lecture_cnt;
	@NotNull private String lecture_currentsum;
	
}
