package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="user_id")
@ToString
public class StudentVo implements Serializable{
	@NotNull private String user_id;
	@NotNull private String lower_organization;
	@NotNull private String current_year;
	@NotNull private String enrollment;
	@NotNull private String stud_degree;
	private String face_id;
}
