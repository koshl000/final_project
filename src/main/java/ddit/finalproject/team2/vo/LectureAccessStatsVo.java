package ddit.finalproject.team2.vo;

import java.util.Date;

import javax.validation.constraints.NotNull;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="lec_acc_sta_no")
@ToString
public class LectureAccessStatsVo implements Serializable{
	@NotNull private String lec_acc_sta_no;
	@NotNull private Date connection_time;
	@NotNull private String acc_ip;
	@NotNull private String attend_no;
}
