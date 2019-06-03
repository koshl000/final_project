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
@EqualsAndHashCode(of="lecture_code")
@ToString
public class KJE_StlectureVo {
	@NotNull private String lecture_code;
	@NotNull private String user_id;
	@NotNull private String user_name;
	@NotNull private String lecture_name;
	@NotNull private String lower_organization;
	
}
