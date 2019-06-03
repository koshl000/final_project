package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="voicefile_no")
@ToString
public class VoiceFileVo implements Serializable{
	@NotNull private String voicefile_no;
	@NotNull private String voicefile_url;
	@NotNull private String voicefile_name;
	@NotNull private String voicefile_time;
	@NotNull private String file_no;
}
