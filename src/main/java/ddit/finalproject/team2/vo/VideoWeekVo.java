package ddit.finalproject.team2.vo;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="videoweek_code")
@ToString
public class VideoWeekVo implements Serializable{
	@NotNull private String lecture_code;
	@NotNull private String file_no;
	@NotNull private String videoweek_class;
	@NotNull private String videoweek_week;
	@NotNull private Date videoweek_date;
	@NotNull private String videoweek_code;
}
