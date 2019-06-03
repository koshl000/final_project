package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="file_no")
@ToString
public class VideoFileVo implements Serializable{
	@NotNull private String file_no;
	@NotNull private String file_url;
	@NotNull private String file_name;
	@NotNull private String videofile_time;
}
