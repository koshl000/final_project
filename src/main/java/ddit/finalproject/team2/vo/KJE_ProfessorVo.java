package ddit.finalproject.team2.vo;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="user_id")
@ToString
public class KJE_ProfessorVo {
	
	@NotNull private String user_id;
	@NotNull private String user_name;
}
