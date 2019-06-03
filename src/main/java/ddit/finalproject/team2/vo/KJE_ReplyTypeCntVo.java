package ddit.finalproject.team2.vo;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@ToString
public class KJE_ReplyTypeCntVo {
	@NotNull private String lecture_code;
	@NotNull private String reply_cnt;
}
