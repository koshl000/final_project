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
public class ProfessorVo implements Serializable{
	@NotNull private String user_id;
	@NotNull private String lower_organization;
	@NotNull private String prof_degree;
	@NotNull private String degree_major;
	@NotNull private String main_major;
	@NotNull private String sub_major;
	@NotNull private String position;
}
