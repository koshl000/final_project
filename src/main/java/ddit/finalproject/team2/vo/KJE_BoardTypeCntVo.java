package ddit.finalproject.team2.vo;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@ToString
public class KJE_BoardTypeCntVo {
	@NotNull private String board_type;
	@NotNull private String board_cnt;
	
}
