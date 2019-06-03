package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="subject_code")
@ToString
public class SubjectVo implements Serializable{
	@NotNull private String subject_code;
	@NotNull private String lower_organization;
	@NotNull private String subject_name;
}
