package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="recog_no")
@ToString
public class FaceFileVo implements Serializable{
	@NotNull private String user_id;
	@NotNull private String recog_no;
	@NotNull private String file_path;
	@NotNull private String file_name;
}
