package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="portal_no")
@ToString
public class PortalAccessStatsVo implements Serializable{
	@NotNull private String portal_visit_time;
	@NotNull private String portal_no;
	private String user_id;
	@NotNull private String access_ip;
}
