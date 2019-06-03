package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="log_no")
@ToString
public class FacechatLogVo implements Serializable{
	@NotNull private String log_no;
	@NotNull private String start_time;
	@NotNull private String end_time;
	@NotNull private String attend_no;
}
